####### DICTIONARIES


### TERM TABLE


#' Terms
#'
#' Terms of all types contained in all available dictionaries with indicators for which dictionary contains them.
#' Note that terms have been standardized between dictionaries to facilitate comparison, so terms here may differ from those in the original source data files in substantively unimportant ways (capitalization, spacing, spelling, etc).
#' There is one column per dictionary that includes this type of term. Whether or not a specific dictionary includes a particular term is indicated by 0/1 indicators.
#'
#' @format A data frame with 5608 rows and 27 variables:
#' \describe{
#'   \item{term}{concept}
#'   \item{component}{component this term represents (identity, behavior, modifier, or setting)}
#'   \item{china1999}{dictionary}
#'   \item{dukecommunity2015}{dictionary}
#'   \item{dukestudent2015}{dictionary}
#'   \item{egypt2015}{dictionary}
#'   \item{expressive2002}{dictionary}
#'   \item{gaymensanfrancisco1980}{dictionary}
#'   \item{germany1989}{dictionary}
#'   \item{germany2007}{dictionary}
#'   \item{household1994}{dictionary}
#'   \item{indiana2003}{dictionary}
#'   \item{internationaldomesticrelations1981}{dictionary}
#'   \item{internet1998}{dictionary}
#'   \item{japan1995}{dictionary}
#'   \item{morocco2015}{dictionary}
#'   \item{nc1978}{dictionary}
#'   \item{nireland1977}{dictionary}
#'   \item{ontario1980}{dictionary}
#'   \item{ontario2001}{dictionary}
#'   \item{politics2003}{dictionary}
#'   \item{texas1998}{dictionary}
#'   \item{uga2015}{dictionary}
#'   \item{usfullsurveyor2015}{dictionary}
#'   \item{usmturk2015}{dictionary}
#'   \item{usstudent2015}{dictionary}
#'   ...
#' }
"term_table"


### DICTIONARY DATA FILES

#' EPA summary statistics, all datasets
#'
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 63400 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{component}{}
#'   \item{dataset}{}
#'   \item{context}{}
#'   \item{year}{}
#'   \item{gender}{}
#'   \item{instcodes}{}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{n_E}{}
#'   \item{n_P}{}
#'   \item{n_A}{}
#'   \item{sd_E}{}
#'   \item{sd_P}{}
#'   \item{sd_A}{}
#'   \item{cov_EE}{}
#'   \item{cov_EP}{}
#'   \item{cov_EA}{}
#'   \item{cov_PE}{}
#'   \item{cov_PP}{}
#'   \item{cov_PA}{}
#'   \item{cov_AE}{}
#'   \item{cov_AP}{}
#'   \item{cov_AA}{}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"epa_summary_statistics"



#' Individual data
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 674389 rows and 13 variables:
#' \describe{
#'   \item{dataset}{the data collection effort the observation belongs to}
#'   \item{context}{context in which dataset was collect (usually country)}
#'   \item{year}{year dataset collected/published}
#'   \item{userid}{individual identifier}
#'   \item{gender}{respondent's gender identity}
#'   \item{age}{respondent's age or age bracket}
#'   \item{race1}{respondent's primary racial identification}
#'   \item{race2}{respondent's secondary racial identification}
#'   \item{term}{dictionary term}
#'   \item{component}{the term's type}
#'   \item{E}{evaluation rating}
#'   \item{P}{potency rating}
#'   \item{A}{activity rating}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"individual"


########### EQUATIONS



# No summary tables included; I am not sure what summary information is useful for equation files

### EQUATIONS


#' All equation dataframes
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 8 rows (terms) and 4 variables:
#' \describe{
#'   \item{key}{equation set name}
#'   \item{equation_type}{type of equation}
#'   \item{gender}{equation gender}
#'   \item{df}{dataframe with equation coefficients}
#'   ...
#' }
#' @source Interact (May 2021)
"equations"
