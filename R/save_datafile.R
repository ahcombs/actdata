#' Save data files
#'
#' Adapted from https://stackoverflow.com/questions/21248065/r-rename-r-object-while-save-ing-it : see Marco Wirthlin's answer
#'
#' @param ... data object
#' @param name desired object name (filename without type and extension)
#' @param type data type (dict or eqn)
saveit <- function(..., name, type = NA) {
  if(is.na(type)){
    if(is.element(TRUE, grepl("identities", name)) |
       is.element(TRUE, grepl("behaviors", name)) |
       is.element(TRUE, grepl("mods", name)) |
       is.element(TRUE, grepl("settings", name)) |
       is.element(TRUE, grepl("emotions", name))) {
      type <- "dict"
    } else if (is.element(TRUE, grepl("emotionid", name)) |
               is.element(TRUE, grepl("impressionabo", name)) |
               is.element(TRUE, grepl("selfdir", name)) |
               is.element(TRUE, grepl("traitid", name))){
      type <- "eqn"
    }
  }

  if(!(type %in% c("dict", "eqn"))){
    stop("Specify dataset type as dict or eqn")
  }

  # this does the .rda files
  x <- list(...)
  names(x) <- paste0(name, "_", type)
  save(list=names(x), file=paste0("data/", name, "_", type, ".rda"), envir=list2env(x))

  # # this does the csvs/.dat files
  # if(type == "dict"){
  #   write.csv(..., paste0("inst/extdata/", name, "_", type, ".csv"))
  # } else {
  #   write.table(..., file = paste0("inst/extdata/", name, "_", type, ".dat"), quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")
  # }
}


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
#'
#' @export
save_for_interact <- function(data, type = "dict", group = "none", filename = paste0(deparse(substitute(data)), ".txt")){
  # TODO FINISH THIS FUNCTION
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
          dplyr::filter(UQ(rlang::sym(group)) == v1) %>%
          dplyr::select(term)
        t2 <- data %>%
          dplyr::filter(UQ(rlang::sym(group)) == v2) %>%
          dplyr::select(term)
        if(!identical(dplyr::arrange(t1, term), dplyr::arrange(t2, term))){
          stop("each term must have values for both groups")
        }
      }
    }

    # last but not least, insitution codes. It's okay if they aren't there, but print a warning.
    if("instcodes" %in% thesenames){
      icodes <- TRUE
    } else {
      warning("There is no column named instcodes. When imported to interact, all terms will be given institution code 11 111111111 111, indicating all institutions.")
      icodes <- FALSE
      data$instcodes <- 'placeholder'
    }


    ### NOW do necessary reformatting

    # long
    if(length(grep("^[EPA]", thesenames)) == 3){
      data_formatted <- data %>%
        dplyr::rename(
          E = starts_with("E"),
          P = starts_with("P"),
          A = starts_with("A")) %>%
        dplyr::mutate(
          term = as.character(term),
          E = as.numeric(E),
          P = as.numeric(P),
          A = as.numeric(A),
          instcodes = as.character(instcodes))

      if(group != "none"){
        data_formatted[data_formatted[[group]] == v1,"gr"] <- "group1"
        data_formatted[data_formatted[[group]] == v2,"gr"] <- "group2"

        data_formatted <- data_formatted %>%
          dplyr::select(term, gr, E, P, A, instcodes) %>%
          tidyr::pivot_wider(names_from = gr, values_from = c(E, P, A, instcodes))

        print(head(data_formatted))

        if(!identical(data_formatted$instcodes_group1, data_formatted$instcodes_group2)){
          warning("Institution codes are not always the same within terms. The codes for the first group have been presented in output.")
        }
      } else {
        data_formatted <- data_formatted %>%
          dplyr::rename(
            E_group1 = E,
            P_group1 = P,
            A_group1 = A,
            instcodes_group1 = instcodes) %>%
          dplyr::mutate(
            E_group2 = E_group1,
            P_group2 = P_group1,
            A_group2 = A_group1
          )
      }

      data_formatted <- data_formatted %>%
        dplyr::select(term, E_group1, P_group1, A_group1, E_group2, P_group2, A_group2, instcodes_group1)

      if(length(unlist(data_formatted$term)) != length(unlist(unique(data_formatted$term)))){
        warning("Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Ensure duplicates are intentional.")
      }

    } else {
      # wide
      # check that there are only two suffixes OR that they share a suffix but are already in the right order

    }

    print(head(data_formatted))
    # utils::write.table(data_formatted, file = filename, quote = FALSE, row.names = FALSE, col.names = FALSE, sep = ", ")
  } else {
    utils::write.table(data_formatted, file = filename, quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")
  }
}
