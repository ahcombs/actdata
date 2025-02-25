#' Valid dataset check
#'
#' Checks provided dataset(s) to see if they are available in the data supplied.
#'
#' @param dataset string
#' @param datatype string
#'
#' @return TRUE if available; throws error otherwise
#' @keywords internal
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
#' @keywords internal
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
#' @keywords internal
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

#' Valid group check
#'
#' Checks provided component(s) to see if they are available in the summary statistics supplied. Takes certain abbreviations/alternate spellings.
#' Accepted values are:
#'     m, male, man
#'     f, female, woman
#'     a, av, all
#'
#' @param group string
#'
#' @return TRUE if available; throws error otherwise
#' @keywords internal
check_group <- function(group){
  groups_avail <- c("m", "male", "man", "f", "female", "woman", "a", "av", "average", "all", "professional", "nonprofessional")
  for(g in group){
    if(!(g %in% unlist(groups_avail))){
      stop(message = paste0("Invalid respondent group '", g,"' provided. Valid groups depend on dataset."))
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
#' @keywords internal
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
#' @keywords internal
check_institutions <- function(institutions){
  instlist <- c(
    "term", "component",
    inst_all
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

#' Checks whether an institution code is properly formatted and returns the code with the proper whitespace
#'
#' @param code character institution code
#'
#' @return character standardized institution code
#' @keywords internal
standardize_inst_code <- function(code){
  errormessage <- paste0("Instutition codes must be character strings containing only 14 1/0 entries and optional whitespace. Code provided was ", code)

  standcode <- NA_character_
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

    standcode <- paste0(substr(code, 1, 2), " ", substr(code, 3, 11), " ", substr(code, 12, 14), collapse = "")
  }

  return(standcode)
}


#' standardize_option
#'
#' This function deals with abbreviations in parameter specification and returns the spellings that are used in the datasets.
#'
#' @param input the string to standardize
#' @param param the type expected (group, component, stat, datatype)
#'
#' @return the standardized version of the input string
#' @keywords internal
standardize_option <- function(input, param){
  input <- trimws(tolower(input))
  for(i in 1:length(input)){
    if(param == "group"){
      input[i] <- dplyr::case_when(substr(input[i], 1, 1) == "m" ~ "male",
                                   substr(input[i], 1, 1) == "a" ~ "all",
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
