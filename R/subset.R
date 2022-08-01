#' EPA dictionary search and subset
#'
#' Returns a subset of the EPA summary or individual data that fulfills the
#' given parameters. Filtering can be done by term, data set, component (identity,
#' behavior, modifier, setting), type of data (summary or individual), statistics
#' (mean, standard deviation, covariance), institutions the term belongs to, and
#' gender of raters.
#'
#' @param expr A term, regular expression, or list of terms or regexs to search.
#'     If a list is provided, entries will be treated as separated by "or", so
#'     all terms matching one or more of the entries will be returned. Default
#'     matches all terms.
#' @param exactmatch Logical indicating whether the function should return only
#'     exact matches to the expression provided. If FALSE (default), all terms
#'     containing the expression are returned.
#' @param dataset The key of the data set (or list of multiple) to search in.
#'     Default is "all. Call [dict_info()] to see available data sets.
#' @param component The component of the dictionary to use (identity, behavior,
#'     modifier, setting). Default is "all."
#' @param datatype Whether to retrieve summary or individual data. Default is summary.
#' @param gender The gender of the dictionary to use (male, female, average).
#'     Default is "all." Ignored when datatype is individual.
#' @param stat The statistics to include in the subset that is returned. Default is all,
#'     options are mean, sd (standard deviation), cov (covariance), and n (number of
#'     raters). Terms that do not contain values for the required statistic will be
#'     excluded from the results. Ignored if datatype is individual.
#' @param stat_na_exclude Ignored if stat is not specified of datatype is individual.
#'     A logical indicating whether to exclude entries with NA values for any of
#'     the required statistics. Default is TRUE.
#' @param instcodes Logical. Whether to include the institution codes in the
#'     output. Default is TRUE.
#' @param institutions Character list. Institutions to include (defaults to all)
#' @param drop.na.instcodes Logical. When filtering by institution, whether or
#'     not to keep terms which have no institution code.
#'
#' @return a dataset containing the entries that match the given parameters or FALSE
#'     if no matches are found.
#' @export
#'
#' @examples
#' epa_subset("teacher")
#' epa_subset(dataset = "politics2003")
#' epa_subset(expr = ".*woman", component = "identity", gender = c("male", "female"),
#'     institutions = c("lay", "business"))
#' epa_subset(dataset = "morocco2015", stat = "cov", stat_na_exclude = FALSE)
#' epa_subset(dataset = "usmturk2015", datatype = "individual")
epa_subset <- function(expr = ".*", exactmatch = FALSE,
                       dataset = "all", component = "all",
                       datatype = "summary", gender = "all", stat = "all",
                       stat_na_exclude = TRUE, instcodes = TRUE,
                       institutions = "all", drop.na.instcodes = FALSE){
  if(length(datatype) > 1){
    stop("Only one data type may be provided")
  }
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
      dplyr::filter(!is.na(.data$instcodes))
  }

  if(all(institutions != "all")){
    goodinsts <- institutions[institutions %in% c( "term", "component", inst_all)]

    # want to treat institution lists as an "or"--term must belong to at least one of the provided institutions
    todrop <- expand_instcodes(subset, na.sub = "drop") %>%
      suppressMessages() %>%
      dplyr::mutate(keep = dplyr::across(dplyr::all_of(goodinsts), ~ !(is.na(.) | . == FALSE))) %>%
      dplyr::rowwise() %>%
      dplyr::mutate(drop = all(dplyr::across(dplyr::starts_with("keep"), ~ .x == FALSE))) %>%
      dplyr::filter(drop == TRUE) %>%
      dplyr::select(dplyr::any_of(c("term", "component", "dataset", goodinsts))) %>%
      dplyr::distinct()

    subset <- subset %>%
      dplyr::anti_join(todrop) %>%
      suppressMessages()
  }

  if(!instcodes){
    subset <- dplyr::select(subset, -instcodes)
  }

  if(nrow(subset) == 0){
    warning("The search did not match any dictionary entries.")
    return(FALSE)
  }

  # rownames(subset) <- seq(length = nrow(subset))
  subset <- tibble::as_tibble(subset)

  return(subset)
}


#' Extract single equation data frame
#'
#' @param key the name of the equation set, Call [eqn_info()] or see package readme for options.
#' @param equation_type the type of the equation. Options: emotionid, impressionabo, impressionabos, selfdir, traitid
#' @param gender gender. Average, female, or male.
#'
#' @return equation dataframe
#' @export
#'
#' @examples
#' get_eqn("us2010")
#' get_eqn("nc1978", equation_type = "impressionabos", gender = "male")
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
#' @param data a data frame to add institution code columns to. Must
#'     contain term and component columns.
#' @param na.sub indicates how to handle institution codes that are NA.
#'    Options are: NA (default) for leaving them as NA; TRUE for
#'    counting the term as belonging to all institutions; FALSE for
#'    counting the term as belonging to no institutions, and "drop"
#'    for dropping them.
#'
#' @return input data frame with institution code columns added.
#' @export
#'
#' @examples
#' expand_instcodes(epa_subset(dataset = "texas1998"))
expand_instcodes <- function(data, na.sub = NA){
  # requires dataset with a component column and (probably) an instcodes column
  # checks that the data frame is of the correct format
  check_data_frame(data)

  if(!("component" %in% names(data))){
    stop("Data requires a component column")
  }
  if(!("term" %in% names(data))){
    stop("Data requires a term column")
  }

  # checks that the institution codes column is there, standardizes, and replaces NAs with correct thing
  data <- check_inst_codes(data, na.sub = na.sub)

  purrr::walk(data$component[which(!is.na(data$component))], check_component)
  data$component <- as.character(purrr::map(data$component, ~standardize_option(., "component")))

  # if the same term/component combo is in here multiple times, we only need to run the really slow function on it once
  termsubset <- data %>%
    dplyr::select(.data$term, .data$component, "instcodes") %>%
    dplyr::filter(!is.na(.data$component)) %>%
    dplyr::distinct()

  icodecols <- termsubset %>%
    dplyr::mutate(male = dplyr::case_when(component == "identity" & substr(instcodes, 1, 1) == 1 ~ TRUE,
                                          component == "identity" & substr(instcodes, 1, 1) == 0 ~ FALSE,
                                          TRUE ~ NA),
                  female = dplyr::case_when(component == "identity" & substr(instcodes, 2, 2) == 1 ~ TRUE,
                                            component == "identity" & substr(instcodes, 2, 2) == 0 ~ FALSE,
                                            TRUE ~ NA),
                  overt = dplyr::case_when(component == "behavior" & substr(instcodes, 1, 1) == 1 ~ TRUE,
                                           component == "behavior" & substr(instcodes, 1, 1) == 0 ~ FALSE,
                                           TRUE ~ NA),
                  surmised = dplyr::case_when(component == "behavior" & substr(instcodes, 2, 2) == 1 ~ TRUE,
                                              component == "behavior" & substr(instcodes, 2, 2) == 0 ~ FALSE,
                                              TRUE ~ NA),
                  place = dplyr::case_when(component == "setting" & substr(instcodes, 1, 1) == 1 ~ TRUE,
                                           component == "setting" & substr(instcodes, 1, 1) == 0 ~ FALSE,
                                           TRUE ~ NA),
                  time = dplyr::case_when(component == "setting" & substr(instcodes, 2, 2) == 1 ~ TRUE,
                                          component == "setting" & substr(instcodes, 2, 2) == 0 ~ FALSE,
                                          TRUE ~ NA),
                  lay = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 4, 4) == 1 ~ TRUE,
                                         component %in% c("identity", "behavior", "setting") & substr(instcodes, 4, 4) == 0 ~ FALSE,
                                         TRUE ~ NA),
                  business = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 5, 5) == 1 ~ TRUE,
                                              component %in% c("identity", "behavior", "setting") & substr(instcodes, 5, 5) == 0 ~ FALSE,
                                              TRUE ~ NA),
                  law = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 6, 6) == 1 ~ TRUE,
                                         component %in% c("identity", "behavior", "setting") & substr(instcodes, 6, 6) == 0 ~ FALSE,
                                         TRUE ~ NA),
                  politics = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 7, 7) == 1 ~ TRUE,
                                              component %in% c("identity", "behavior", "setting") & substr(instcodes, 7, 7) == 0 ~ FALSE,
                                              TRUE ~ NA),
                  academe = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 8, 8) == 1 ~ TRUE,
                                             component %in% c("identity", "behavior", "setting") & substr(instcodes, 8, 8) == 0 ~ FALSE,
                                             TRUE ~ NA),
                  medicine = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 9, 9) == 1 ~ TRUE,
                                              component %in% c("identity", "behavior", "setting") & substr(instcodes, 9, 9) == 0 ~ FALSE,
                                              TRUE ~ NA),
                  religion = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 10, 10) == 1 ~ TRUE,
                                              component %in% c("identity", "behavior", "setting") & substr(instcodes, 10, 10) == 0 ~ FALSE,
                                              TRUE ~ NA),
                  family = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 11, 11) == 1 ~ TRUE,
                                            component %in% c("identity", "behavior", "setting") & substr(instcodes, 11, 11) == 0 ~ FALSE,
                                            TRUE ~ NA),
                  sexual = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 12, 12) == 1 ~ TRUE,
                                            component %in% c("identity", "behavior", "setting") & substr(instcodes, 12, 12) == 0 ~ FALSE,
                                            TRUE ~ NA),
                  monadic = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 14, 14) == 1 ~ TRUE,
                                             component %in% c("identity", "behavior", "setting") & substr(instcodes, 14, 14) == 0 ~ FALSE,
                                             TRUE ~ NA),
                  group = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 15, 15) == 1 ~ TRUE,
                                           component %in% c("identity", "behavior", "setting") & substr(instcodes, 15, 15) == 0 ~ FALSE,
                                           TRUE ~ NA),
                  corporal = dplyr::case_when(component %in% c("identity", "behavior", "setting") & substr(instcodes, 16, 16) == 1 ~ TRUE,
                                              component %in% c("identity", "behavior", "setting") & substr(instcodes, 16, 16) == 0 ~ FALSE,
                                              TRUE ~ NA),
                  adjective = dplyr::case_when(component == "modifier" & substr(instcodes, 1, 1) == 1 ~ TRUE,
                                               component == "modifier" & substr(instcodes, 1, 1) == 0 ~ FALSE,
                                               TRUE ~ NA),
                  adverb = dplyr::case_when(component == "modifier" & substr(instcodes, 2, 2) == 1 ~ TRUE,
                                            component == "modifier" & substr(instcodes, 2, 2) == 0 ~ FALSE,
                                            TRUE ~ NA),
                  emotion = dplyr::case_when(component == "modifier" & substr(instcodes, 4, 4) == 1 ~ TRUE,
                                             component == "modifier" & substr(instcodes, 4, 4) == 0 ~ FALSE,
                                             TRUE ~ NA),
                  trait = dplyr::case_when(component == "modifier" & substr(instcodes, 5, 5) == 1 ~ TRUE,
                                           component == "modifier" & substr(instcodes, 5, 5) == 0 ~ FALSE,
                                           TRUE ~ NA),
                  status = dplyr::case_when(component == "modifier" & substr(instcodes, 6, 6) == 1 ~ TRUE,
                                            component == "modifier" & substr(instcodes, 6, 6) == 0 ~ FALSE,
                                            TRUE ~ NA),
                  feature = dplyr::case_when(component == "modifier" & substr(instcodes, 7, 7) == 1 ~ TRUE,
                                             component == "modifier" & substr(instcodes, 7, 7) == 0 ~ FALSE,
                                             TRUE ~ NA),
                  emotion_spiral = dplyr::case_when(component == "modifier" & substr(instcodes, 8, 8) == 1 ~ TRUE,
                                                    component == "modifier" & substr(instcodes, 8, 8) == 0 ~ FALSE,
                                                    TRUE ~ NA)
    )

  dropcols <- icodecols %>%
    dplyr::select(dplyr::any_of(inst_all)) %>%
    dplyr::summarize(dplyr::across(dplyr::everything(), ~all(is.na(.))))

  dropcols <- names(dropcols[which(dropcols[1,] == TRUE)])

  icodecols <- icodecols %>%
    dplyr::select(-dplyr::all_of(dropcols)) %>%
    dplyr::select("term", "component", dplyr::any_of(inst_all))


  data <- data %>%
    dplyr::left_join(icodecols, by = c("term", "component"))

  return(data)
}

#' Create institution code strings from logicals indicating category membership
#'
#' This function returns institution codes in a string format that is properly formatted
#' for import to Interact and consistent with typical ACT data practices. Relevant
#' arguments depend on the component. All function parameters are logical, and all defaults
#' are FALSE, meaning that to create an institution code, users need only set the categories
#' that apply to TRUE. Arguments that do not apply to the given component will be ignored.
#' See Heise's 2014 PDF manual for Interact or Heise's 2007 book *Expressive Order* for
#' more details on these categories.
#'
#' * Identities: male, female, lay, business, law, politics, academe, medicine,
#'     religion, family, sexual, monadic, group, corporal
#' * Behaviors: overt, surmised, lay, business, law, politics, academe, medicine,
#'     religion, family, sexual, monadic, group, corporal
#' * Modifiers: adjective, adverb, emotion, trait, status, feature, emotion_spiral
#' * Settings: place, time, lay, business, law, politics, academe, medicine,
#'     religion, family, sexual, monadic, group, corporal
#'
#' @param component whether the term is an identity, behavior, component, or setting
#' @param male,female logical. What genders terms can typically be applied to (identities only)
#' @param overt,surmised logical. Whether labeling behaviors requires interpretation or insight
#'     on the part of the observer (behaviors only).
#' @param place,time logical. Type of setting (settings only).
#' @param lay,business,law,politics,academe,medicine,religion,family,sexual logical. Societal
#'     institutions that terms may belong to. Institutions, behaviors, and settings only.
#' @param monadic,group,corporal logical. How a term requires or implicates others. Identities,
#'      behaviors, and settings only.
#' @param adjective,adverb logical. Part of speech for modifiers.
#' @param emotion,trait,status,feature,emotion_spiral logical. Categories for modifiers.
#'
#' @return character string institution code
#' @export
#'
#' @examples
#' create_instcode(component = "identity", male = TRUE, female = TRUE, lay = TRUE)
#' create_instcode(component = "behavior", overt = TRUE, business = TRUE, group = TRUE)
#' create_instcode(component = "modifier", adjective = TRUE, emotion = TRUE)
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
