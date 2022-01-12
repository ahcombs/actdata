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
#' @param stats_avail abbreviations allowed
#'
#' @return TRUE if available; throws error otherwise
check_stat <- function(stat, stats_avail = c("mean", "m", "sd", "standard deviation", "s", "cov", "covar", "covariance", "c", "n", "number")){
  for(s in stat){
    if(!(s %in% unlist(stats_avail))){
      options <- c("mean", "sd", "cov", "n")
      options <- options[options %in% stats_avail]
      stop(message = paste0("Invalid statistic '", s,"' provided. Valid statistics are ", paste(options, collapse = ", "), "."))
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
