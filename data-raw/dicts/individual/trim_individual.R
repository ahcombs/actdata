meta <- utils::read.csv("data-raw/dicts/dict_info.csv")

##### INDIVIDUAL DATA FOR 2015 DUKE/UGA COLLECTIONS #############

source_folder <- "data-raw/dicts/individual_raw"
ind_file_list <- grep("csv$", list.files(source_folder), value = TRUE)

# read in files
for(file in ind_file_list){
  path <- paste0(source_folder, "/", file)
  key <- stringr::str_extract(file, "^[[:alnum:]]*(?=_)")
  # context <- stringr::str_extract(key, "^[[:alpha:]]*(?=[[:digit:]])")
  context <- meta[meta$key == key, "context"]
  # I'm leaving year as a regex instead of taking it from meta because this ensures it is numeric and therefore sortable
  year <- stringr::str_extract(key, "[[:digit:]]*$")
  # year <- meta[meta$key == key, "year"]



  termrename <- c(term = "termID",  term = "variable",  term = "term_ID",
                  userid = "ResponseId",
                  E = "evaluation", P = "potency", A = "activity",
                  race = "quota_race", gender = "filter_gender", age = "quota_age", hisp = "hispanic")
  data <- read.csv2(path, sep = ",") %>%
    dplyr::rename(any_of(termrename))

  # # there are 19 nonbinary/other folks in the 2019 occs data and they have a filter_gender but not a quota_gender (NA)
  # # there is no multiracial category in occs; multiracial people are put with one category or another (non-white preferentially; Hispanic preferentially)
  # # in the duke community sample people appear not to have been given a Hispanic ethnicity option
  # # the MTurk collection has numeric entries for race--need to find codebook
  # MTurk includes a "hispanic" variable
  # d2 <- data %>%
  #   select(userid, race1, race2) %>%
  #   distinct()
  #
  # %>%
  #   mutate(same = filter_gender == quota_gender) %>%
  #   filter(is.na(same)) %>%
  #   distinct()

  data <- standardize_terms(data, key) %>%
    dplyr::rename_with(tolower, !dplyr::matches("^[EPA]$")) %>%
    dplyr::select(dplyr::any_of(c("userid", "gender", "age", "race", "race1", "race2", "hisp", "term", "component", "E", "P", "A"))) %>%
    dplyr::mutate(dplyr::across(c("E", "P", "A"), ~ifelse(. == "", NA_real_, .))) %>%
    dplyr::mutate(dplyr::across(!c("E", "P", "A"), ~as.character(.))) %>%
    dplyr::mutate(gender = dplyr::case_when(.data$gender == "1" ~ "Male",
                                     .data$gender == "2" ~ "Female",
                                     .data$gender == "I do not want to say" ~ "Prefer not to say",
                                     TRUE ~ .data$gender)) %>%
    {
      if("hisp" %in% names(.)) {dplyr::mutate(., hisp = dplyr::case_when(.data$hisp == "1" ~ "Yes",
                                                                 .data$hisp == "2" ~ "No",
                                                                 TRUE ~ .data$hisp))}
      else .
    } %>%
    {
      if("race1" %in% names(.)) {dplyr::mutate(., race1 = dplyr::case_when(.data$race1 == "1" ~ "White or Caucasian",
                                                                    .data$race1 %in% c("Black or African-American", "2") ~ "Black or African American",
                                                                    .data$race1 == "3" ~ "American Indian or Native American",
                                                                    .data$race1 == "4" ~ "Asian or Asian American",
                                                                    .data$race1 == "5" ~ "Other",
                                                                    TRUE ~ .data$race1))}
      else .
    } %>%
    {
      if("race2" %in% names(.)) {dplyr::mutate(., race2 = dplyr::case_when(.data$race2 == "1" ~ "White or Caucasian",
                                                                    .data$race2 %in% c("Black or African-American", "2") ~ "Black or African American",
                                                                    .data$race2 == "3" ~ "American Indian or Native American",
                                                                    .data$race2 == "4" ~ "Asian or Asian American",
                                                                    .data$race2 == "5" ~ "Other",
                                                                    .data$race2 == "6" ~ "No additional race information to report",
                                                                    .data$race2 == "prefer not to say" ~ "Prefer not to say",
                                                                    TRUE ~ .data$race2))}
      else .
    } %>%
    dplyr::mutate(dplyr::across(everything(), ~ifelse(. == "", NA_character_, .)))

  # then re-save
  name <- paste0(key, "_individual")
  x <- list(data)
  names(x) <- paste(name, sep = "")
  saveRDS(data, file=paste0("data-raw/dicts/individual/", name, ".RDS"))
  # save(list=names(x), file=paste0("data-raw/dicts/individual/", name, ".rda"), envir=list2env(x), compress = "gzip")
}



##### INDIVIDUAL DATA FOR SHANK/LULHAM ####################################



source_folder <- "data-raw/dicts/individual_raw/lulhamshank/indiv"
ind_file_list <- grep("csv$", list.files(source_folder), value = TRUE)

uniquekeys <- unique(stringr::str_extract(ind_file_list, "^[[:alnum:]]*(?=_)"))

# some of these files have to be merged--so go key by key instead of file by file
for(key in uniquekeys){
  keyfiles <- grep(key, ind_file_list, value = TRUE)
  context <- meta[meta$key == key, "context"]
  year <- stringr::str_extract(key, "[[:digit:]]*$")
  termrename <- c(
    # userid = "X", userid = "V1",
    # startdate = "X.2",
    liveus = "Q113", liveus = "X.8",
    gender = "Q25", gender = "X.7", age = "Q29", age = "X.10", raceeth = "Q30", raceeth = "X.11"
    )
  data <- tidyr::tibble(userid = character(), gender = character(), age = character(),
                 raceeth = character(), term = character(),
                 E = numeric(), P = numeric(), A = numeric())

  for(file in keyfiles){
    path <- paste0(source_folder, "/", file)

    d <- read.csv2(path, sep = ",")
    names(d) <- c("userid", names(d)[-1])
    d <- d %>%
      dplyr::rename(any_of(termrename))

    if(grepl("artifactmods", key)){
      data <- d %>%
        dplyr::filter(userid != "") %>%
        dplyr::select(-matches("^X\\.")) %>%
        # columns ending in .1 are potency, columns ending in .2 are activity, columns with no suffix that are not in the set to keep are evaluation
        # columns ending in .3--i'm not sure what they are but I think I can drop them. "5LH" is the variable name.
        # columns ending in .4--note whether someone skipped a stimulus and are useful for distinguishing between terms people skipped and terms they were not offered.
        dplyr::filter(userid != "ID") %>%
        tidyr::pivot_longer(cols = -c("userid", unique(names(termrename))), names_to = "term", values_to = "rating") %>%
        dplyr::mutate(dimension = dplyr::case_when(grepl("\\.1$", term) ~ "P",
                                                   grepl("\\.2$", term) ~ "A",
                                                   grepl("\\.3$", term) ~ "unknown",
                                                   grepl("\\.4$", term) ~ "skip",
                                                   TRUE ~ "E")) %>%
        dplyr::filter(dimension != "unknown") %>%
        dplyr::filter(!(dimension == "skip" & rating == "")) %>%
        dplyr::filter(rating != "SM") %>%
        dplyr::mutate(term = gsub("\\.\\d$", "", term)) %>%
        tidyr::pivot_wider(names_from = dimension, values_from = "rating") %>%
        dplyr::filter(skip == 1 | (!(E=="") | !(P=="") | !(A==""))) %>%
        dplyr::filter(is.na(skip)) %>%
        dplyr::select(-skip) %>%
        # people who did not live in the us the majority of their lives have already been removed
        dplyr::select(-liveus) %>%
        dplyr::mutate(E = as.numeric(E),
                      P = as.numeric(P),
                      A = as.numeric(A),
                      gender = ifelse(gender == "1", "Male", "Female"))
      # # recode race variable, which looks to be a fill in box thing
      # # eh--decided against this because of all the decisions about how to code weird entries. Not standard enough for me to want to make my
      # # work here part of a public dataset.
      # mutate(raceeth_recode = case_when(trimws(tolower(raceeth)) %in% c("african american", "african american/black",
      #                                                  "african-american", "black", "black american") ~ "Black",
      #                                   trimws(tolower(raceeth)) %in% c("asian", "asian american", "asian-american",
      #                                                                   "asian/chinese", "asian/filipino", "asian/japanese",
      #                                                                   "asian/vietnamese", "chinese", "east asian", "filipino",
      #                                                                   "japanese", "korean", "vietnamese", "pacific islander") ~ "Asian",
      #                                   trimws(tolower(raceeth)) %in% c("caucasian", "caucasian/white", "caucasion", "caucassion", "caucation",
      #                                                                   "causasian", "causian", "euro-american", "european", "european american",
      #                                                                   "european-american", "whiet", "white", "white / caucasian", "white american",
      #                                                                   "white caucasian", "white european american", "white non hispanic",
      #                                                                   "white non-hisp", "white, non-hisp", "white, non-hispanic", "white/caucasian",
      #                                                                   "white/european american", "white/european descent", "wite", "irish")))

      # raterchar <- data %>%
      #   select(-term, -E, -P, -A) %>%
      #   distinct() %>%
      #   mutate(startdate = as.Date.character(startdate, format = "%m/%d/%y"))
      #
      # table(raterchar$startdate)
      #
      # table(trimws(tolower(raterchar$raceeth)))


      # # why do I have more individuals here than the sample size in the word doc?
      # # word doc says starting sample size of n = 798, after all cleaning 673
      # # I have 825?
      # # there are 825 in the excel sheet too
      # # something with date? some are on october 20 (most), some are on oct 29
      # # there are 95 people who completed on october 29. removing them would bring the sample size to 730--so this isn't it either
      # print(length(unique(data$userid)))
      # FOR HUMAN VALUES I get 673--so maybe I just misunderstood what the word doc was referring to.

      # # check gender coding and values
      # # this spot check looks good! exact match to the summary stats in the excel file
      # winner <- data %>%
      #   filter(term == "winner") %>%
      #   group_by(gender) %>%
      #   summarize(n = n(),
      #             E_mean = mean(E),
      #             P_mean = mean(P),
      #             A_mean = mean(A))

      # TODO: more systematic comparison of all my values to EPA values reported in the second tab of the excel sheet
    } else {
      # can I treat the other two keys together? maybe.
      # both are multi-part
      # Q84 are the skip variables
      # there is a political ideology variable! Q105

      thisdata <- d %>%
        dplyr::filter(userid != "") %>%
        dplyr::select(-matches("^X"), -matches("^Q"), -matches("^V"),
                      -ends_with("Corr"), -ends_with("COUNT"), -starts_with("Location"), -starts_with("Ratio"),
                      -SD, -Polarity, -id, -mTurkCode, -cond, -orderE, -orderP, -orderA, -SUM.of.SQARES) %>%
        dplyr::filter(userid != "ResponseID") %>%
        # columns ending in .1 are potency, columns ending in .2 are activity, columns with no suffix that are not in the set to keep are evaluation
        tidyr::pivot_longer(cols = -c("userid", unique(names(termrename))), names_to = "term", values_to = "rating") %>%
        dplyr::mutate(dimension = dplyr::case_when(grepl("\\.1$", term) ~ "P",
                                            grepl("\\.2$", term) ~ "A",
                                            TRUE ~ "E")) %>%
        dplyr::filter(rating != "m") %>%
        dplyr::mutate(term = gsub("\\.\\d$", "", term)) %>%
        tidyr::pivot_wider(names_from = dimension, values_from = "rating") %>%
        # people who did not live in the us the majority of their lives have already been removed
        dplyr::select(-liveus) %>%
        dplyr::mutate(E = as.numeric(E),
                      P = as.numeric(P),
                      A = as.numeric(A),
                      gender = ifelse(gender == "1", "Male", "Female"))

      data <- data %>%
        dplyr::full_join(thisdata)
    }
  }
  # standardize terms
  data <- standardize_terms(data, key)

  # save a data set for each key
  name <- paste0(key, "_individual")
  x <- list(data)
  names(x) <- paste(name, sep = "")
  saveRDS(data, file=paste0("data-raw/dicts/individual/", name, ".RDS"))
}

