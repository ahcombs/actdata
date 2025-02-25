% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/raw_data_processing.R
\name{epa_summary}
\alias{epa_summary}
\title{epa_summary}
\usage{
epa_summary(data)
}
\arguments{
\item{data}{individual level data frame with columns for term, component, E, P, and A.}
}
\value{
a summary dataset with one row per term. Includes the evaluation, potency,
and activity mean, standard deviation, and variance-covariance matrix entries
for each term/component combination. Values are rounded to the nearest .01.
}
\description{
Calculates the mean, standard deviation, and variance-covariance matrix for
each term in an individual-level data set. This is useful when a user wants
summary EPA information for a subset of respondents, for example, when comparing
cultural meaning across groups. In this case, a user would first create the
desired individual data subsets using the \code{\link[=epa_subset]{epa_subset()}} function, then pass the
resulting data frames to this function to calculate relevant summary statistics.
}
\examples{
epa_summary(dplyr::filter(epa_subset(datatype = "individual", dataset = "usfullsurveyor2015"),
    gender == "Male"))
}
