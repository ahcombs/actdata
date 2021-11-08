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
#'   \item{prisonersdilemma}{dictionary}
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
#' TODO: Finish updating
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 75169 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"epa_summary_statistics"



#' Individual data, Duke community sample, 2015
#'
#' TODO: Finish updating
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 75169 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"dukecommunity2015_individual"


#' Individual data, Duke student sample, 2015
#'
#' TODO: Finish updating
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 75169 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"dukestudent2015_individual"



#' Individual data, Egypt, 2015
#'
#' TODO: Finish updating
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 75169 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"egypt2015_individual"



#' Individual data, Morocco, 2015
#'
#' TODO: Finish updating
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 75169 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"morocco2015_individual"



#' Individual data, UGA student sample, 2015
#'
#' TODO: Finish updating
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 75169 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"uga2015_individual"



#' Individual data, full US surveyor sample, 2015
#'
#' TODO: Finish updating
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 75169 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"usfullsurveyor2015_individual"



#' Individual data, US Amazon Turk sample 2015
#'
#' TODO: Finish updating
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 75169 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"usmturk2015_individual"



#' Individual data, US student sample, 2015
#'
#' Combination of UGA and Duke samples
#'
#' TODO: Finish updating
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 75169 rows and 25 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"usstudent2015_individual"



########### EQUATIONS



# No summary tables included; I am not sure what summary information is useful for equation files

### EQUATION DATA FILES


#' US 2010 trait-identity (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 8 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"us2010_traitid_av_eqn"

#' US 2010 self-directed action (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"us2010_selfdir_f_eqn"

#' US 2010 self-directed action (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"us2010_selfdir_m_eqn"

#' US 2010 impression change actor-behavior-object-setting (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 36 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"us2010_impressionabos_f_eqn"

#' US 2010 impression change actor-behavior-object-setting (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 34 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"us2010_impressionabos_m_eqn"

#' US 2010 impression change actor-behavior-object (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 15 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"us2010_impressionabo_av_eqn"

#' US 2010 emotion identity (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 9 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"us2010_emotionid_f_eqn"

#' US 2010 emotion identity (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 9 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"us2010_emotionid_m_eqn"


#' North Carolina 1978 trait-identity (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 8 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_traitid_av_eqn"

#' North Carolina 1978 self-directed action (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_selfdir_f_eqn"

#' North Carolina 1978 self-directed action (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_selfdir_m_eqn"

#' North Carolina 1978 impression change actor-behavior-object-setting (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 36 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_impressionabos_f_eqn"

#' North Carolina 1978 impression change actor-behavior-object-setting (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 34 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_impressionabos_m_eqn"

#' North Carolina 1978 impression change actor-behavior-object (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 20 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_impressionabo_f_eqn"

#' North Carolina 1978 impression change actor-behavior-object (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 20 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_impressionabo_m_eqn"

#' North Carolina 1978 emotion identity (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 9 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_emotionid_f_eqn"

#' North Carolina 1978 emotion identity (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 9 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_emotionid_m_eqn"


#' Morocco 2015 trait-identity (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 8 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"morocco2015_traitid_av_eqn"

#' Morocco 2015 self-directed action (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"morocco2015_selfdir_f_eqn"

#' Morocco 2015 self-directed action (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"morocco2015_selfdir_m_eqn"

#' Morocco 2015 impression change actor-behavior-object-setting (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 36 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"morocco2015_impressionabos_f_eqn"

#' Morocco 2015 impression change actor-behavior-object-setting (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 34 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"morocco2015_impressionabos_m_eqn"

#' Morocco 2015 impression change actor-behavior-object (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 15 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"morocco2015_impressionabo_av_eqn"

#' Morocco 2015 emotion identity (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 9 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"morocco2015_emotionid_f_eqn"

#' Morocco 2015 emotion identity (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 9 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"morocco2015_emotionid_m_eqn"


#' Japan 1984 trait-identity (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 13 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"japan1984_traitid_f_eqn"

#' Japan 1984 trait-identity (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 13 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"japan1984_traitid_m_eqn"

#' Japan 1984 self-directed action (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"japan1984_selfdir_f_eqn"

#' Japan 1984 self-directed action (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"japan1984_selfdir_m_eqn"

#' Japan 1984 impression change actor-behavior-object-setting (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 29 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"japan1984_impressionabos_f_eqn"

#' Japan 1984 impression change actor-behavior-object-setting (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 29 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"japan1984_impressionabos_m_eqn"

#' Japan 1984 impression change actor-behavior-object (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 22 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"japan1984_impressionabo_f_eqn"

#' Japan 1984 impression change actor-behavior-object (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 25 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"japan1984_impressionabo_m_eqn"

#' Japan 1984 emotion identity (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 13 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"japan1984_emotionid_f_eqn"

#' Japan 1984 emotion identity (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 13 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"japan1984_emotionid_m_eqn"


#' Germany 2007 trait-identity (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 11 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_traitid_av_eqn"

#' Germany 2007 self-directed action (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_selfdir_f_eqn"

#' Germany 2007 self-directed action (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_selfdir_m_eqn"

#' Germany 2007 impression change actor-behavior-object-setting (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 36 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_impressionabos_f_eqn"

#' Germany 2007 impression change actor-behavior-object-setting (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 34 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_impressionabos_m_eqn"

#' Germany 2007 impression change actor-behavior-object (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 49 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_impressionabo_av_eqn"

#' Germany 2007 emotion identity (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 11 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_emotionid_av_eqn"


#' Egypt 2014 trait-identity (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 8 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"egypt2014_traitid_av_eqn"

#' Egypt 2014 self-directed action (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"egypt2014_selfdir_f_eqn"

#' Egypt 2014 self-directed action (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"egypt2014_selfdir_m_eqn"

#' Egypt 2014 impression change actor-behavior-object-setting (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 36 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"egypt2014_impressionabos_f_eqn"

#' Egypt 2014 impression change actor-behavior-object-setting (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 34 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"egypt2014_impressionabos_m_eqn"

#' Egypt 2014 impression change actor-behavior-object (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 14 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"egypt2014_impressionabo_av_eqn"

#' Egypt 2014 emotion identity (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 9 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"egypt2014_emotionid_f_eqn"

#' Egypt 2014 emotion identity (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 9 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"egypt2014_emotionid_m_eqn"


#' China 2000 trait-identity (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 10 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"china2000_traitid_f_eqn"

#' China 2000 trait-identity (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 9 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"china2000_traitid_m_eqn"

#' China 2000 self-directed action (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"china2000_selfdir_f_eqn"

#' China 2000 self-directed action (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"china2000_selfdir_m_eqn"

#' China 2000 impression change actor-behavior-object-setting (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 29 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"china2000_impressionabos_f_eqn"

#' China 2000 impression change actor-behavior-object-setting (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 29 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"china2000_impressionabos_m_eqn"

#' China 2000 impression change actor-behavior-object (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 14 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"china2000_impressionabo_f_eqn"

#' China 2000 impression change actor-behavior-object (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"china2000_impressionabo_m_eqn"

#' China 2000 emotion identity (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 10 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"china2000_emotionid_f_eqn"

#' China 2000 emotion identity (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 9 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"china2000_emotionid_m_eqn"


#' Canada 2001-2003 trait-identity (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 8 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada20012003_traitid_av_eqn"

#' Canada 2001-2003 self-directed action (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada20012003_selfdir_f_eqn"

#' Canada 2001-2003 self-directed action (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada20012003_selfdir_m_eqn"

#' Canada 2001-2003 impression change actor-behavior-object-setting (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 36 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada20012003_impressionabos_f_eqn"

#' Canada 2001-2003 impression change actor-behavior-object-setting (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 34 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada20012003_impressionabos_m_eqn"

#' Canada 2001-2003 impression change actor-behavior-object (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 16 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada20012003_impressionabo_f_eqn"

#' Canada 2001-2003 impression change actor-behavior-object (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 16 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada20012003_impressionabo_m_eqn"

#' Canada 2001-2003 emotion identity (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 8 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada20012003_emotionid_av_eqn"


#' Canada 1985 trait-identity (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 8 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada1985_traitid_av_eqn"

#' Canada 1985 self-directed action (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada1985_selfdir_f_eqn"

#' Canada 1985 self-directed action (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 12 rows (terms) and 7 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada1985_selfdir_m_eqn"

#' Canada 1985 impression change actor-behavior-object-setting (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 36 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada1985_impressionabos_f_eqn"

#' Canada 1985 impression change actor-behavior-object-setting (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 34 rows (terms) and 13 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   \item{V11}{equation}
#'   \item{V12}{equation}
#'   \item{V13}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada1985_impressionabos_m_eqn"

#' Canada 1985 impression change actor-behavior-object (gender = female)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 38 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada1985_impressionabo_f_eqn"

#' Canada 1985 impression change actor-behavior-object (gender = male)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info().
#'
#' @format A data frame with 38 rows (terms) and 10 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   \item{V5}{equation}
#'   \item{V6}{equation}
#'   \item{V7}{equation}
#'   \item{V8}{equation}
#'   \item{V9}{equation}
#'   \item{V10}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada1985_impressionabo_m_eqn"

#' Canada 1985 emotion identity (gender = average)
#'
#' These values are reported as given in Interact. If gender is listed as average, this indicates that for the given study and subset, the values provided in Interact for male and female are identical.
#'
#' For more information about available equation files, call eqn_info()
#'
#' @format A data frame with 8 rows (terms) and 4 variables:
#' \describe{
#'   \item{V1}{term}
#'   \item{V2}{equation}
#'   \item{V3}{equation}
#'   \item{V4}{equation}
#'   ...
#' }
#' @source Interact (May 2021)
"canada1985_emotionid_av_eqn"

