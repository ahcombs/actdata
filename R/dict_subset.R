# TODO: helper functions for creating dictionary subsets?




#' epa_summary
#'
#' Calculates the mean, standard deviation, and variance-covariance matrix for each term in one of the included individual datasets. This is useful when a user wants summary EPA information for a subset of respondents, for example, when comparing cultural meaning across groups.
#'
#' @param data individual level data
#'
#' @return a summary dataset with one row per term. Includes the evaluation, potency, and activity mean, standard deviation, and variance-covariance matrix entries for each term.
#' @export
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
    dplyr::select(-tcid)
  return(sum_data)
}
