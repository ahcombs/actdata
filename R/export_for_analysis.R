#' Write a data file in Interact-compatible format
#'
#' Save a dictionary or equation data frame in a text file format
#' that can be copied and pasted into the Java version of Interact
#' for analysis using that program. This allows users to create desired
#' data subsets using this package rather than manually adding and removing
#' lines from datasets Interact provides, facilitating more reproducible
#' workflows using Interact Java. This may also help users reformat their own
#' imported datasets for use in Interact.
#'
#' @details
#' Provided data must contain a column titled "term" and either three or six
#' numeric columns with EPA values that start with "E", "P", and "A". These requirements
#' are generally satisfied by dataframes produced by [epa_subset()].
#'
#' If three numeric columns are provided, the function can accept an optional "group"
#' argument that is the name of a column that contains two values. This column
#' will be used to "widen" the data to two sets of EPA columns. The first set will
#' correspond with the first value in the group column and the second set will
#' correspond with the second value. This is useful when you wish to allow Interact
#' to take two different sets of values depending on which of two groups an actor
#' is a part of. This is most frequently used to provide gendered data, but it has
#' other applications as well--for example, if you wish to allow students and
#' teachers to have different meanings for the same terms.
#'
#' Note that Interact requires identity, behavior, setting, and modifier data to be
#' loaded separately, meaning that prior to using this function, users should ensure
#' that only one component is represented per file.
#'
#' @param data data frame to save
#' @param type string ("dict" or "eqn") indicating type of data
#' @param group string indicating the name or numeric index of a column to group on.
#'     This column must contain only two values and each term must have one entry for each
#' @param filename string. the filepath at which to save (must end in .txt)
#' @param savefile logical. that denotes whether to actually save the file (FALSE is
#'     primarily useful for testing purposes). Default is TRUE.
#'
#' @return the dataframe that is written to file
#'
#' @export
#'
#' @examples
#' \dontrun{
#' save_for_interact(data = epa_subset(dataset = "household1997", component = "behavior"),
#'     filename = "household1997behavior.txt")
#' }
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

  if(type == "dict"){
    # If there is no institution code col Interact fills it in with all 1's

    # first: check that data object is either a tibble or data frame
    check_data_frame(data)

    # check grouping variable
    groupvals <- check_group_col(data, group = group)

    # check term and numeric cols for correct names, formats, numbers
    check_data_cols(data, program = "interact", group = group, stat = "mean")

    # last but not least, institution codes. It's okay if they aren't there, but print a warning.
    data <- check_inst_codes(data)

    ### NOW do necessary reformatting
    data_formatted <- reformat(data, program = "interact", stat = "mean", group = group, groupvals = groupvals)

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



#' Format a data frame for use in BayesACT or bayesactR
#'
#' This function allows users to easily convert dictionary subsets they
#' have created to the format necessary for providing to BayesACT. These
#' reformatted dataframes can be provided to the [bayesactR::add_actor()]
#' function in the bayesactR package (recommended) or they can be saved and
#' provided directly to the BayesACT C interface.
#'
#' @param data data frame or tibble object to reformat
#' @param stat character desired summary statistic to include. Options
#'     are "mean", "sd", "cov".
#'
#' @details
#' Input data frames have the following requirements:
#'    - must have a column labeled "term" that is coercible to character.
#'        Duplicate entries are allowed but not recommended in this column.
#'    - must have three columns titled "E", "P", and "A" that are coercible
#'        to numeric. These will be treated as sentiment mean scores in BayesACT.
#'    - if summary statistic type is sd (standard deviation), must have
#'        three columns with titles "sd_E", "sd_P", "sd_A" that are coercible to numeric.
#'    - if summary statistic type is cov (covariance), must have nine columns
#'        with titles "cov_XX", where XX is all two-letter permutations of E, P,
#'        and A, that are coercible to numeric
#'    - if an institution codes column (titled "instcodes") is not provided, an
#'        arbitrary one will be added (this information is required but not used by BayesACT)
#'    - all other columns will be dropped
#'
#' These column name and format requirements are generally satisfied by subsets
#' of the epa_summary_statistics dataset created by [epa_subset()].
#'
#' @return A reformatted data frame. Output data frames have the following columns, in left to right order:
#'    - A term column of type "character"
#'    - 3 columns containing the given E, P, and A mean values (in that order)
#'    - For summary statistic type "mean": Three numeric placeholder column. They are not used by BayesACT in calculations but are required in BayesACT inputs for compatibility with the Interact Java format.
#'    - For summary statistic type "sd": 3 numeric columns containing the given E, P, and A standard deviation values.
#'    - For summary statistic type "cov": 9 numeric columns containing the given covariance values. These are, in order, EE, EP, EA, PE, PP, PA, AE, AP, AA. Note that this covariance matrix is symmetric matrix so there are duplicate columns.
#'    - An institution codes column. BayesACT does not use this information, but does require it.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' data <- epa_subset(dataset = "egypt2015", component = "identity",
#'     institutions = c("law", "business"), stat = "cov")
#' data_bayesformat <- format_for_bayesact(data, stat = "cov")
#' }
format_for_bayesact <- function(data, stat = "mean"){
  # first: check that data object is either a tibble or data frame
  check_data_frame(data)

  # check that stat is mean, sd, or cov
  if(length(stat) != 1 | !is.character(stat)){
    stop("Invalid summary statistic type provided. Must be mean, sd, or cov.")
  }
  stat <- standardize_option(stat, "stat")
  check_stat(stat, stats_avail = c("mean", "sd", "cov"))

  # check for correct/necessary column names: term, E, P, A, and additional sd or cov columns if needed.
  check_data_cols(data, program = "bayesact", group = "none", stat = stat)

  # last but not least, institution codes. It's okay if they aren't there, but print a warning.
  data <- check_inst_codes(data)

  ### NOW do necessary reformatting
  data_formatted <- reformat(data, program = "bayesact", stat = stat)

  return(data_formatted)
}

