% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/raw_data_processing.R
\name{standardize_terms}
\alias{standardize_terms}
\title{Dictionary term standardization}
\usage{
standardize_terms(data, key, component = "undetermined")
}
\arguments{
\item{data}{the dictionary dataset}

\item{key}{string name of the dataset}

\item{component}{string type of dictionary}
}
\value{
the standardized dataset
}
\description{
This fixes spelling mistakes and standardizes choices of capitalization, spaces, etc so that terms are easily comparable across dictionaries
Used in the data prep script in the raw data folder
}
\keyword{internal}
