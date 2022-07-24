#' check_data_frame
#'
#' Verify that it's either a data frame object or a tibble
#'
#' @param data dataframe
#'
#' @return logical
check_data_frame <- function(data){
  if(!is.data.frame(data) & !tibble::is_tibble(data)){
    stop("data must be a tibble or data frame")
  }
  invisible(return(TRUE))
}

#' check_data_cols
#'
#' Checks that a dataframe to be reformatted for bayesact or interact has the necessary columns -- term, E, P, A, and sd or cov if needed (bayesact only).
#'
#' @param data dataframe to check
#' @param stat statistic type wanted (mean, sd, cov)
#' @param program for bayesact or for interact (bayesact can only have three EPA columns, interact can have 3 or 6... could print a warning if 6 are passed to bayesact)
#' @param group name of the grouping column (for interact only)
#'
#' @return logical
check_data_cols <- function(data, program, group = "none", stat = "mean"){
  # check for correct/necessary column names: term, E, P, A

  # TERM
  thesenames <- names(data)
  if(!("term" %in% thesenames)){
    stop("data must contain a column titled 'term'")
  } else if (length(grep("term", thesenames)) > 1){
    stop("data must only contain one term column")
  }

  check_no_duplicate_terms(terms = data$term, group = group)

  # EPA
  maxNumEPA = ifelse(program == "interact", 2, 1)
  if(length(grep("^E", thesenames))==0 | length(grep("^P", thesenames))==0 | length(grep("^A", thesenames))==0){
    stop("data is missing an E, P, or A column")
  }
  if (length(grep("^E", thesenames))>maxNumEPA | length(grep("^P", thesenames))>maxNumEPA | length(grep("^A", thesenames))>maxNumEPA){
    stop("data has too many columns starting with E, P, or A")
  }
  # if (program == "bayesact" &
  #     length(grep("^[EPA]", thesenames)) != 3){
  #   stop("data must have either one each or two each of E, P, and A columns")
  # }
  if (program == "interact" &
      length(grep("^[EPA]", thesenames)) != 3 & length(grep("^[EPA]", thesenames)) != 6){
    stop("data must have either one each or two each of E, P, and A columns")
  }
  # only applies to interact, no grouping for bayesact
  if ((length(grep("^E", thesenames))==maxNumEPA & length(grep("^P", thesenames))==maxNumEPA & length(grep("^A", thesenames))==maxNumEPA) &
      group != "none"){
    stop("cannot provide both multiple E, P, and A columns and a group column")
  }

  # now check that E, P, and A columns are coercible to numeric and term is coercible to character
  EPAcols <- data[,grep("^[EPA]", thesenames)]
  if(suppressWarnings(any(is.na(as.numeric(as.matrix(EPAcols)))))){
    stop("E, P, and A columns must be completely numeric or coercible to numeric")
  }
  if(suppressWarnings(any(is.na(as.character(data$term))))){
    stop("all entries in term column must be coercible to character")
  }

  if(stat == "sd"){
    # bayesact only
    # check that the 3 sd cols are there and are coercible to numeric
    if(!just_once(thesenames, required = c("sd_E", "sd_P", "sd_A"))){
      stop("data must contain one and only one sd_E, sd_P, and sd_A column to save in standard deviation format.")
    }
    if(!is.numeric(data$sd_E) | !is.numeric(data$sd_P) | !is.numeric(data$sd_A)){
      stop("all sd columns must be completely numeric")
    }
  }

  if(stat == "cov"){
    # bayesact only
    # check that the 9 cov columns are there and are coercible to numeric
    if(!just_once(thesenames, required = c("cov_EE", "cov_EP", "cov_EA", "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA"))){
      stop("data must contain one and only one of each of the 9 required covariance columns (named in format 'cov_XX') to save in covariance format.")
    }
    if(!is.numeric(data$cov_EE) | !is.numeric(data$cov_EP) | !is.numeric(data$cov_EA) |
       !is.numeric(data$cov_PE) | !is.numeric(data$cov_PP) | !is.numeric(data$cov_PA) |
       !is.numeric(data$cov_AE) | !is.numeric(data$cov_AP) | !is.numeric(data$cov_AA)){
      stop("all cov columns must be completely numeric")
    }
  }
  return(TRUE)
}


#' Checks validity of grouping column: if not "none", must have just two unique values.
#'
#' @param data dataframe to check
#' @param group name of grouping column
#'
#' @return logical
check_group_col <- function(data, group){
  if(length(group) > 1){
    stop("only one grouping column can be provided")
  }
  if(group != "none"){
    thesenames <- names(data)
    if(!(group %in% thesenames)){
      stop("group column does not exist")
    }
    else if(any(is.na(data[,group]))){
      stop("group column must not contain NA values")
    }
    else if(length(unlist(unique(data[,group]))) != 2){
      stop("group column must have exactly two unique values")
    }
    # check whether each term has two sets of values, one for each group
    else{
      v1 <- sort(unlist(unique(data[,group])))[[1]]
      v2 <- sort(unlist(unique(data[,group])))[[2]]
      t1 <- data %>%
        dplyr::filter(!!(rlang::sym(group)) == v1) %>%
        dplyr::select("term")
      t2 <- data %>%
        dplyr::filter(!!(rlang::sym(group)) == v2) %>%
        dplyr::select("term")
      if(!identical(dplyr::arrange(t1, .data$term), dplyr::arrange(t2, .data$term))){
        stop("each term must have values for both groups")
      }
    }
  } else {
    v1 = "1"
    v2 = "2"
  }
  return(c(v1, v2))
}

#' check_inst_codes
#'
#' Check if institution codes are present and add if needed.
#'
#' TODO: If there are some columns which don't include institution codes, do I need to add them?
#'
#' @param data dataframe to check
#' @param na.sub option indicating what to do with missing institution codes. TRUE (default; count term as belonging to all institutions), FALSE (count term as belonging to no institutions), "drop" (drop terms with missing institution codes), or NA (leave code as NA).
#'
#' @return dataframe with institution codes added if needed
check_inst_codes <- function(data, na.sub = TRUE){
  if(is.na(na.sub)){
    subcode <- NA_character_
    nocolmessage <- "There is no column named instcodes. The returned column will contain all NA values."
    namessage <- "At least one of the institution codes is NA."
  } else if(na.sub){
    subcode <- "11 111111111 111"
    nocolmessage <- "There is no column named instcodes. All terms will be given institution code 11 111111111 111, indicating all institutions."
    namessage <- "At least one of the institution codes is NA. NA's will be replaced with institution code 11 111111111 111, indicating all institutions."
  } else if(!na.sub){
    subcode <- "00 000000000 000"
    nocolmessage <- "There is no column named instcodes. All terms will be given institution code 00 000000000 000, indicating no institutions."
    namessage <- "At least one of the institution codes is NA. NA's will be replaced with institution code 00 000000000 000, indicating no institutions."
  } else if(na.sub == "drop"){
    subcode <- NA_character_
    nocolmessage <- ""
    namessage <- "At least one of the institution codes is NA. Terms with no institution code will be dropped."
  } else {
    stop("Invalid na.sub option")
  }

  thesenames <- names(data)
  if(!("instcodes" %in% thesenames)){
    if(na.sub == "drop"){
      stop("There is no column named instcodes.")
    }
    message(nocolmessage)
    data$instcodes <- subcode
  }
  if(any(is.na(data$instcodes))){
    message(namessage)
    data$instcodes[is.na(data$instcodes)] <- subcode
    if(!is.na(na.sub) & na.sub == "drop"){
      data <- dplyr::filter(data, !is.na(instcodes))
    }
  }
  data$instcodes <- trimws(data$instcodes)
  return(data)
}

#' check_no_duplicate_terms
#'
#' Check whether there are duplicate terms and throw the appropriate error or warning.
#'
#' @param terms the term list
#' @param group name of the grouping variable, or "none"
#'
#' @return logical indicating success
check_no_duplicate_terms <- function(terms, group){
  # for bayesact, issue warnings (I am not sure what Jesse's code does with duplicates). Change to error if it throws an issue in the simulation. Bayesact is definitionally not grouped.
  if(group == "none" & length(unlist(unique(terms))) < length(unlist(terms))){
    warning("Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. It is recommended that all terms are uniquely named.")
  } else if(group != "none" & length(unlist(unique(terms))) < .5 * length(unlist(terms))){
    stop("Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. All terms must be uniquely named if a long dataset is provided and grouping is used.")
  }
  invisible(return(TRUE))
}

#' Reformat data to bayesact or interact-friendly format depending on summary statistic desired.
#'
#' Assuming here that we've already checked that the necessary columns are present and named correctly.
#' This reorders them and drops the unnecessary ones. It also does the grouping if desired for interact files.
#'
#' @param data dataframe to reformat (already verified that column names and types are correct)
#' @param group name of grouping column (interact/mean only)
#' @param groupvals vector length 2; unique values in grouping column
#' @param stat summary statistic desired (mean, sd, or cov; interact must be mean)
#' @param program bayesact or interact. Mean datasets look the same.
#'
#' @return reformatted data frame.
#' Interact:
#'    - term
#'    - 6 EPA cols, repeated if no group, one set for each group if grouped
#'    - no institution codes
#'
#' Bayesact:
#'    - term
#'    - 3 EPA cols
#'    - if mean: 3 more placeholder EPA cols
#'    - if sd: 3 sd cols
#'    - if cov: 9 cov cols
#'    - placeholder institution codes for all.
#'
reformat <- function(data, program, stat = "mean", group = "none", groupvals = NA){
  # TODO: Check if institution codes are still unused in bayesact

  thesenames = names(data)

  if(group == "none"){
    data <- data %>%
      dplyr::select("term", dplyr::starts_with("sd"), dplyr::starts_with("cov"), dplyr::matches("^[EPA]", ignore.case = FALSE), "instcodes")
  } else {
    data <- data %>%
      dplyr::select("term", dplyr::starts_with("sd"), dplyr::starts_with("cov"), dplyr::matches("^[EPA]", ignore.case = FALSE), "instcodes", group)
  }

  # FIRST: get interact wide data out of the way
  if (program == "interact" & length(grep("^[EPA]", thesenames)) == 6){
    # INTERACT WIDE DATA
    # check that there are exactly two suffixes
    # if there is only one it's too hard to order. Ambiguous.
    # and if there are more than two it's also ambiguous
    epanames <- grep("^[EPA]", thesenames, value = TRUE)
    suffixes <- sort(unique(substring(epanames, 2)))
    if(length(unique(suffixes)) > 2 | length(unique(suffixes)) == 1){
      stop(message = "Names of E, P, and A columns must have exactly two unique suffixes denoting two groups")
    } else if (length(unique(suffixes)) == 2) {
      if(length(unique(epanames)) < 6){
        stop("Two or more of the E, P, and A columns are named identically.")
      }
      s1 <- suffixes[1]
      s2 <- suffixes[2]
      order <- c("term", paste0("E", s1), paste0("P", s1), paste0("A", s1), paste0("E", s2), paste0("P", s2), paste0("A", s2), "instcodes")
      data_formatted <- dplyr::select(data, dplyr::all_of(order))
    }
  } else {
    # Everything else (interact long, all bayesact) can start with the same epa renaming
    data_formatted <- data %>%
      dplyr::rename(
        E = dplyr::starts_with("E"),
        P = dplyr::starts_with("P"),
        A = dplyr::starts_with("A"))

    if((program == "interact" & group == "none") | (program == "bayesact" & stat == "mean")){
      # Long ungrouped interact and mean bayesact can be treated similarly, though mean bayesact will have placeholders instead of real values
      data_formatted <- data_formatted %>%
        dplyr::rename(
          E_group1 = .data$E,
          P_group1 = .data$P,
          A_group1 = .data$A) %>%
        dplyr::mutate(
          E_group2 = ifelse(program == "interact", .data$E_group1, 0),
          P_group2 = ifelse(program == "interact", .data$P_group1, 0),
          A_group2 = ifelse(program == "interact", .data$A_group1, 0)) %>%
        dplyr::select("term", "E_group1", "P_group1", "A_group1", "E_group2", "P_group2", "A_group2", "instcodes")
      if(program == "bayesact"){
        names(data_formatted) <- c("term", "E", "P", "A", "E_placeholder", "P_placeholder", "A_placeholder", "instcodes")
      }
    } else if (group != "none"){
      data_formatted[data_formatted[[group]] == groupvals[1],"gr"] <- "group1"
      data_formatted[data_formatted[[group]] == groupvals[2],"gr"] <- "group2"

      data_formatted <- data_formatted %>%
        dplyr::select("term", "gr", "E", "P", "A", "instcodes") %>%
        tidyr::pivot_wider(names_from = .data$gr, values_from = c("E", "P", "A", "instcodes"))

      if(!identical(data_formatted$instcodes_group1, data_formatted$instcodes_group2)){
        warning("Institution codes are not always the same within terms. The codes for the first group have been presented in output.")
      }

      data_formatted <- data_formatted %>%
        dplyr::select("term", "E_group1", "P_group1", "A_group1", "E_group2", "P_group2", "A_group2", "instcodes_group1")
      names(data_formatted) <- c("term", paste0("E_", groupvals[1]), paste0("P_", groupvals[1]), paste0("A_", groupvals[1]), paste0("E_", groupvals[2]), paste0("P_", groupvals[2]), paste0("A_", groupvals[2]), "instcodes")
    } else if (program == "bayesact" & stat == "sd"){
      # here it's just to reorder columns and drop unnecessary ones
      data_formatted <- data_formatted %>%
        dplyr::select(c("term", "E", "P", "A", "sd_E", "sd_P", "sd_A", "instcodes"))
    } else if (program == "bayesact" & stat == "cov"){
      data_formatted <- data_formatted %>%
        dplyr::select(c("term", "E", "P", "A", "cov_EE", "cov_EP", "cov_EA", "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes"))
    }
  }

  data_formatted <- data_formatted %>%
    mutate(dplyr::across(dplyr::matches("[EPA]", ignore.case = FALSE), as.numeric),
           instcodes = as.character(.data$instcodes),
           term = as.character(.data$term))

  # if(program == "interact"){
  #   data_formatted <- dplyr::select(data_formatted, -"instcodes")
  # }

  return(data_formatted)
}

#' just_once
#'
#' Tests that all elements of a required vector are in a vector of column names once and only once
#'
#' @param colnames vector the (bigger) list of column names
#' @param required vector the (smaller) list of required columns
#'
#' @return logical whether each element of required is in colnames once and only once
just_once <- function(colnames, required){
  if(length(setdiff(required, colnames)) != 0){
    return(FALSE)
  }
  if(length(colnames[colnames %in% required]) != length(required)){
    return(FALSE)
  }
  return(TRUE)
}
