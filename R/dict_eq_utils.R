#' search_dict
#'
#' Dictionary search and subset
#'
#' @param expr A term, regular expression, or list of terms or regexs to search. If a list is provided, entries will be treated as separated by "or", so all terms matching one or more of the entries will be returned. Default matches all terms.
#' @param dataset The key of the dataset (or list of multiple) to search in. Default is "all.
#' @param component The component of the dictionary to use (identity, behavior, modifier, setting). Default is "all."
#' @param gender The gender of the dictionary to use (male, female, average). Default it "all."
#' @param stat The statistics to include in the subset that is returned. Default is all, options are mean, sd (standard deviation), cov (covariance), and n (number of raters). Terms that do not contain values for the required statistic will be excluded from the results.
#' @param stat_na_exclude Ignored if stat is not specified. A logical indicating whether to exclude entries with NA values for any of the required statistics. Default is TRUE.
#' @param instcodes Logical, whether to include the institution codes in the output. Default is TRUE.
#'
#' @return FALSE if the provided term or expression is not in any provided dictionary. If it occurs at least once, returns the subset of the dictionary(s) of interest where the term matches the provided expression.
#' @export
search_dict <- function(expr = ".*", dataset = "all", component = "all", gender = "all", stat = "all", stat_na_exclude = TRUE, instcodes = TRUE){
  if(all(dataset != "all")){
    check_dataset(dataset)
  }
  if(all(component != "all")){
    check_component(component)
    component <- standardize_option(component, "component")
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

  if(!is.logical(instcodes)){
    stop("instcodes parameter must be TRUE or FALSE")
    # TODO later: add better support for filtering by institution.
  }

  # if a list of regexes has been provided, concatenate together (treat as "or")
  if(length(expr) > 1){
    expr <- paste0("(", paste(expr, collapse = ")|("), ")")
  }

  subset <- actdata::epa_summary_statistics[grepl(expr, actdata::epa_summary_statistics$term),]

  if(all(dataset != "all")){
    k <- dataset
    subset <- subset %>%
      dplyr::filter(dataset %in% k)
  }

  if(all(component != "all")){
    c <- component
    subset <- subset %>%
      dplyr::filter(component %in% c)
  }

  if(all(gender != "all")){
    g <- gender
    subset <- subset %>%
      dplyr::filter(gender %in% g)
  }

  if(all(stat != "all")){
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

  if(!instcodes){
    subset <- dplyr::select(subset, -instcodes)
  }

  if(nrow(subset) == 0){
    warning("The search did not match any dictionary entries.")
    return(FALSE)
  }

  return(subset)
}


# TODO this is super confusing that I have this function here and also a file called dict_subset with other functions. What is this doing and can it be moved?

#' dict_subset
#'
#' Dictionary subset. Extracts the keys of dictionaries, optionally subsetted by type (mean, sd, cov, individual) or component (identity, behavior, modifier, setting)
#'
#' @param dicts list of dictionary objects
#' @param type string (\code{"mean"}, \code{"sd"}, or \code{"cov"})
#' @param component string (\code{"identity"}, \code{"behavior"}, \code{"modifier"}, or \code{"setting"})
#'
#' @return list of dictionary keys
#' @export
dict_subset <- function(type = NA, component = NA, dicts = get_dicts()){
  # TODO I changed the parameter to make get_dicts() the default and put it last--update within bayesact
  # TODO allow abbreviations? Is this likely to be used by users or is it just for bayesactr?
  names <- c()
  # subset by type and/or components available
  for(dict in dicts){
    if((type %in% dict@types | is.na(type)) & (component %in% dict@components | is.na(component))){
      names <- append(names, dict@key)
    }
  }

  return(names)
}


#' eqn_subset
#'
#' Equation subset. Extracts the keys of equations, optionally subsetted by gender
#'
#' @param eqns list of equation objects
#' @param gendercomponent string
#'
#' @return list of equation keys
#' @export
eqn_subset <- function(eqns, gendercomponent = NA){
  names <- c()
  # subset by component/gender available
  for(eqn in eqns){
    if(gendercomponent %in% eqn@gendercomponents | is.na(gendercomponent)){
      names <- append(names, eqn@key)
    }
  }

  return(names)
}


#' this_dict
#'
#' Get dictionary or equation object. Extracts metadata object for a single dictionary or equation of a given name from the master list
#'
#' @param name string
#' @param class string (\code{"equation"} or \code{"dictionary"})
#'
#' @return dictionary object
#' @export
this_dict <- function(name, class = 'dictionary'){
  if(class == 'dictionary'){
    dicts <- get_dicts()
  }
  else {
    dicts <- get_eqns()
  }

  for(d in dicts){
    if(d@key == name){
      return(d)
    }
  }
}

#' Valid dataset check
#'
#' Checks provided dataset(s) to see if they are available in the summary statistics supplied.
#'
#' @param dataset string
#'
#' @return TRUE if available; throws error otherwise
check_dataset <- function(dataset){
  datasets_avail <- unique(actdata::epa_summary_statistics[,c("dataset")])
  for(k in dataset){
    if(!(k %in% unlist(datasets_avail))){
      stop(message = paste0("Invalid dataset key '", k,"' provided. Use the dict_info() function to see datasets available."))
    }
  }

  return(TRUE)
}


#' Valid component check
#'
#' Checks provided component(s) to see if they are available in the summary statistics supplied. Takes certain abbreviations/alternate spellings.
#' Accepted values are:
#'     b, beh, behavior, behaviour, behaviors, behaviours
#'     m, mod, modifier, modifiers
#'     i, ident, identity, identities
#'     s, set, setting, settings
#'
#' @param component string
#'
#' @return TRUE if available; throws error otherwise
check_component <- function(component){
  components_avail <- c("behavior", "modifier", "identity", "setting",
                        "b", "beh", "m", "mod", "i", "ident", "s", "set",
                        "behaviors", "modifiers", "settings", "identities",
                        "behaviour", "behaviours")
  for(c in component){
    if(!(c %in% unlist(components_avail))){
      stop(message = paste0("Invalid component '", c,"' provided. Valid components are identity, behavior, modifier, and setting."))
    }
  }

  return(TRUE)
}

#' Valid gender check
#'
#' Checks provided component(s) to see if they are available in the summary statistics supplied. Takes certain abbreviations/alternate spellings.
#' Accepted values are:
#'     m, male, man
#'     f, female, woman
#'     a, av, average
#'
#' @param gender string
#'
#' @return TRUE if available; throws error otherwise
check_gender <- function(gender){
  genders_avail <- c("m", "male", "man", "f", "female", "woman", "a", "av", "average")
  for(g in gender){
    if(!(g %in% unlist(genders_avail))){
      stop(message = paste0("Invalid gender '", g,"' provided. Valid genders are average, female, and male."))
    }
  }

  return(TRUE)
}

#' Valid stat check
#'
#' Checks provided stat(s) to see if they are valid designators. Takes certain abbreviations/alternate spellings.
#' Accepted values are:
#'    mean, m
#'    sd, standard deviation, s
#'    cov, covar, covariance, c
#'
#' @param stat string
#'
#' @return TRUE if available; throws error otherwise
check_stat <- function(stat){
  stats_avail <- c("mean", "m", "sd", "standard deviation", "s", "cov", "covar", "covariance", "c", "n", "number")
  for(s in stat){
    if(!(s %in% unlist(stats_avail))){
      stop(message = paste0("Invalid statistic '", s,"' provided. Valid statistics are mean, sd, cov, and n."))
    }
  }

  return(TRUE)
}

#' standardize_option
#'
#' This function deals with abbreviations in parameter specification and returns the spellings that are used in the datasets.
#'
#' @param input the string to standardize
#' @param param the type expected (gender, component, or stat)
#'
#' @return the standardized version of the input string
standardize_option <- function(input, param){
  input <- trimws(tolower(input))
  for(i in 1:length(input)){
    if(param == "gender"){
      input[i] <- dplyr::case_when(substr(input[i], 1, 1) == "m" ~ "male",
                                   substr(input[i], 1, 1) == "a" ~ "average",
                                   substr(input[i], 1, 1) %in% c("f", "w") ~ "female",
                                   TRUE ~ input[i])
    } else if(param == "component"){
      input[i] <- dplyr::case_when(substr(input[i], 1, 1) == "b" ~ "behavior",
                                   substr(input[i], 1, 1) == "m" ~ "modifier",
                                   substr(input[i], 1, 1) == "i" ~ "identity",
                                   substr(input[i], 1, 1) == "s" ~ "setting",
                                   TRUE ~ input[i])
    } else if(param == "stat"){
      input[i] <- dplyr::case_when(substr(input[i], 1, 1) == "m" ~ "mean",
                                   substr(input[i], 1, 1) == "s" ~ "sd",
                                   substr(input[i], 1, 1) == "c" ~ "cov",
                                   substr(input[i], 1, 1) == "a" ~ "all",
                                   TRUE ~ input[i])
    } else (
      stop("Invalid parameter type provided.")
    )
  }
  return(input)
}




