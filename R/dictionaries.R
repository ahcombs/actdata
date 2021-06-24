#' Get dictionary information
#'
#' Return metadata of available dictionaries as a list of dictionary objects
#'
#' @return list of dictionary objects
#'
#' @export
get_dicts <- function(){
  ## CONSTANTS
  # available dictionaries
  methods::setClass("dictionary",
                     methods::representation(
                       key = "character",
                       components = "vector",
                       types = "vector",
                       genders = "vector",
                       filetype = "character",
                       source = "character",
                       description = "character",
                       citation = "character"),
                     methods::prototype(key = NA_character_,
                               components = c("identities", "behaviors", "mods"),
                               types = c("mean"),
                               genders = c("male", "female", "av"),
                               filetype = ".dat",
                               source = "Interact (May 2021)",
                               description = "unknown",
                               citation = "unknown"))

  dicts = c(
    methods::new("dictionary",
        key = "china1999",
        components = c("identities", "behaviors", "mods", "settings"),
        description = "From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Ratings of 449 Identities, 300 Behaviors, 98 Emotions, 150 Traits, and 149 Settings were obtained with Attitude from about 380 undergraduate students at Fudan University in Shanghai, Peoples Republic of China, 1999-2000.",
        citation = "Smith, Herman, W. and Yi Cai. Mean Affective Ratings of 1,146 Concepts by Shanghai Undergraduates, 1999 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2006."
    ),
    methods::new("dictionary",
        key = "egypt2015",
        filetype = ".csv",
        source = "http://affectcontroltheory.org///egypt-dictionary-2015/",
        citation = 'Hamid Latif, Lynn Smith-Lovin, Dawn T. Robinson, Bryan C. Cannon, Brent Curdy, Darys J Kriegel and Jonathan H. Morgan. 2016. "Mean Affective Ratings of Identities, Behaviors, and Modifiers by Residents of Cairo, Egypt in 2012-2014." University of Georgia: Distributed at UGA Affect Control Theory Website: http://research.franklin.uga.edu/act/.',
        description = "Data collected in Egypt between 2012 and 2014. n = 1716, identities = 397, behaviors = 368, modifiers = 233"),
    methods::new("dictionary",
        key = "expressive2002",
        components = c("behaviors"),
        genders = c("av"),
        source = "https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/expressive_acts.htm",
        citation = "Appendix of Lisa Slattery Rashotte, 2002, What does that smile mean? The meaning of nonverbal behaviors in social interaction. Social Psychology Quarterly 65: 92-102.",
        description = 'Appendix of Lisa Slattery Rashotte, 2002, What does that smile mean? The meaning of nonverbal behaviors in social interaction. Social Psychology Quarterly 65: 92-102. EPA values are means across 230 females and 172 males; these cross-sex EPA profiles are given in both the "male" and the "female" positions.'),
    methods::new("dictionary",
        key = "gaysex1980",
        components = c("behaviors"),
        source = "https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/gay_sex.htm",
        description = "Data were gathered from ten San Francisco gay men in the 1980s by Professor Don Barrett, California State University, San Marcos. All data are from males. The 'male' dictionary present the mean EPA ratings of those with traditional sentiments about unsafe sex practices, feeling that those practices are more pleasurable than new practices. The 'female' dictionary shows the sentiments of those who think that safe-sex practices are more pleasurable."),
    methods::new("dictionary",
        key = "germany1989",
        description = "From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Ratings of 442 Identities, 295 Behaviors, and 67 Modifiers, selected for back-translatability with the 1978 U.S.A. dictionary were obtained with the Attitude program from 520 Mannheim students. Subjects were matched to the American undergraduate population by proportional inclusion of 12 and 13 grade youths at two German Studenten des Grundstudiums and Gymnasiasten, along with subjects from Mannheim University, which attracts students mainly from the Rhein-Neckar region in former West Germany.",
        citation = "Schneider, Andreas. Mean Affective Ratings of 804 Concepts by West German Students  in 1989 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2006."),
    methods::new("dictionary",
        key = "germany2007",
        components = c("identities", "behaviors", "mods", "settings"),
        description = "From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Ratings of 376 Identities, 393 Behaviors, 331 Modifiers. (Some of the words are classified as 19 settings in Interact.) Ratings were obtained with Surveyor from 1905 subjects (734 male and 1171 female) from all over Germany. The research was advertised as a 'study of language and emotion' in an extensive recruitment campaign including mailing lists from different universities, weblogs, newspaper reports and radio interviews. Most of the participants (N = 1029) were between 20 and 29 years of age, but the sample covered all ages, including N = 129 being younger than 20 and N = 92 older than 60 years. The data of 83 persons (4.4 %) were excluded from the analysis, as they had indicated German not being their mother tongue.",
        citation = "Schroder, Tobias. Mean Affective Ratings of 1100 Concepts by German Adults in 2007 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2013."),
    methods::new("dictionary",
        key = "household1994",
        components = c("identities", "behaviors"),
        source = "https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/household.htm",
        description = "This set of concepts - developed by Professor Amy Kroska at the University of Oklahoma, and others, for studying gender and household roles - was rated by 23 male and 46 female college students in 1994."),
    methods::new("dictionary",
        key = "indiana2003",
        components = c("identities", "behaviors", "mods", "settings"),
        description = "From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Ratings of 500 Identities, 500 Behaviors, 300 Modifiers, and 200 Settings were collected at Indiana University, via the Internet using the Surveyor applet.  The 1027 respondents lived in the U.S.A. at age 16, and were about equally male and female.",
        citation = "Francis, Clare, and David R. Heise. Mean Affective Ratings of 1,500 Concepts by Indiana University Undergraduates in 2002-3 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2006."),
    methods::new("dictionary",
        key = "internationaldomesticrelations1981",
        components = c("behaviors"),
        source = "https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/international_relations.htm",
        citation = "Azar Edward E. and Steve Lerner 1981. The use of semantic dimensions in the scaling of international events. International Interactions 7: 361-378.",
        description = "125 inter-state behaviors. The behaviors were rated by professionals in international relations, and by individuals from the general population."),
    methods::new("dictionary",
        key = "internet1998",
        components = c("identities", "behaviors", "settings"),
        source = "https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm",
        citation = 'King, Adam B. 2001. "Affective dimensions of internet culture." Social Science Computer Review 19:414-430.',
        description = "This set of concepts related to Internet culture was developed by Adam King, and rated by 2,431 respondents (56%  male and 44% female) in 1998."),
    methods::new("dictionary",
        key = "japan19892002",
        components = c("identities", "behaviors", "mods", "settings"),
        description = "From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Ratings of 403 Identities and 307 Behaviors, and a few Settings were obtained with the Attitude program from 323 Tohoku University students in 1989. In 1995 and 1996, 120 women students at Kyoritsu Women's, Japan Women's, and Teikyo Universities and 120 men students at Teikyo and Rikkyo Universities rated an additional 300 settings, 300 modifiers (mainly traits), 200 business identities, and 75 behaviors. Yoichi Murase (Rikkyo University) and Nozomu Matsubara (Tokyo University) provided access to students who rated 102 emotions, 70 behaviors and 55 identities in 2002 using Surveyor. Total numbers of entries in Interact lexicon are: 713 Identities, 455 Behaviors, 426 Modifiers, and 300 Settings. Number of male or female raters generally is about 30 for each concept.",
        citation = "Smith, Herman W., Takanori Matsuno, Shuuichirou Ike, and Michio Umino. Mean Affective Ratings of 1,894 Concepts by Japanese Undergraduates, 1989-2002 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2006."),
    methods::new("dictionary",
        key = "morocco2015",
        filetype = ".csv",
        source = "http://affectcontroltheory.org///morocco-dictionary-2015/",
        description = "Data collected in Morocco. n = 1546, identities = 397, behaviors = 368, modifiers = 233"),
    methods::new("dictionary",
        key = "nc1978",
        components = c("identities", "behaviors", "mods", "settings"),
        description = "From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Ratings of 721 Identities, 600 Behaviors, 440 Modifiers, and 345 Settings were obtained with paper questionnaires from 1,225 North Carolina undergraduates. (Ratings for some emotion words in this data set were obtained by Heise from Indiana University undergraduates in 1985.) Number of male or female raters generally is about 25 for each word. Funded by National Institute of Mental Health Grant 1-R01-MH29978-01-SSR.",
        citation = "Smith-Lovin, Lynn, and David R. Heise. Mean Affective Ratings of 2,106 Concepts by University of North Carolina Undergraduates in 1978 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2006."),
    methods::new("dictionary",
        key = "nireland1977",
        components = c("behaviors", "identities"),
        description = "From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Ratings of 528 Identities and 498 Behaviors were obtained with paper questionnaires from 319 Belfast teenagers in Catholic high schools in 1977. Ratings of modifiers and settings were not obtained in the Belfast study. Up to 18 females and  14 males rated each concept.",
        citation = "Willigan, Dennis, and David R. Heise. Mean Affective Ratings of 1,026 Concepts by Catholic High School Students in Belfast, Northern Ireland in 1977 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2006."),
    methods::new("dictionary",
        key = "ontario1980",
        description = "From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Data on 843 Identities and  593 Behaviors were obtained from 5,534 Guelph, Ontario, undergraduates with paper questionnaires in 1980-3, and 495 Modifiers rated by 1,260 Guelph undergraduates were added in 1985-6. Funded by the Social Science and Humanities Research Council of Canada.",
        citation = "MacKinnon, Neil J. Mean Affective Ratings of 1,931 Concepts by Guelph University Undergraduates, Ontario, Canada, in 1980-6 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2006."),
    methods::new("dictionary",
        key = "ontario2001",
        components = c("identities", "behaviors", "mods", "settings"),
        description = "From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Data on 993 Identities, 601 Behaviors, and 500 Modifiers, and 200 Settings were gathered with the Attitude program from Guelph, Ontario, undergraduates in 2001-2. Data on settings were gathered with the Surveyor program at Guelph in 2003. Funded by the Social Science and Humanities Research Council of Canada. ",
        citation = "MacKinnon, Neil J. Mean Affective Ratings of 2,294 Concepts by Guelph University Undergraduates, Ontario, Canada, in 2001-3 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2006."),
    methods::new("dictionary",
        key = "politics2003",
        components = c("behaviors", "identities"),
        source = "https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/politics.htm",
        description = "This set of concepts - developed by Kyle Irwin at the University of Missouri-St. Louis - was rated by 47 male and 74 female college students in 2003."),
    methods::new("dictionary",
        key = "prisonersdilemma",
        components = c("behaviors", "identities", "mods", "emotions"),
        source = "http://bayesact.ca/",
        description = "For use with a prisoner's dilemma example. Included with the BayesACT code."),
    methods::new("dictionary",
        key = "prisonersdilemmaCOV",
        components = c("behaviors"),
        filetype = ".csv",
        source = "http://bayesact.ca/",
        description = "For use with a prisoner's dilemma example. Contains covariance information. Included with the BayesACT code."),
    methods::new("dictionary",
        key = "texas1998",
        description = "From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Ratings of 443 Identities, 278 Behaviors, 65 Modifiers, and 1 Setting were collected at Texas Tech University with the Attitude program. The 482 respondents were nearly equally male and female.",
        citation = "Schneider, Andreas. Mean Affective Ratings of 787 Concepts by Texas Tech University Undergraduates in 1998 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2006."),
    methods::new("dictionary",
        key = "uga2015",
        genders = c("av"),
        filetype = ".csv",
        source = "http://affectcontroltheory.org///usa-georgia-dictionary-2015/",
        citation = "Robinson, Dawn T., Lynn Smith-Lovin, Bryan C. Cannon, Jesse K. Clark, Robert Freeland, Jonathan H. Morgan and Kimberly B. Rogers. 2016. 'Mean Affective Ratings of 932 Identities, 810 Behaviors, and 660 Modifiers by University of Georgia Undergraduates in 2012-2014.'. University of Georgia: Distributed at UGA Affect Control Theory Website: http://research.franklin.uga.edu/act/.",
        description = "Sentiment dictionary data collected at the University of Georgia. n = 1368, identities = 930, behaviors = 814, modifiers = 660"),
    methods::new("dictionary",
        key = "usfullsurveyor2015",
        genders = c("av"),
        filetype = ".csv",
        source = "http://affectcontroltheory.org///usa-combined-surveyor-dictionary-2015/",
        citation = 'Smith-Lovin, Lynn, Dawn T. Robinson, Bryan C. Cannon, Jesse K. Clark, Robert Freeland, Jonathan H. Morgan and Kimberly B. Rogers. 2016. "Mean Affective Ratings of 929 Identities, 814 Behaviors, and 660 Modifiers by University of Georgia and Duke University Undergraduates and by Community Members in Durham, NC, in 2012-2014."" University of Georgia: Distributed at UGA Affect Control Theory Website: http://research.franklin.uga.edu/act/.',
        description = "Combined sentiment dictionary data collected at the University of Georgia, Duke University, and in the Durham, NC community using Surveyor. n = 1742, identities = 929, behaviors = 814, modifiers = 660"),
    methods::new("dictionary",
        key = "uga2015bayesactsubset",
        types = c("cov", "sd"),
        genders = c("av"),
        filetype = ".csv",
        source = "http://bayesact.ca/",
        description = "Mean, standard deviation, and covariance data calculated using a subset of the University of Georgia 2015 dataset (uga2015 in this package). Included as part of the BayesACT package."),
    methods::new("dictionary",
        key = "usmturk2015",
        genders = c("av"),
        filetype = ".csv",
        source = "http://affectcontroltheory.org///usa-online-dictionary-2015/",
        citation = "Smith-Lovin, Lynn, Dawn T. Robinson, Bryan C. Cannon, Brent H. Curdy, and Jonathan H. Morgan. 2019. 'Mean Affective Ratings of 968 Identities, 853 Behaviors, and 660 Modifiers by Amazon Mechanical Turk Workers in 2015.' University of Georgia: Distributed at UGA Affect Control Theory Website: http://research.franklin.uga.edu/act/",
        description = "Collected from Amazon Mechanical Turk workers in 2015. Identities = 968, behaviors = 853, modifiers = 660."),
    methods::new("dictionary",
        key = "usstudent2015",
        genders = c("av"),
        filetype = ".csv",
        source = "http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/",
        citation = "Smith-Lovin, Lynn, Dawn T. Robinson, Bryan C. Cannon, Jesse K. Clark, Robert Freeland, Jonathan H. Morgan and Kimberly B. Rogers. 2016. 'Mean Affective Ratings of 929 Identities, 814 Behaviors, and 660 Modifiers by University of Georgia and Duke University Undergraduates in 2012-2014.' University of Georgia: Distributed at UGA Affect Control Theory Website: http://research.franklin.uga.edu/act/.",
        description = "Combined sentiment dictionary data collected at the University of Georgia and Duke University using Surveyor. n = 1584, identities = 929, behaviors = 814, modifiers = 660")
  )

  return(dicts)
}



#' Print dictionary info
#'
#' Print metadata for the dictionary name specified or for all available dictionaries (if name is unspecified)
#'
#' @param name string
#'
#' @export
dict_info <- function(name = NA){
  dicts <- get_dicts()

  if(!is.na(name)){
    thisdict <- this_dict(name)

    if(length(thisdict) == 0){
      dictnames <- dict_subset(dicts)
      stop(paste("Invalid dictionary name. Available dictionaries are (use dict_info() for details):", paste(unlist(dictnames), collapse = ', ')))
    }

    cat(
      paste(
        paste("Dictionary:", name),
        paste("Description:", thisdict@description),
        paste("Components:", paste(unlist(thisdict@components), collapse = ', ')),
        paste("Genders:", paste(unlist(thisdict@genders), collapse = ', ')),
        paste("Types:", paste(unlist(thisdict@types), collapse = ', ')),
        paste("Source:", thisdict@source),
        paste("Citation:", thisdict@citation),
        sep = "\n"
      )
    )
  } else {
    cat("Available dictionaries: \n\n")
    for(d in dicts){
      cat(
        paste(
          paste("Dictionary:", d@key),
          paste("Description:", d@description),
          paste("Components:", paste(unlist(d@components), collapse = ', ')),
          paste("Genders:", paste(unlist(d@genders), collapse = ', ')),
          paste("Types:", paste(unlist(d@types), collapse = ', ')),
          paste("Source:", d@source),
          paste("Citation:", d@citation),
          sep = "\n"
        )
      )
      cat("\n\n")
    }
  }
}
