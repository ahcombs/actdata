#' save_for_interact
#'
#' Save for export to Interact
#'
#' Saves dictionary and equation files in a format that can be directly copy/pasted into Interact.
#' This may be useful for easily creating subsets of data to use in Interact or for importing dictionaries that are not already included.
#'
#' @param data dataframe to save
#' @param type string ("dict" or "eqn") indicating type of data
#' @param group string indicating the name or numeric index of a column to group on. This column must contain only two values and each term must have one entry for each
#' @param filename string the filepath at which to save (must end in .txt)
#' @param savefile logical that denotes whether to actually save the file (FALSE is primarily useful for testing purposes). Default is TRUE.
#'
#' @return the dataframe that is written to file
#'
#' @export
save_for_interact <- function(data, type = "dict", group = "none", filename = paste0(deparse(substitute(data)), ".txt"), savefile = TRUE){
  ### FILE NAME
  if(!is.character(filename)){
    stop("File name must be a string.")
  }

  if(length(filename) != 1){
    stop("Must provide a single file name.")
  }

  if(grepl("\\.txt$", filename) == FALSE){
    stop("Invalid file extension. Extension .txt required.")
  }

  ### TYPE
  if(!(type %in% c("dict", "eqn"))){
    stop("Invalid data type. Must be 'dict' or 'eqn'.")
  }

  ### GROUP
  if(length(group) > 1){
    stop("only one grouping column can be provided")
  }


  if(type == "dict"){
    # If there is no insitution ID Interact fills it in with all 1's

    # first: check that data object is either a tibble or data frame
    if(!is.data.frame(data) & !tibble::is_tibble(data)){
      stop("data must be a tibble or data frame")
    }

    # check for correct/necessary column names: term, E, P, A
    thesenames <- names(data)
    if(!("term" %in% thesenames)){
      stop("data must contain a column titled 'term'")
    } else if (length(grep("term", thesenames)) > 1){
      stop("data must only contain one term column")
    }
    if(length(grep("^E", thesenames))==0 | length(grep("^P", thesenames))==0 | length(grep("^A", thesenames))==0){
      stop("data is missing an E, P, or A column")
    } else if (length(grep("^E", thesenames))>2 | length(grep("^P", thesenames))>2 | length(grep("^A", thesenames))>2){
      stop("data has too many columns starting with E, P, or A")
    } else if (length(grep("^[EPA]", thesenames)) != 3 & length(grep("^[EPA]", thesenames)) != 6){
      stop("data must have either one each or two each of E, P, and A columns")
    } else if ((length(grep("^E", thesenames))==2 & length(grep("^P", thesenames))==2 & length(grep("^A", thesenames))==2) &
               group != "none"){
      stop("cannot provide both multiple E, P, and A columns and a group column")
    }

    # now check that E, P, and A columns are coercible to numeric and term is coercible to character
    EPAcols <- data[,grep("^[EPA]", thesenames)]
    if(suppressWarnings(any(is.na(as.numeric(as.matrix(EPAcols)))))){
      stop("E, P, or A column must be completely numeric or coercible to numeric")
    }
    if(suppressWarnings(any(is.na(as.character(data$term))))){
      stop("all entries in term column must be coercible to character")
    }


    if(group != "none"){
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
    }

    # last but not least, institution codes. It's okay if they aren't there, but print a warning.
    if("instcodes" %in% thesenames){
      icodes <- TRUE
    } else {
      warning("There is no column named instcodes. All terms will be given institution code 11 111111111 111, indicating all institutions.")
      icodes <- FALSE
      data$instcodes <- ""
    }


    ### NOW do necessary reformatting

    # LONG
    if(length(grep("^[EPA]", thesenames)) == 3){
      data_formatted <- data %>%
        dplyr::rename(
          E = dplyr::starts_with("E"),
          P = dplyr::starts_with("P"),
          A = dplyr::starts_with("A")) %>%
        dplyr::mutate(
          term = as.character(.data$term),
          E = as.numeric(.data$E),
          P = as.numeric(.data$P),
          A = as.numeric(.data$A),
          instcodes = as.character(.data$instcodes))

      if(group != "none"){
        if(length(unlist(unique(data_formatted$term))) < .5 * length(unlist(data_formatted$term))){
          stop("Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. All terms must be uniquely named if a long dataset is provided and grouping is used.")
        }

        data_formatted[data_formatted[[group]] == v1,"gr"] <- "group1"
        data_formatted[data_formatted[[group]] == v2,"gr"] <- "group2"

        data_formatted <- data_formatted %>%
          dplyr::select("term", "gr", "E", "P", "A", "instcodes") %>%
          tidyr::pivot_wider(names_from = .data$gr, values_from = c("E", "P", "A", "instcodes"))

        if(!identical(data_formatted$instcodes_group1, data_formatted$instcodes_group2)){
          warning("Institution codes are not always the same within terms. The codes for the first group have been presented in output.")
        }
      } else {
        if(length(unlist(unique(data_formatted$term))) < length(unlist(data_formatted$term))){
          warning("Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. It is recommended that all terms are uniquely named.")
        }

        data_formatted <- data_formatted %>%
          dplyr::rename(
            E_group1 = .data$E,
            P_group1 = .data$P,
            A_group1 = .data$A,
            instcodes_group1 = .data$instcodes) %>%
          dplyr::mutate(
            E_group2 = .data$E_group1,
            P_group2 = .data$P_group1,
            A_group2 = .data$A_group1
          )

        v1 <- "1"
        v2 <- "2"
      }

      data_formatted <- data_formatted %>%
        dplyr::select("term", "E_group1", "P_group1", "A_group1", "E_group2", "P_group2", "A_group2", "instcodes_group1")

      names(data_formatted) <- c("term", paste0("E_", v1), paste0("P_", v1), paste0("A_", v1), paste0("E_", v2), paste0("P_", v2), paste0("A_", v2), "instcodes")

    } else {
      # WIDE
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
      }

      data_formatted <- dplyr::select(data, dplyr::all_of(order))

      if(length(unlist(unique(data_formatted$term))) < length(unlist(data_formatted$term))){
        warning("Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. It is recommended that all terms are uniquely named.")
      }
    }

    message("Importing institution codes into interact does not work at this time. Insitution codes can be seen in the data frame output of this function, but will not be saved in the output file.")
    data_save <- dplyr::select(data_formatted, -.data$instcodes)
    if(savefile){
      utils::write.table(data_save, file = filename, quote = FALSE, row.names = FALSE, col.names = FALSE, sep = ", ")
    }
  } else {
    # equations don't get any reformatting
    if(savefile){
      utils::write.table(data_formatted, file = filename, quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")
    }
  }

  return(invisible(data_formatted))
}
