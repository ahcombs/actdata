####### DICTIONARIES


### TERM TABLE


#' Terms
#'
#' Terms of all types contained in all available dictionaries with
#' indicators for which dictionary contains them. Note that terms have
#' been standardized between dictionaries to facilitate comparison, so
#' terms here may differ from those in the original source data files in
#' substantively unimportant ways (capitalization, spacing, spelling, etc).
#' There is one column per dictionary that includes this type of term.
#' Whether or not a specific dictionary includes a particular term is
#' indicated by 0/1 indicators.
#'
#' @format A data frame with 5608 rows and 27 variables:
#' \describe{
#'   \item{term}{concept}
#'   \item{component}{component this term represents (identity, behavior,
#'       modifier, or setting)}
#'   \item{calcuttaall2017}{dictionary}
#'   \item{calcuttasubset2017}{dictionary}
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
#'   \item{occs2019}{dictionary}
#'   \item{occs2020}{dictionary}
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
#' This data frame contains summary statistics for EPA ratings collected in
#' many different data collection efforts. The function `epa_subset()` provides
#' functionality for easily filtering it in desired ways, and I recommend using
#' that function rather than working with this data frame directly.
#'
#' For more information on data collections, call `dict_info()`.
#'
#' @format A data frame with 72951 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{component}{the term's type}
#'   \item{dataset}{what data collection the statistics originate from}
#'   \item{context}{the country or other context data were collected in}
#'   \item{year}{the approximate year of data collection}
#'   \item{gender}{whether statistics are calculated for male respondents,
#'       female respondents, or all respondents}
#'   \item{instcodes}{institution codes}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{n_E}{number of respondents who gave valid E ratings}
#'   \item{n_P}{number of respondents who gave valid P ratings}
#'   \item{n_A}{number of respondents who gave valid A ratings}
#'   \item{sd_E}{evaluation standard deviation}
#'   \item{sd_P}{potency standard deviation}
#'   \item{sd_A}{activity standard deviation}
#'   \item{cov_EE}{covariance}
#'   \item{cov_EP}{covariance}
#'   \item{cov_EA}{covariance}
#'   \item{cov_PE}{covariance}
#'   \item{cov_PP}{covariance}
#'   \item{cov_PA}{covariance}
#'   \item{cov_AE}{covariance}
#'   \item{cov_AP}{covariance}
#'   \item{cov_AA}{covariance}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"epa_summary_statistics"



#' Individual data
#'
#' This data frame contains respondent-level data from a number of recent data collections.
#' The public release version of these data has been trimmed in order to preserve respondent
#' privacy. Covariates retained, where available, are gender identification, racial/ethnic
#' identification, and age. Full versions of these data may be available from the authors.
#' Call `dict_info()` for citation information.
#'
#' Please note that covariates *may not be comparable between data sets*. Different
#' data collections provided different response options for these questions. No recoding
#' has been done in this package. Racial and ethnic identification variables show the most
#' variation between data sets. If you wish to use these variables for research, you should
#' contact the data authors in order to obtain questionnaire information.
#'
#' @format A data frame with 794449 rows and 16 variables:
#' \describe{
#'   \item{dataset}{the data collection effort the observation belongs to}
#'   \item{context}{context in which dataset was collect (usually country)}
#'   \item{year}{year dataset collected/published}
#'   \item{userid}{individual identifier}
#'   \item{gender}{respondent's gender identity. Male/female except in
#'       occupations data sets, where genderqueer/nonbinary and other are options as well.}
#'   \item{age}{respondent's age or age bracket}
#'   \item{eth}{respondent's ethnic identification (relevant to uga2015, mturk2015, usstudent2015, usfullsurveyor2015)}
#'   \item{race}{respondent's racial/ethnic identification (relevant to occs2019 and occs2020)}
#'   \item{race1}{respondent's primary racial identification (relevant to dukecommunity2015, dukestudent2015, uga2015, usmturk2015, usstudent2015, usfullsurveyor2015)}
#'   \item{race2}{respondent's secondary racial identification (relevant to dukecommunity2015, dukestudent2015, uga2015, usmturk2015, usstudent2015, usfullsurveyor2015)}
#'   \item{term}{dictionary term}
#'   \item{component}{the term's type}
#'   \item{instcodes}{institution code}
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
#' This nested data frame provides information and coefficients for ACT equations.
#' Coefficient values are reported as given in Interact. If gender is listed as average,
#' this indicates that for the given study and subset, the values provided in
#' Interact for male and female are identical. To retrieve coefficients for particular
#' equation sets, I recommend using the `get_eqn()` function rather than working
#' with this data frame directly.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A nested data frame with 78 rows and 4 columns
#' \describe{
#'   \item{key}{equation set name}
#'   \item{equation_type}{type of equation}
#'   \item{gender}{equation gender}
#'   \item{df}{dataframe with equation coefficients}
#'   ...
#' }
#' @source Interact (May 2021)
"equations"
