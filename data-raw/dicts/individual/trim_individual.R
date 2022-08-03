meta <- utils::read.csv("data-raw/dicts/dict_info.csv")
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
    dplyr::mutate(gender = case_when(.data$gender == "1" ~ "Male",
                                     .data$gender == "2" ~ "Female",
                                     .data$gender == "I do not want to say" ~ "Prefer not to say",
                                     TRUE ~ .data$gender)) %>%
    {
      if("hisp" %in% names(.)) {dplyr::mutate(., hisp = case_when(.data$hisp == "1" ~ "Yes",
                                                                 .data$hisp == "2" ~ "No",
                                                                 TRUE ~ .data$hisp))}
      else .
    } %>%
    {
      if("race1" %in% names(.)) {dplyr::mutate(., race1 = case_when(.data$race1 == "1" ~ "White or Caucasian",
                                                                    .data$race1 %in% c("Black or African-American", "2") ~ "Black or African American",
                                                                    .data$race1 == "3" ~ "American Indian or Native American",
                                                                    .data$race1 == "4" ~ "Asian or Asian American",
                                                                    .data$race1 == "5" ~ "Other",
                                                                    TRUE ~ .data$race1))}
      else .
    } %>%
    {
      if("race2" %in% names(.)) {dplyr::mutate(., race2 = case_when(.data$race2 == "1" ~ "White or Caucasian",
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
