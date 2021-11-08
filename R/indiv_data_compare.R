# FILE COMPARISON

# This script checks some data quality considerations with regard to the individual level data I have

# Particularly:
# 1. What is with all the zeros? Are these just in the surveyor datasets? If there seems to be an odd distribution, should I be counting them as skips rather than including them in statistic calculation?
# 2. Do the means that I calculate from these data match the means that are reported online for the same datasets? If not, it could be that the datasets were cleaned differently.

# Once I figure this out, I should remove the mean-only sets for the data collections with individual data. UGA, US student, MTurk, Egypt, Morocco, the full surveyor sample.


# MEAN COMPARISON
# there's a rounding thing. the means-only datasets are rounded to the nearest .01

allzero <- function(data){
  if(!all(data$e_diff == 0, na.rm = TRUE) |
     !all(data$p_diff == 0, na.rm = TRUE) |
     !all(data$a_diff == 0, na.rm = TRUE)){
    # warning(message = "individual dataset and means only dataset are different")
    return(FALSE)
  } else {
    return(TRUE)
  }
}

data_eqcheck <- function(datasetname){
  d <- epa_summary_statistics %>%
    dplyr::filter(dataset == datasetname) %>%
    dplyr::mutate(indiv = !is.na(n_E)) %>%
    dplyr::select(term, component, E, P, A, indiv) %>%
    tidyr::pivot_wider(names_from = indiv, values_from = c(E, P, A)) %>%
    dplyr::mutate(e_diff = E_TRUE - E_FALSE,
                  p_diff = P_TRUE - P_FALSE,
                  a_diff = A_TRUE - A_FALSE)

  return(d)
}

check_equal <- function(datasetname){
  d <- data_eqcheck(datasetname)

  if(allzero(d)){
    return(TRUE)
  } else {
    return(d)
  }
}

# exact equality when rounded
check_equal("uga2015")

# same
check_equal("usstudent2015")

# not quite exact equality but all differences within .01
check_equal("usmturk2015")
mturk <- data_eqcheck("usmturk2015")

# exactly equal but there are a number of terms with cryptic codes--find key
check_equal("egypt2015")
egypt <- data_eqcheck("egypt2015")

# same as egypt--exactly equal but with a number of cryptic terms
check_equal("morocco2015")
morocco <- data_eqcheck("morocco2015")



# LOOK AT DISTRIBUTION OF ZEROS


zeros_fsurv <- usfullsurveyor2015_individual %>%
  dplyr::select(term, E, P, A) %>%
  tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
  dplyr::mutate(rating = as.numeric(rating),
                truezero = rating == 0)

# weird pattern; you can see the 9 point scale but there are also ratings in between... and lots of zeros on activity especially
ggplot2::ggplot(zeros_fsurv, ggplot2::aes(x = rating)) +
  ggplot2::geom_histogram() +
  ggplot2::facet_wrap("dim")


# same here in the subset
zeros_dcomm <- dukecommunity2015_individual %>%
  dplyr::select(term, E, P, A) %>%
  tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
  dplyr::mutate(rating = as.numeric(rating),
                truezero = rating == 0)

ggplot2::ggplot(zeros_dcomm, ggplot2::aes(x = rating)) +
  ggplot2::geom_histogram() +
  ggplot2::facet_wrap("dim")


# same again
zeros_usstudent <- usstudent2015_individual %>%
  dplyr::select(term, E, P, A) %>%
  tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
  dplyr::mutate(rating = as.numeric(rating),
                truezero = rating == 0)

ggplot2::ggplot(zeros_usstudent, ggplot2::aes(x = rating)) +
  ggplot2::geom_histogram() +
  ggplot2::facet_wrap("dim")


# and also same with mturk which is interesting because mturk was collected with qualtrics
zeros_mturk <- usmturk2015_individual %>%
  dplyr::select(term, E, P, A) %>%
  tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
  dplyr::mutate(rating = as.numeric(rating),
                truezero = rating == 0)

ggplot2::ggplot(zeros_mturk, ggplot2::aes(x = rating)) +
  ggplot2::geom_histogram() +
  ggplot2::facet_wrap("dim")


# fewer zeros here relative to other ratings
zeros_egypt <- egypt2015_individual %>%
  dplyr::select(term, E, P, A) %>%
  tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
  dplyr::mutate(rating = as.numeric(rating),
                truezero = rating == 0)

ggplot2::ggplot(zeros_egypt, ggplot2::aes(x = rating)) +
  ggplot2::geom_histogram() +
  ggplot2::facet_wrap("dim")


# same here as egypt
zeros_morocco <- morocco2015_individual %>%
  dplyr::select(term, E, P, A) %>%
  tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
  dplyr::mutate(rating = as.numeric(rating),
                truezero = rating == 0)

ggplot2::ggplot(zeros_morocco, ggplot2::aes(x = rating)) +
  ggplot2::geom_histogram() +
  ggplot2::facet_wrap("dim")





# NOW LOOK AT TRUE ZEROS
# The US samples are around 10% true zeros
# The Arabic samples are closer to 5%
# Doesn't look like much difference between the surveyor sample and the mturk sample.
prop.table(table(zeros_fsurv$truezero))
prop.table(table(zeros_dcomm$truezero))
prop.table(table(zeros_usstudent$truezero))
prop.table(table(zeros_mturk$truezero))
prop.table(table(zeros_egypt$truezero))
prop.table(table(zeros_morocco$truezero))



