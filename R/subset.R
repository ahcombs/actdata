#' epa_subset
#'
#' EPA summary statistics dictionary search and subset
#'
#' @param expr A term, regular expression, or list of terms or regexs to search. If a list is provided, entries will be treated as separated by "or", so all terms matching one or more of the entries will be returned. Default matches all terms.
#' @param exactmatch Logical indicating whether the function should return only exact matches to the expression provided. If FALSE (default), all terms containing the expression are returned.
#' @param dataset The key of the dataset (or list of multiple) to search in. Default is "all.
#' @param component The component of the dictionary to use (identity, behavior, modifier, setting). Default is "all."
#' @param datatype Whether to retrieve summary or individual data. Default is summary.
#' @param gender The gender of the dictionary to use (male, female, average). Default is "all." Ignored when datatype is individual.
#' @param stat The statistics to include in the subset that is returned. Default is all, options are mean, sd (standard deviation), cov (covariance), and n (number of raters). Terms that do not contain values for the required statistic will be excluded from the results. Ignored if datatype is individual.
#' @param stat_na_exclude Ignored if stat is not specified of datatype is individual. A logical indicating whether to exclude entries with NA values for any of the required statistics. Default is TRUE.
#' @param instcodes Logical, whether to include the institution codes in the output. Default is TRUE.
#'
#' @return FALSE if the provided term or expression is not in any provided dictionary. If it occurs at least once, returns the subset of the dictionary(s) of interest where the term matches the provided expression.
#' @export
epa_subset <- function(expr = ".*", exactmatch = FALSE,
                       dataset = "all", component = "all",
                       datatype = "summary", gender = "all", stat = "all",
                       stat_na_exclude = TRUE, instcodes = TRUE,
                       institutions = "all", drop.na.instcodes = FALSE){
  # TODO datasets are different for summary and individual
  if(all(datatype != "summary")){
    check_datatype(datatype)
    datatype <- standardize_option(datatype, "datatype")
  }
  if(all(dataset != "all")){
    check_dataset(dataset, datatype)
  }
  if(all(component != "all")){
    check_component(component)
    component <- standardize_option(component, "component")
  }
  if(all(institutions != "all")){
    check_institutions(institutions)
  }
  if(!is.logical(drop.na.instcodes)){
    stop("drop.na.instcodes must be logical.")
  }
  if(all(gender != "all")){
    check_gender(gender)
    gender <- standardize_option(gender, "gender")
  }
  if(all(stat != "all")){
    check_stat(stat)
    stat <- standardize_option(stat, "stat")
  }

  if(!is.character(expr)){
    stop("Must provide a character expression or vector")
  }
  if(!is.logical(exactmatch)){
    stop("exactmatch parameter must be TRUE or FALSE")
  }

  if(!is.logical(instcodes)){
    stop("instcodes parameter must be TRUE or FALSE")
    # TODO later: add better support for filtering by institution.
  }

  # if exactmatch is true, stick ^ on the beginning and $ on the end of each expr (if not there already)
  if(exactmatch){
    for(i in 1:length(expr)){
      if(substr(expr[i], 1, 1) != "^"){
        expr[i] <- paste0("^", expr[i])
      }
      if(substr(expr[i], nchar(expr[i]), nchar(expr[i])) != "$"){
        expr[i] <- paste0(expr[i], "$")
      }
    }
  }

  # if a list of regexes has been provided, concatenate together (treat as "or")
  if(length(expr) > 1){
    expr <- paste0("(", paste(expr, collapse = ")|("), ")")
  }

  if(datatype == "summary"){
    subset <- actdata::epa_summary_statistics[grepl(expr, actdata::epa_summary_statistics$term),]
  } else if (datatype == "individual"){
    subset <- actdata::individual[grepl(expr, actdata::individual$term),]
  }


  if(all(dataset != "all")){
    k <- dataset
    if(datatype == "individual" & any(dataset == "usfullsurveyor2015")){
      k <- c(k, "dukestudent2015", "dukecommunity2015", "uga2015")
    } else if(datatype == "individual" & any(dataset == "usstudent2015")){
      k <- c(k, "dukestudent2015", "uga2015")
    }
    subset <- subset %>%
      dplyr::filter(dataset %in% k)
  }

  if(all(component != "all")){
    c <- component
    subset <- subset %>%
      dplyr::filter(component %in% c)
  }

  # I will ignore the gender parameter for the individual data--if I'm
  # not providing filters on other variables (which would get excessive
  # I think; it's easy enough to filter in dplyr) then there's no reason
  # to supply it for gender.
  if(all(gender != "all") & datatype == "summary"){
    g <- gender
    subset <- subset %>%
      dplyr::filter(gender %in% g)
  }

  if(all(stat != "all") & datatype == "summary"){
    if(!("cov" %in% stat)){
      subset <- dplyr::select(subset, -dplyr::starts_with("cov"))
    }
    if(!("sd" %in% stat)){
      subset <- dplyr::select(subset, -dplyr::starts_with("sd"))
    }
    if(!("n" %in% stat)){
      subset <- dplyr::select(subset, -dplyr::starts_with("n"))
    }
    if(!("mean" %in% stat)){
      subset <- dplyr::select(subset, -"E", -"P", -"A")
    }

    if(stat_na_exclude){
      if("cov" %in% stat){
        subset <- dplyr::filter(subset, dplyr::if_any(dplyr::starts_with("cov"), ~ !is.na(.x)))
      }
      if("sd" %in% stat){
        subset <- dplyr::filter(subset, dplyr::if_any(dplyr::starts_with("sd"), ~ !is.na(.x)))
      }
      if("n" %in% stat){
        subset <- dplyr::filter(subset, dplyr::if_any(dplyr::starts_with("n"), ~ !is.na(.x)))
      }
      if("mean" %in% stat){
        subset <- dplyr::filter(subset, dplyr::if_any(c("E", "P", "A"), ~ !is.na(.x)))
      }
    }
  }

  if(drop.na.instcodes){
    subset <- subset %>%
      dplyr::filter(!is.na(instcodes))
  }

  if(all(institutions != "all")){
    goodinsts <- institutions[institutions %in% c(
      "term", "component",
      "male", "female",
      "overt", "surmised",
      "place", "time",
      "lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual",
      "monadic", "group", "corporal",
      "adjective", "adverb",
      "emotion", "trait", "status", "feature", "emotion_spiral"
    )]

    # want to treat institution lists as an "or"--term must belong to at least one of the provided institutions
    todrop <- expand_instcode_cols(subset, na.sub = NA) %>%
      dplyr::mutate(keep = dplyr::across(dplyr::all_of(goodinsts), ~ !(is.na(.) | . == FALSE))) %>%
      dplyr::rowwise() %>%
      dplyr::mutate(drop = all(dplyr::across(starts_with("keep"), ~ .x == FALSE))) %>%
      dplyr::filter(drop == TRUE) %>%
      dplyr::select(dplyr::any_of(c("term", "component", "dataset", goodinsts))) %>%
      dplyr::distinct()

    subset <- subset %>%
      suppressMessages(dplyr::anti_join(todrop))
  }

  if(!instcodes){
    subset <- dplyr::select(subset, -instcodes)
  }

  if(nrow(subset) == 0){
    warning("The search did not match any dictionary entries.")
    return(FALSE)
  }

  return(subset)
}


#' Extract single equation data frame
#'
#' @param key the name of the equation set, Call eqn_info() or see package readme for options.
#' @param equation_type the type of the equation. Options: emotionid, impressionabo, impressionabos, selfdir, traitid
#' @param gender gender. Average, female, or male.
#'
#' @return equation dataframe
#' @export
get_eqn <- function(key, equation_type = "impressionabo", gender = "average"){
  gender <- dplyr::case_when(
    gender %in% c("a", "av", "mean") ~ "average",
    gender %in% c("m", "man") ~ "male",
    gender %in% c("f", "woman") ~ "female",
    TRUE ~ gender
  )

  if(!(key %in% actdata::equations$key)){
    stop(paste0("Key ", key, " is not a valid equation key."))
  }

  keysub <- actdata::equations[which(actdata::equations$key == key),]

  if(!(equation_type %in% keysub$equation_type)){
    stop(paste0("Equation type ", equation_type, " is not available for key ", key, "."))
  }

  etsub <- keysub[which(keysub$equation_type == equation_type),]

  if(!(gender %in% etsub$gender)){
    stop(paste0("Gender ", gender, " is not available for key ", key, " and equation type ", equation_type, "."))
  }

  df <- etsub[which(etsub$gender == gender),"df"][[1]][[1]]
  return(df)
}



#' Add logical columns indicating institution membership to dataset
#'
#' @param data a data frame to add institution code columns to. Must contain term and component columns.
#' @param na.sub indicates how to handle institution codes that are NA. Options are: NA (default) for leaving them as NA; TRUE for counting the term as belonging to all institutions; FALSE for counting the term as belonging to no instutitions, and "drop" for dropping them.
#'
#' @return input data frame with institution code columns added.
#' @export
expand_instcode_cols <- function(data, na.sub = NA){
  # requires dataset with a component column and (probably) an instcodes column
  # checks that the data frame is of the correct format
  check_data_frame(data)
  # checks that the institution codes column is there and replaces NAs with correct thing
  data <- check_inst_codes(data, na.sub = na.sub)

  if(!("component" %in% names(data))){
    stop("Data requires a component column")
  }
  if(!("term" %in% names(data))){
    stop("Data requires a term column")
  }

  purrr::walk(data$component, check_component)
  data$component <- as.character(purrr::map(data$component, ~standardize_option(., "component")))

  icodecols <- instcode_to_cols(code = data[1, "instcodes"][[1]], component = data[1, "component"][[1]], term = data[1, "term"][[1]])
  for(i in 2:nrow(data)){
    newrow <- instcode_to_cols(code = data[i, "instcodes"][[1]], component = data[i, "component"][[1]], term = data[i, "term"][[1]])
    icodecols <- suppressMessages(dplyr::full_join(icodecols, newrow))
  }

  icodecols <- dplyr::select(icodecols, any_of(c(
    "term", "component",
    "male", "female",
    "overt", "surmised",
    "place", "time",
    "lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual",
    "monadic", "group", "corporal",
    "adjective", "adverb",
    "emotion", "trait", "status", "feature", "emotion_spiral"
  )))

  data <- data %>%
    dplyr::full_join(icodecols, by = c("term", "component"))
}



#' Convert institution code to a set of logical columns
#'
#' TODO this is extremely slow... but not sure what can really be done about that.
#'
#' @param code an institution code character string
#' @param component the component of the term
#'
#' @return cols a tibble with the relevant categories and logical variables
instcode_to_cols <- function(code, component, term){
  errormessage <- paste0("Instutition codes must be character strings containing only 14 1/0 entries and optional whitespace. Code provided was ", code)

  if(!is.na(code)){
    # code has to be string with 14 1/0s. It can also be NA.
    if(typeof(code) != "character"){
      stop(errormessage)
    }

    code <- gsub("\\s", "", code)
    splitcode <- strsplit(code, split = "")[[1]]

    if(nchar(code) != 14 |
       !(all(splitcode %in% c("0", "1")))){
      stop(errormessage)
    }
  } else {
    splitcode <- rep(NA_character_, 14)
  }

  check_component(component)
  component <- standardize_option(component, "component")

  cols <- tibble::tibble(splitcode) %>%
    dplyr::mutate(splitcode = dplyr::case_when(is.na(splitcode) ~ NA,
                                               splitcode == 1 ~ TRUE,
                                               splitcode == 0 ~ FALSE)) %>%
    t() %>%
    tibble::as_tibble()

  rownames(cols) <- NULL
  if(component == "identity"){
    # are the monadic, group, and corporal categories meaningful for identities? Heise and Boyle seem to disagree.
    # through this, I am following the "export" section in the interact PDF manual. I have verified it in spots.
    names(cols) <- c("male", "female", "lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual", "monadic", "group", "corporal")
  } else if (component == "behavior"){
    names(cols) <- c("overt", "surmised", "lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual", "monadic", "group", "corporal")
  } else if (component == "modifier"){
    # from Interact 2.1: adjective, emotion, trait, status, feature
    # confirmed 7-24-22
    names(cols) <- c("adjective", "adverb",
                     "emotion", "trait", "status", "feature", "emotion_spiral",
                     "placeholder3", "placeholder4", "placeholder5", "placeholder6", "placeholder7", "placeholder8", "placeholder9")
  } else if (component == "setting"){
    # from Interact 2.1: place, time, the nine institutions
    # but what are the last three?
    names(cols) <- c("place", "time", "lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual",
                     "monadic", "group", "corporal")
  }

  cols <- cols %>%
    dplyr::mutate(term = term,
                  component = component)

  return(cols)
}


#' Creates institution code strings from logicals indicating category membership
#'
#' This function returns institution codes in string format that is properly formatted
#' for import to Interact and consistent with typical ACT data practices. Relevant
#' arguments depend on the component. Arguments that do not apply to the given
#' component will be ignored.
#'
#' Identities: male, female, lay, business, law, politics, academe, medicine, religion, family, sexual, monadic, group, corporal
#' Behaviors: overt, surmised, lay, business, law, politics, academe, medicine, religion, family, sexual, monadic, group, corporal
#' Modifiers: adjective, adverb, emotion, trait, status, feature, emotion_spiral
#' Settings: place, time, lay, business, law, politics, academe, medicine, religion, family, sexual, monadic, group, corporal
#'
#' @param component whether the term is an identity, behavior, component, or setting
#' @param male
#' @param female
#' @param overt
#' @param surmised
#' @param place
#' @param time
#' @param lay
#' @param business
#' @param law
#' @param politics
#' @param academe
#' @param medicine
#' @param religion
#' @param family
#' @param sexual
#' @param monadic
#' @param group
#' @param corporal
#' @param adjective
#' @param adverb
#' @param emotion
#' @param trait
#' @param status
#' @param feature
#' @param emotion_spiral
#'
#' @return
#' @export
create_instcode <- function(component,
                            male = F, female = F,
                            overt = F, surmised = F,
                            place = F, time = F,
                            lay = F, business = F, law = F, politics = F, academe = F, medicine = F, religion = F, family = F, sexual = F,
                            monadic = F, group = F, corporal = F,
                            adjective = F, adverb = F,
                            emotion = F, trait = F, status = F, feature = F, emotion_spiral = F){
  # is this a valid component?
  check_component(component)
  component = standardize_option(component, "component")

  # are the rest of the inputs logical?
  log_args <- as.list(environment())
  log_args[["component"]] <- NULL
  for(i in 1:length(log_args)){
    if(!is.logical(log_args[[i]])){
      stop("Institution code inputs must be logical.")
    }
  }

  if(component == "identity"){
    code <- paste0(as.character(as.integer(male)), as.character(as.integer(female)), " ",
                   as.character(as.integer(lay)), as.character(as.integer(business)), as.character(as.integer(law)),
                   as.character(as.integer(politics)), as.character(as.integer(academe)),
                   as.character(as.integer(medicine)), as.character(as.integer(religion)),
                   as.character(as.integer(family)), as.character(as.integer(sexual)), " ",
                   as.character(as.integer(monadic)), as.character(as.integer(group)), as.character(as.integer(corporal)))
  } else if(component == "behavior"){
    code <- paste0(as.character(as.integer(overt)), as.character(as.integer(surmised)), " ",
                   as.character(as.integer(lay)), as.character(as.integer(business)), as.character(as.integer(law)),
                   as.character(as.integer(politics)), as.character(as.integer(academe)),
                   as.character(as.integer(medicine)), as.character(as.integer(religion)),
                   as.character(as.integer(family)), as.character(as.integer(sexual)), " ",
                   as.character(as.integer(monadic)), as.character(as.integer(group)), as.character(as.integer(corporal)))
  } else if(component == "modifier"){
    code <- paste0(as.character(as.integer(adjective)), as.character(as.integer(adverb)), " ",
                   as.character(as.integer(emotion)), as.character(as.integer(trait)), as.character(as.integer(status)),
                   as.character(as.integer(feature)), as.character(as.integer(emotion_spiral)),
                   "0", "0", "0", "0", " ",
                   "0", "0", "0")
  } else if(component == "setting"){
    code <- paste0(as.character(as.integer(place)), as.character(as.integer(time)), " ",
                   as.character(as.integer(lay)), as.character(as.integer(business)), as.character(as.integer(law)),
                   as.character(as.integer(politics)), as.character(as.integer(academe)),
                   as.character(as.integer(medicine)), as.character(as.integer(religion)),
                   as.character(as.integer(family)), as.character(as.integer(sexual)), " ",
                   as.character(as.integer(monadic)), as.character(as.integer(group)), as.character(as.integer(corporal)))
  }

  return(code)
}
