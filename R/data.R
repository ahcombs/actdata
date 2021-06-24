####### DICTIONARIES


### SUMMARY TABLES

#' Identity terms
#'
#' Identity terms contained in all publicly available dictionaries with indicators for which dictionary contains them.
#' Note that terms have been standardized between dictionaries to facilitate comparison, so terms here may differ from those in the original source data files in substantively unimportant ways (capitalization, spacing, spelling, etc).
#' There is one column per dictionary that includes this type of term. Whether or not a specific dictionary includes a particular term is indicated by 0/1 indicators.
#'
#' @format A data frame with 2198 rows and 22 variables:
#' \describe{
#'   \item{term}{identity term}
#'   \item{china1999}{dictionary}
#'   \item{egypt2015}{dictionary}
#'   \item{germany1989}{dictionary}
#'   \item{germany2007}{dictionary}
#'   \item{household1994}{dictionary}
#'   \item{indiana2003}{dictionary}
#'   \item{internet1998}{dictionary}
#'   \item{japan19892002}{dictionary}
#'   \item{morocco2015}{dictionary}
#'   \item{nc1978}{dictionary}
#'   \item{nireland1977}{dictionary}
#'   \item{ontario1980}{dictionary}
#'   \item{ontario2001}{dictionary}
#'   \item{politics2003}{dictionary}
#'   \item{prisonersdilemma}{dictionary}
#'   \item{texas1998}{dictionary}
#'   \item{uga2015}{dictionary}
#'   \item{uga2015bayesactsubset}{dictionary}
#'   \item{usfullsurveyor2015}{dictionary}
#'   \item{usmturk2015}{dictionary}
#'   \item{usstudent2015}{dictionary}
#'   ...
#' }
"term_table_ident"

#' Modifier terms
#'
#' Modifier terms contained in all publicly available dictionaries with indicators for which dictionary contains them.
#' Note that terms have been standardized between dictionaries to facilitate comparison, so terms here may differ from those in the original source data files in substantively unimportant ways (capitalization, spacing, spelling, etc).
#' There is one column per dictionary that includes this type of term. Whether or not a specific dictionary includes a particular term is indicated by 0/1 indicators.
#'
#' @format A data frame with 787 rows and 18 variables:
#' \describe{
#'   \item{term}{modifier term}
#'   \item{china1999}{dictionary}
#'   \item{egypt2015}{dictionary}
#'   \item{germany1989}{dictionary}
#'   \item{germany2007}{dictionary}
#'   \item{indiana2003}{dictionary}
#'   \item{japan19892002}{dictionary}
#'   \item{morocco2015}{dictionary}
#'   \item{nc1978}{dictionary}
#'   \item{ontario1980}{dictionary}
#'   \item{ontario2001}{dictionary}
#'   \item{prisonersdilemma}{dictionary}
#'   \item{texas1998}{dictionary}
#'   \item{uga2015}{dictionary}
#'   \item{uga2015bayesactsubset}{dictionary}
#'   \item{usfullsurveyor2015}{dictionary}
#'   \item{usmturk2015}{dictionary}
#'   \item{usstudent2015}{dictionary}
#'   ...
#' }
"term_table_mod"

#' Setting terms
#'
#' Setting terms contained in all publicly available dictionaries with indicators for which dictionary contains them.
#' Note that terms have been standardized between dictionaries to facilitate comparison, so terms here may differ from those in the original source data files in substantively unimportant ways (capitalization, spacing, spelling, etc).
#' There is one column per dictionary that includes this type of term. Whether or not a specific dictionary includes a particular term is indicated by 0/1 indicators.
#'
#' @format A data frame with 503 rows and 8 variables:
#' \describe{
#'   \item{term}{setting term}
#'   \item{china1999}{dictionary}
#'   \item{germany2007}{dictionary}
#'   \item{indiana2003}{dictionary}
#'   \item{internet1998}{dictionary}
#'   \item{japan19892002}{dictionary}
#'   \item{nc1978}{dictionary}
#'   \item{ontario2001}{dictionary}
#'   ...
#' }
"term_table_set"

#' Behavior terms
#'
#' Behavior terms contained in all publicly available dictionaries with indicators for which dictionary contains them.
#' Note that terms have been standardized between dictionaries to facilitate comparison, so terms here may differ from those in the original source data files in substantively unimportant ways (capitalization, spacing, spelling, etc).
#' There is one column per dictionary that includes this type of term. Whether or not a specific dictionary includes a particular term is indicated by 0/1 indicators.
#'
#' @format A data frame with 1655 rows and 26 variables:
#' \describe{
#'   \item{term}{behavior term}
#'   \item{china1999}{dictionary}
#'   \item{egypt2015}{dictionary}
#'   \item{expressive2002}{dictionary}
#'   \item{gaysex1980}{dictionary}
#'   \item{germany1989}{dictionary}
#'   \item{germany2007}{dictionary}
#'   \item{household1994}{dictionary}
#'   \item{indiana2003}{dictionary}
#'   \item{internationaldomesticrelations1981}{dictionary}
#'   \item{internet1998}{dictionary}
#'   \item{japan19892002}{dictionary}
#'   \item{morocco2015}{dictionary}
#'   \item{nc1978}{dictionary}
#'   \item{nireland1977}{dictionary}
#'   \item{ontario1980}{dictionary}
#'   \item{ontario2001}{dictionary}
#'   \item{politics2003}{dictionary}
#'   \item{prisonersdilemma}{dictionary}
#'   \item{prisonersdilemmaCOV}{dictionary}
#'   \item{texas1998}{dictionary}
#'   \item{uga2015}{dictionary}
#'   \item{uga2015bayesactsubset}{dictionary}
#'   \item{usfullsurveyor2015}{dictionary}
#'   \item{usmturk2015}{dictionary}
#'   \item{usstudent2015}{dictionary}
#'   ...
#' }
"term_table_beh"




### DICTIONARY DATA FILES

#' China 1999 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 448 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_behaviors_av_dict"

#' China 1999 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 448 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_behaviors_f_dict"

#' China 1999 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 448 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_behaviors_m_dict"

#' China 1999 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 582 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_identities_av_dict"

#' China 1999 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 582 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_identities_f_dict"

#' China 1999 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 582 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_identities_m_dict"

#' China 1999 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 302 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_mods_av_dict"

#' China 1999 modifiers (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 302 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_mods_f_dict"

#' China 1999 modifiers (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 302 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_mods_m_dict"

#' China 1999 settings (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 150 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_settings_av_dict"

#' China 1999 settings (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 150 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_settings_f_dict"

#' China 1999 settings (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 150 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institution codes for this term}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html}
"china1999_settings_m_dict"


#' Egypt 2015 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 368 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///egypt-dictionary-2015/}
"egypt2015_behaviors_av_dict"

#' Egypt 2015 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 397 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///egypt-dictionary-2015/}
"egypt2015_identities_av_dict"

#' Egypt 2015 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 233 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///egypt-dictionary-2015/}
"egypt2015_mods_av_dict"


#' Expressive behaviors 2002 (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 98 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/expressive_acts.htm}
"expressive2002_behaviors_av_dict"


#' Sexual behaviors 1980 (rated by gay men in San Francisco): subset of those with more positive views of unsafe sex (labeled "male" for interact purposes).
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 14 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/gay_sex.htm}
"gaysex1980_behaviors_m_dict"

#' Sexual behaviors 1980 (rated by gay men in San Francisco): subset of those with more negative views of unsafe sex (labeled "female" for interact purposes).
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 14 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/gay_sex.htm}
"gaysex1980_behaviors_f_dict"

#' Sexual behaviors 1980 (rated by gay men in San Francisco): average of both subsets
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 14 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/gay_sex.htm}
"gaysex1980_behaviors_av_dict"


#' Germany 1989 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 289 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany1989_behaviors_av_dict"

#' Germany 1989 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 289 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany1989_behaviors_f_dict"

#' Germany 1989 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 289 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany1989_behaviors_m_dict"

#' Germany 1989 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 444 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany1989_identities_av_dict"

#' Germany 1989 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 444 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany1989_identities_f_dict"

#' Germany 1989 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 444 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany1989_identities_m_dict"

#' Germany 1989 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 68 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany1989_mods_av_dict"

#' Germany 1989 modifiers (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 68 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany1989_mods_f_dict"

#' Germany 1989 modifiers (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 68 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany1989_mods_m_dict"


#' Germany 2007 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 407 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_behaviors_av_dict"

#' Germany 2007 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 407 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_behaviors_f_dict"

#' Germany 2007 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 407 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_behaviors_m_dict"

#' Germany 2007 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 371 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_identities_av_dict"

#' Germany 2007 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 371 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_identities_f_dict"

#' Germany 2007 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 371 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_identities_m_dict"

#' Germany 2007 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 333 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_mods_av_dict"

#' Germany 2007 modifiers (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 333 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_mods_f_dict"

#' Germany 2007 modifiers (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 333 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_mods_m_dict"

#' Germany 2007 settings (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 20 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_settings_av_dict"

#' Germany 2007 settings (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 20 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_settings_f_dict"

#' Germany 2007 settings (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 20 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"germany2007_settings_m_dict"


#' Household 1994 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 22 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/household.htm}
"household1994_behaviors_av_dict"

#' Household 1994 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 22 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/household.htm}
"household1994_behaviors_f_dict"

#' Household 1994 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 22 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/household.htm}
"household1994_behaviors_m_dict"

#' Household 1994 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 31 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/household.htm}
"household1994_identities_av_dict"

#' Household 1994 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 31 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/household.htm}
"household1994_identities_f_dict"

#' Household 1994 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 31 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/household.htm}
"household1994_identities_m_dict"


#' Indiana 2003 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 500 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_behaviors_av_dict"

#' Indiana 2003 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 500 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_behaviors_f_dict"

#' Indiana 2003 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 500 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_behaviors_m_dict"

#' Indiana 2003 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 500 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_identities_av_dict"

#' Indiana 2003 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 500 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_identities_f_dict"

#' Indiana 2003 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 500 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_identities_m_dict"

#' Indiana 2003 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 301 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_mods_av_dict"

#' Indiana 2003 modifiers (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 301 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_mods_f_dict"

#' Indiana 2003 modifiers (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 301 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_mods_m_dict"

#' Indiana 2003 settings (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 200 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_settings_av_dict"

#' Indiana 2003 settings (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 200 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_settings_f_dict"

#' Indiana 2003 settings (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 200 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"indiana2003_settings_m_dict"

#' International and domestic relations 1981 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 238 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/international_relations.htm
"internationaldomesticrelations1981_behaviors_av_dict"

#' International and domestic relations 1981 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 238 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/international_relations.htm
"internationaldomesticrelations1981_behaviors_f_dict"

#' International and domestic relations 1981 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 238 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/international_relations.htm
"internationaldomesticrelations1981_behaviors_m_dict"


#' Internet 1998 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 12 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm
"internet1998_behaviors_av_dict"

#' Internet 1998 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 12 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm
"internet1998_behaviors_f_dict"

#' Internet 1998 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 12 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm
"internet1998_behaviors_m_dict"

#' Internet 1998 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 9 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm
"internet1998_identities_av_dict"

#' Internet 1998 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 9 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm
"internet1998_identities_f_dict"

#' Internet 1998 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 9 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm
"internet1998_identities_m_dict"

#' Internet 1998 settings (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 9 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm
"internet1998_settings_av_dict"

#' Internet 1998 settings (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 9 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm
"internet1998_settings_f_dict"

#' Internet 1998 settings (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 9 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm
"internet1998_settings_m_dict"


#' Japan 1989-2002 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 455 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_behaviors_av_dict"

#' Japan 1989-2002 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 455 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_behaviors_f_dict"

#' Japan 1989-2002 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 455 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_behaviors_m_dict"

#' Japan 1989-2002 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 713 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_identities_av_dict"

#' Japan 1989-2002 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 713 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_identities_f_dict"

#' Japan 1989-2002 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 713 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_identities_m_dict"

#' Japan 1989-2002 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 427 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_mods_av_dict"

#' Japan 1989-2002 modifiers (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 427 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_mods_f_dict"

#' Japan 1989-2002 modifiers (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 427 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_mods_m_dict"

#' Japan 1989-2002 settings (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 300 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_settings_av_dict"

#' Japan 1989-2002 settings (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 300 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_settings_f_dict"

#' Japan 1989-2002 settings (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 300 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"japan19892002_settings_m_dict"


#' Morocco 2015 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 370 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///morocco-dictionary-2015/}
"morocco2015_behaviors_av_dict"

#' Morocco 2015 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 398 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///morocco-dictionary-2015/}
"morocco2015_identities_av_dict"

#' Morocco 2015 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 232 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///morocco-dictionary-2015/}
"morocco2015_mods_av_dict"


#' North Carolina 1978 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 600 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_behaviors_av_dict"

#' North Carolina 1978 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 600 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_behaviors_f_dict"

#' North Carolina 1978 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 600 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_behaviors_m_dict"

#' North Carolina 1978 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 721 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_identities_av_dict"

#' North Carolina 1978 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 721 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_identities_f_dict"

#' North Carolina 1978 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 721 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_identities_m_dict"

#' North Carolina 1978 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 441 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_mods_av_dict"

#' North Carolina 1978 modifiers (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 441 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_mods_f_dict"

#' North Carolina 1978 modifiers (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 441 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_mods_m_dict"

#' North Carolina 1978 settings (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 345 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_settings_av_dict"

#' North Carolina 1978 settings (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 345 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_settings_f_dict"

#' North Carolina 1978 settings (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 345 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nc1978_settings_m_dict"


#' North Ireland 1977 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 498 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nireland1977_behaviors_av_dict"

#' North Ireland 1977 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 498 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nireland1977_behaviors_f_dict"

#' North Ireland 1977 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 498 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nireland1977_behaviors_m_dict"

#' North Ireland 1977 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 528 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nireland1977_identities_av_dict"

#' North Ireland 1977 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 528 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nireland1977_identities_f_dict"

#' North Ireland 1977 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 528 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"nireland1977_identities_m_dict"

#' Ontario 1980 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 593 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario1980_behaviors_av_dict"

#' Ontario 1980 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 593 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario1980_behaviors_f_dict"

#' Ontario 1980 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 593 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario1980_behaviors_m_dict"

#' Ontario 1980 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 809 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario1980_identities_av_dict"

#' Ontario 1980 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 809 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario1980_identities_f_dict"

#' Ontario 1980 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 809 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario1980_identities_m_dict"

#' Ontario 1980 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 496 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario1980_mods_av_dict"

#' Ontario 1980 modifiers (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 496 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario1980_mods_f_dict"

#' Ontario 1980 modifiers (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 496 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario1980_mods_m_dict"


#' Ontario 2001 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 601 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_behaviors_av_dict"

#' Ontario 2001 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 601 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_behaviors_f_dict"

#' Ontario 2001 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 601 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_behaviors_m_dict"

#' Ontario 2001 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 993 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_identities_av_dict"

#' Ontario 2001 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 993 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_identities_f_dict"

#' Ontario 2001 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 993 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_identities_m_dict"

#' Ontario 2001 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 501 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_mods_av_dict"

#' Ontario 2001 modifiers (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 501 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_mods_f_dict"

#' Ontario 2001 modifiers (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 501 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_mods_m_dict"

#' Ontario 2001 settings (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 200 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_settings_av_dict"

#' Ontario 2001 settings (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 200 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_settings_f_dict"

#' Ontario 2001 settings (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 200 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"ontario2001_settings_m_dict"


#' Politics 2003 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 21 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/politics.htm}
"politics2003_behaviors_av_dict"

#' Politics 2003 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 21 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/politics.htm}
"politics2003_behaviors_f_dict"

#' Politics 2003 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 21 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/politics.htm}
"politics2003_behaviors_m_dict"

#' Politics 2003 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 51 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/politics.htm}
"politics2003_identities_av_dict"

#' Politics 2003 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 51 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/politics.htm}
"politics2003_identities_f_dict"

#' Politics 2003 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 51 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/politics.htm}
"politics2003_identities_m_dict"

#' Prisoner's dilemma behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 2 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_behaviors_av_dict"

#' Prisoner's dilemma behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 2 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_behaviors_f_dict"

#' Prisoner's dilemma behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 2 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_behaviors_m_dict"

#' Prisoner's dilemma identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 16 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_identities_av_dict"

#' Prisoner's dilemma identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 16 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_identities_f_dict"

#' Prisoner's dilemma identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 16 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_identities_m_dict"

#' Prisoner's dilemma emotions (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 6 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_emotions_av_dict"

#' Prisoner's dilemma emotions (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 6 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_emotions_f_dict"

#' Prisoner's dilemma emotions (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 6 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_emotions_m_dict"

#' Prisoner's dilemma modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 3 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_mods_av_dict"

#' Prisoner's dilemma modifiers (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 3 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_mods_f_dict"

#' Prisoner's dilemma modifiers (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 3 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemma_mods_m_dict"


#' Prisoner's dilemma behaviors with covariance information (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 2 rows and 13 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{cov1}{covariance matrix value}
#'   \item{cov2}{covariance matrix value}
#'   \item{cov3}{covariance matrix value}
#'   \item{cov4}{covariance matrix value}
#'   \item{cov5}{covariance matrix value}
#'   \item{cov6}{covariance matrix value}
#'   \item{cov7}{covariance matrix value}
#'   \item{cov8}{covariance matrix value}
#'   \item{cov9}{covariance matrix value}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"prisonersdilemmaCOV_behaviors_av_COV_dict"


#' Texas 1998 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 278 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"texas1998_behaviors_av_dict"

#' Texas 1998 behaviors (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 278 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"texas1998_behaviors_f_dict"

#' Texas 1998 behaviors (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 278 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"texas1998_behaviors_m_dict"

#' Texas 1998 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 443 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"texas1998_identities_av_dict"

#' Texas 1998 identities (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 443 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"texas1998_identities_f_dict"

#' Texas 1998 identities (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 443 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"texas1998_identities_m_dict"

#' Texas 1998 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 66 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"texas1998_mods_av_dict"

#' Texas 1998 modifiers (gender = female)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 66 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"texas1998_mods_f_dict"

#' Texas 1998 modifiers (gender = male)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 66 rows and 5 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{instcodes}{institutional codes for this term}
#'   ...
#' }
#' @source Interact (May 2021)
"texas1998_mods_m_dict"


#' University of Georgia 2015 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 814 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-georgia-dictionary-2015/}
"uga2015_behaviors_av_dict"

#' University of Georgia 2015 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 929 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-georgia-dictionary-2015/}
"uga2015_identities_av_dict"

#' University of Georgia 2015 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 660 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-georgia-dictionary-2015/}
"uga2015_mods_av_dict"


#' US full surveyor sample 2015 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 814 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-combined-surveyor-dictionary-2015/}
"usfullsurveyor2015_behaviors_av_dict"

#' US full surveyor sample 2015 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 929 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-combined-surveyor-dictionary-2015/}
"usfullsurveyor2015_identities_av_dict"

#' US full surveyor sample 2015 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 660 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-combined-surveyor-dictionary-2015/}
"usfullsurveyor2015_mods_av_dict"


#' University of Georgia 2015 behaviors with covariance information (gender = average). Note that a slightly different subset of respondents was used to calculate these summary statistics than was used in the mean-only dataset (uga2015 in this package).
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 815 rows and 13 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{cov1}{covariance matrix value}
#'   \item{cov2}{covariance matrix value}
#'   \item{cov3}{covariance matrix value}
#'   \item{cov4}{covariance matrix value}
#'   \item{cov5}{covariance matrix value}
#'   \item{cov6}{covariance matrix value}
#'   \item{cov7}{covariance matrix value}
#'   \item{cov8}{covariance matrix value}
#'   \item{cov9}{covariance matrix value}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"uga2015bayesactsubset_behaviors_av_COV_dict"

#' University of Georgia 2015 identities with covariance information (gender = average). Note that a slightly different subset of respondents was used to calculate these summary statistics than was used in the mean-only dataset (uga2015 in this package).
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 929 rows and 13 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{cov1}{covariance matrix value}
#'   \item{cov2}{covariance matrix value}
#'   \item{cov3}{covariance matrix value}
#'   \item{cov4}{covariance matrix value}
#'   \item{cov5}{covariance matrix value}
#'   \item{cov6}{covariance matrix value}
#'   \item{cov7}{covariance matrix value}
#'   \item{cov8}{covariance matrix value}
#'   \item{cov9}{covariance matrix value}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"uga2015bayesactsubset_identities_av_COV_dict"

#' University of Georgia 2015 modifiers with covariance information (gender = average). Note that a slightly different subset of respondents was used to calculate these summary statistics than was used in the mean-only dataset (uga2015 in this package).
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 658 rows and 13 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{cov1}{covariance matrix value}
#'   \item{cov2}{covariance matrix value}
#'   \item{cov3}{covariance matrix value}
#'   \item{cov4}{covariance matrix value}
#'   \item{cov5}{covariance matrix value}
#'   \item{cov6}{covariance matrix value}
#'   \item{cov7}{covariance matrix value}
#'   \item{cov8}{covariance matrix value}
#'   \item{cov9}{covariance matrix value}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"uga2015bayesactsubset_mods_av_COV_dict"
#' University of Georgia 2015 behaviors with standard deviation information (gender = average). Note that a slightly different subset of respondents was used to calculate these summary statistics than was used in the mean-only dataset (uga2015 in this package).
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 815 rows and 7 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{sd1}{standard deviation value}
#'   \item{sd2}{standard deviation value}
#'   \item{sd3}{standard deviation value}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"uga2015bayesactsubset_behaviors_av_SD_dict"

#' University of Georgia 2015 identities with standard deviation information (gender = average). Note that a slightly different subset of respondents was used to calculate these summary statistics than was used in the mean-only dataset (uga2015 in this package).
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 929 rows and 7 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{sd1}{standard deviation value}
#'   \item{sd2}{standard deviation value}
#'   \item{sd3}{standard deviation value}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"uga2015bayesactsubset_identities_av_SD_dict"

#' University of Georgia 2015 modifiers with standard deviation information (gender = average). Note that a slightly different subset of respondents was used to calculate these summary statistics than was used in the mean-only dataset (uga2015 in this package).
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 658 rows and 7 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   \item{sd1}{standard deviation value}
#'   \item{sd2}{standard deviation value}
#'   \item{sd3}{standard deviation value}
#'   ...
#' }
#' @source \url{http://bayesact.ca/}
"uga2015bayesactsubset_mods_av_SD_dict"

#' US Amazon Turk 2015 behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 853 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-online-dictionary-2015/}
"usmturk2015_behaviors_av_dict"

#' US Amazon Turk 2015 identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 968 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-online-dictionary-2015/}
"usmturk2015_identities_av_dict"

#' US Amazon Turk 2015 modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 660 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-online-dictionary-2015/}
"usmturk2015_mods_av_dict"

#' US 2015 student sample (UGA and Duke) behaviors (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 814 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"usstudent2015_behaviors_av_dict"

#' US 2015 student sample (UGA and Duke) identities (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 929 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"usstudent2015_identities_av_dict"

#' US 2015 student sample (UGA and Duke) modifiers (gender = average)
#'
#' For more description and citation information, call dict_info()
#'
#' @format A data frame with 660 rows and 4 variables:
#' \describe{
#'   \item{term}{dictionary term}
#'   \item{E}{evaluation mean value}
#'   \item{P}{potency mean value}
#'   \item{A}{activity mean value}
#'   ...
#' }
#' @source \url{http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/}
"usstudent2015_mods_av_dict"





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

