% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{term_table}
\alias{term_table}
\title{Terms}
\format{
A data frame with 5608 rows and 27 variables:
\describe{
\item{term}{concept}
\item{component}{component this term represents (identity, behavior,
modifier, or setting)}
\item{artifactmods2022}{dictionary}
\item{calcuttaall2017}{dictionary}
\item{calcuttasubset2017}{dictionary}
\item{china1999}{dictionary}
\item{dukecommunity2015}{dictionary}
\item{dukestudent2015}{dictionary}
\item{egypt2015}{dictionary}
\item{employeeorg2022}{dictionary}
\item{expressive2002}{dictionary}
\item{gaymensanfrancisco1980}{dictionary}
\item{generaltech2020}{dictionary}
\item{germany1989}{dictionary}
\item{germany2007}{dictionary}
\item{groups2017}{dictionary}
\item{groups2019}{dictionary}
\item{household1994}{dictionary}
\item{humanvalues2022}{dictionary}
\item{indiana2003}{dictionary}
\item{internationaldomesticrelations1981}{dictionary}
\item{internet1998}{dictionary}
\item{japan1995}{dictionary}
\item{morocco2015}{dictionary}
\item{mostafaviestimates2022}{dictionary}
\item{nc1978}{dictionary}
\item{nireland1977}{dictionary}
\item{nounphrasegrammar2019}{dictionary}
\item{occs2019}{dictionary}
\item{occs2020}{dictionary}
\item{occs2021}{dictionary}
\item{ontario1980}{dictionary}
\item{ontario2001}{dictionary}
\item{politics2003}{dictionary}
\item{products2022}{dictionary}
\item{techvshuman2021}{dictionary}
\item{texas1998}{dictionary}
\item{ugatech2008}{dictionary}
\item{uga2015}{dictionary}
\item{usfullsurveyor2015}{dictionary}
\item{usmturk2015}{dictionary}
\item{usstudent2015}{dictionary}
...
}
}
\usage{
term_table
}
\description{
Terms of all types contained in all available dictionaries with
indicators for which dictionary contains them. Note that terms have
been standardized between dictionaries to facilitate comparison, so
terms here may differ from those in the original source data files in
substantively unimportant ways (capitalization, spacing, spelling, etc).
There is one column per dictionary that includes this type of term.
Whether or not a specific dictionary includes a particular term is
indicated by 0/1 indicators.
}
\keyword{datasets}
