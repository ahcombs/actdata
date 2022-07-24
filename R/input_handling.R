#' Valid dataset check
#'
#' Checks provided dataset(s) to see if they are available in the data supplied.
#'
#' @param dataset string
#' @param datatype string
#'
#' @return TRUE if available; throws error otherwise
check_dataset <- function(dataset, datatype){
  if(datatype == "summary"){
    datasets_avail <- unique(actdata::epa_summary_statistics[,c("dataset")])
  } else{
    # usfullsurveyor and usstudent are amalgamations of the others
    datasets_avail <- c(unique(actdata::individual$dataset), "usfullsurveyor2015", "usstudent2015")
  }
  for(k in dataset){
    if(!(k %in% unlist(datasets_avail))){
      stop(message = paste0("Invalid dataset key '", k,"' provided for ", datatype," data. Use the dict_info() function to see datasets available."))
    }
  }
  invisible(return(TRUE))
}


#' Check data type
#'
#' @param datatype string
#'
#' @return TRUE if available; throws error otherwise
check_datatype <- function(datatype){
  datatypes_avail <- c("summary", "sum", "s", "individual", "indiv", "i")
  for(k in datatype){
    if(!(k %in% unlist(datatypes_avail))){
      stop(message = paste0("Invalid data type '", k,"' provided. Data type may be summary or individual."))
    }
  }

  invisible(return(TRUE))
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

  invisible(return(TRUE))
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

  invisible(return(TRUE))
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

  invisible(return(TRUE))
}

#' Check that institutions are valid
#'
#' @param institutions list of institutions
#'
#' @return logical
check_institutions <- function(institutions){
  instlist <- c(
    "term", "component",
    "male", "female",
    "overt", "surmised",
    "place", "time",
    "lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual",
    "monadic", "group", "corporal",
    "adjective", "adverb",
    "emotion", "trait", "status", "feature", "emotion_spiral"
  )

  if(all(institutions %in% instlist)){
    invisible(return(TRUE))
  } else {
    invalid <- institutions[!(institutions %in% instlist)]
    if(length(invalid) == 1){
      message(paste0(invalid, " is an invalid institution."))
    } else {
      message(paste0("Institutions ", paste(invalid, collapse = ", "), " are invalid."))
    }
  }
}


#' standardize_option
#'
#' This function deals with abbreviations in parameter specification and returns the spellings that are used in the datasets.
#'
#' @param input the string to standardize
#' @param param the type expected (gender, component, stat, datatype)
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
    } else if(param == "datatype"){
      input[i] <- dplyr::case_when(substr(input[i], 1, 1) == "s" ~ "summary",
                                   substr(input[i], 1, 1) == "i" ~ "individual",
                                   TRUE ~ input[i])
    }else (
      stop("Invalid parameter type provided.")
    )
  }
  return(input)
}
