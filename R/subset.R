#' epa_subset
#'
#' EPA summary statistics dictionary search and subset
#'
#' @param expr A term, regular expression, or list of terms or regexs to search. If a list is provided, entries will be treated as separated by "or", so all terms matching one or more of the entries will be returned. Default matches all terms.
#' @param exactmatch Logical indicating whether the function should return only exact matches to the expression provided. If FALSE (default), all terms containing the expression are returned.
#' @param dataset The key of the dataset (or list of multiple) to search in. Default is "all.
#' @param component The component of the dictionary to use (identity, behavior, modifier, setting). Default is "all."
#' @param gender The gender of the dictionary to use (male, female, average). Default it "all."
#' @param stat The statistics to include in the subset that is returned. Default is all, options are mean, sd (standard deviation), cov (covariance), and n (number of raters). Terms that do not contain values for the required statistic will be excluded from the results.
#' @param stat_na_exclude Ignored if stat is not specified. A logical indicating whether to exclude entries with NA values for any of the required statistics. Default is TRUE.
#' @param instcodes Logical, whether to include the institution codes in the output. Default is TRUE.
#'
#' @return FALSE if the provided term or expression is not in any provided dictionary. If it occurs at least once, returns the subset of the dictionary(s) of interest where the term matches the provided expression.
#' @export
epa_subset <- function(expr = ".*", exactmatch = FALSE, dataset = "all", component = "all", gender = "all", stat = "all", stat_na_exclude = TRUE, instcodes = TRUE){
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


#' Extract single equation data frame
#'
#' @param key the name of the equation set, Call eqn_info() or see package readme for options.
#' @param equation_type the type of the equation. Options: emotionid, impressionabo, impressionabos, selfdir, traitid
#' @param gender gender. Average, female, or male.
#'
#' @return equation dataframe
#' @export
#'
#' @examples
get_eqn <- function(key, equation_type = "impressionabo", gender = "average"){
  gender <- dplyr::case_when(
    gender %in% c("a", "av", "mean") ~ "average",
    gender %in% c("m", "man") ~ "male",
    gender %in% c("f", "woman") ~ "female",
    TRUE ~ gender
  )

  if(!(key %in% equations$key)){
    stop(paste0("Key ", key, " is not a valid equation key."))
  }

  keysub <- equations[which(equations$key == key),]

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



