#' Identity terms
#'
#' Identity terms contained in all publicly available dictionaries with indicators for which dictionary contains them.
#' Note that terms have been standardized between dictionaries to facilitate comparison, so terms here may differ from those in the original source data files in substantively unimportant ways (capitalization, spacing, spelling, etc).
#' There is one column per dictionary that includes this type of term. Whether or not a specific dictionary includes a particular term is indicated by 0/1 indicators.
#'
#' @format A data frame with 2198 rows and 22 variables:
#' \describe{
#'   \item{term}{dictionary term}
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
#'   \item{term}{dictionary term}
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
#'   \item{term}{dictionary term}
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
#'   \item{term}{dictionary term}
#'   ...
#' }
"term_table_beh"






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
"egypt2015_identities_av_dict"

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
"egypt2015_identities_av_dict"


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
"gaysex1980_behaviors_f_dict"


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



