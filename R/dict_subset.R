# TODO: do something with instcodes. Ideally, supply them for all.

#' get_data
#'
#' Helper function for filtering the dictionary summary data. This function allows the user to obtain subsets that include only specified datasets, components, genders, and columns.
#' If the specified combination does not exist, this function throws a warning to the user.
#'
#' @param dataset key or list of keys (use dict_info() for list)
#' @param component component or list of components (identity, behavior, modifier, setting; can abbreviate i, b, s, m)
#' @param type type or list of types (mean, sd, cov)
#' @param gender gender or list of genders (male, female, average; can abbreviate m, f, a or av)
#'
#' @return a dataframe containing the desired subset of the EPA dictionary summary data.
#' @export
get_data <- function(dataset, component = "all", type = "all", gender = "all"){
  keys_avail <- unique(epa_summary_statistics[,c("dataset")])
  for(d in dataset){
    if(!(d %in% unlist(keys_avail))){
      stop(message = paste0("Invalid dataset '", d,"' provided. Use dict_info() to see datasets available."))
    }
  }

  data <- epa_summary_statistics[epa_summary_statistics$"dataset" %in% dataset,]

  if(!("all" %in% component)){
    check_valid(component, c("identity", "behavior", "modifier", "setting", "i", "b", "m", "s", "behaviour"))

    component <- gsub("^i$", "identity", component)
    component <- gsub("^b$", "behavior", component)
    component <- gsub("^m$", "modifier", component)
    component <- gsub("^s$", "setting", component)
    component <- gsub("^behaviour$", "behavior", component)
    component <- unique(component)

    data <- data[data$"component" %in% component,]
  }

  if(!("all" %in% type)){
    check_valid(type, c("mean", "sd", "cov", "m", "n"))

    extra <- type[!(type %in% c("mean", "m"))]

    if(length(extra) > 0){
      if("n" %in% extra){
        extra <- extra[extra != "n"]
        extra <- append(extra, grep("n_.*", names(data), value = TRUE))
      }
      if("cov" %in% extra){
        extra <- extra[extra != "cov"]
        extra <- append(extra, grep("cov_.*", names(data), value = TRUE))
      }
      if("sd" %in% extra){
        extra <- extra[extra != "sd"]
        extra <- append(extra, grep("sd_.*", names(data), value = TRUE))
      }
    }
    data <- dplyr::select(data, term:A, instcodes, all_of(extra))
  }

  if(!("all" %in% gender)){
    check_valid(gender, c("male", "female", "average", "m", "f", "a", "av"))

    gender <- gsub("^m$", "male", gender)
    gender <- gsub("^f$", "female", gender)
    gender <- gsub("^a$", "average", gender)
    gender <- gsub("^av$", "average", gender)
    gender <- unique(gender)

    data <- data[data$"gender" %in% gender,]
  }

  if(nrow(data) == 0){
    warning(message = "This subset is empty. This may be because the specified dataset does not contain the requested element(s).")
  }

  return(data)

}

check_valid <- function(value, allowed){
  for(v in value){
    if(!(v %in% allowed)){
      stop(paste0("Invalid input '", v, ".'"))
    }
  }
  return(invisible(TRUE))
}


utils::globalVariables("where")
#' epa_summary
#'
#' Calculates the mean, standard deviation, and variance-covariance matrix for each term in one of the included individual datasets. This is useful when a user wants summary EPA information for a subset of respondents, for example, when comparing cultural meaning across groups.
#'
#' @param data individual level data
#'
#' @return a summary dataset with one row per term. Includes the evaluation, potency, and activity mean, standard deviation, and variance-covariance matrix entries for each term.
#' @export
#'
epa_summary <- function(data){
  if(!("term" %in% names(data))){
    stop(message = "data must have a column named 'term'")
  }
  trim_data <- data %>%
    dplyr::select(term, component, E, P, A)

  trim_data <- trim_data %>%
    mutate(tcid = paste(term, component, sep = ""))

  sum_data <- trim_data %>%
    dplyr::mutate(across(c(-term, -component, -tcid), as.numeric)) %>%
    dplyr::group_by(term, component, tcid) %>%
    dplyr::summarize(
      # TODO: what's the deal with the zeros? skips? Do all datasets have a lot of zeros?
      n_E = sum(!is.na(E)),
      n_P = sum(!is.na(P)),
      n_A = sum(!is.na(A)),
      mean_E = mean(E, na.rm = TRUE),
      mean_P = mean(P, na.rm = TRUE),
      mean_A = mean(A, na.rm = TRUE),
      sd_E = ifelse(n_E > 1, sd(E, na.rm = TRUE), NA),
      sd_P = ifelse(n_P > 1, sd(P, na.rm = TRUE), NA),
      sd_A = ifelse(n_A > 1, sd(A, na.rm = TRUE), NA)) %>%
    dplyr::ungroup()

  # ADD COV
  # Calculate a separate covariance matrix for each term, and input the values into the dataframe above.
  alltcid <- unique(sum_data$tcid)
  covars <- data.frame(matrix(nrow = 0, ncol = 10))
  names(covars) <- c("term", "cov_EE", "cov_EP", "cov_EA", "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA")
  for(t in alltcid){
    subset <- trim_data[trim_data$tcid == t,] %>%
      dplyr::select(E, P, A) %>%
      dplyr::mutate(across(everything(), as.numeric))

    nE <- sum_data[sum_data$tcid == t, "n_E"][[1]]
    nP <- sum_data[sum_data$tcid == t, "n_P"][[1]]
    nA <- sum_data[sum_data$tcid == t, "n_A"][[1]]

    # check how to handle missing values here--right now we are going to listwise delete.
    # There is also a pairwise option but it sounds more complicated.
    # Really, we don't need to include all 9 values here; 3 should be repeated.
    # Also, the diagonals should be the square of the sd values--there's an argument for keeping this in anyway though if we want to report var and sd (but do we need sd?)
    # TODO: Remove once tested
    if(nE > 0 & nP > 0 & nA > 0){
      covarmat <- cov(subset, use = "complete.obs") # 3x3 mat
      covarvec <- data.frame(tcid = t,
                             cov_EE = ifelse(nE > 1, covarmat[1, 1], NA),
                             cov_EP = ifelse(nE > 1 & nP > 1, covarmat[1, 2], NA),
                             cov_EA = ifelse(nE > 1 & nA > 1, covarmat[1, 3], NA),
                             cov_PE = ifelse(nP > 1 & nE > 1, covarmat[2, 1], NA),
                             cov_PP = ifelse(nP > 1, covarmat[2, 2], NA),
                             cov_PA = ifelse(nP > 1 & nA > 1, covarmat[2, 3], NA),
                             cov_AE = ifelse(nA > 1 & nE > 1, covarmat[3, 1], NA),
                             cov_AP = ifelse(nA > 1 & nP > 1, covarmat[3, 2], NA),
                             cov_AA = ifelse(nA > 1,covarmat[3, 3], NA))
    } else {
      covarvec <- data.frame(tcid = t,
                             cov_EE = NA,
                             cov_EP = NA,
                             cov_EA = NA,
                             cov_PE = NA,
                             cov_PP = NA,
                             cov_PA = NA,
                             cov_AE = NA,
                             cov_AP = NA,
                             cov_AA = NA)
    }

    covars <- rbind(covars, covarvec)
  }

  sum_data <- dplyr::left_join(sum_data, covars, by = "tcid") %>%
    dplyr::select(-tcid) %>%
    # round to the nearest .01
    dplyr::mutate(
      dplyr::across(
        where(is.numeric),
        ~round(.,2)
      )
    )
  return(sum_data)
}
