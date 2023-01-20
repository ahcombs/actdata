source_folder <- "data-raw/dicts/means_only/"
means_file_list <- list.files(source_folder)

# set up base dataframe
cnames <- c(
  "term",
  "dataset",
  "context",
  "year",
  "component",
  "instcodes",
  "group",
  "E",
  "P",
  "A",
  "n_E",
  "n_P",
  "n_A",
  "sd_E",
  "sd_P",
  "sd_A",
  "cov_EE",
  "cov_EP",
  "cov_EA",
  "cov_PE",
  "cov_PP",
  "cov_PA",
  "cov_AE",
  "cov_AP",
  "cov_AA"
)

meannames <- c(
  "term",
  "dataset",
  "context",
  "year",
  "component",
  "instcodes",
  "group",
  "E",
  "P",
  "A"
)

individual_keys <- c(
  "dukecommunity2015",
  "dukestudent2015",
  "uga2015",
  "usstudent2015",
  "usmturk2015",
  "egypt2015",
  "morocco2015",
  "usfullsurveyor2015",
  "occs2019",
  "occs2020",
  "artifactmods2022",
  "humanvalues2022",
  "products2022"
)

# meta <- utils::read.csv("data-raw/dicts/dict_info.csv")

exclude_keys <- c("prisonersdilemma") #, "occs2019", "occs2020")

mean_epa <- data.frame(matrix(nrow = 0, ncol = length(meannames)))
names(mean_epa) <- meannames

for(file in means_file_list){
  path <- paste0(source_folder, "/", file)
  component <- stringr::str_extract(file, "(?<=_)[[:alpha:]]*(?=.)")

  key <- stringr::str_extract(file, "^[[:alnum:]]*(?=_)")
  # we don't need to include the public means-only data for the sets we have individual level data for.
  if(!(key %in% individual_keys) & !(key %in% exclude_keys)){
    # context <- stringr::str_extract(key, "^[[:alpha:]]*(?=[[:digit:]])")
    year <- stringr::str_extract(key, "[[:digit:]]*$")
    context <- dict_meta[dict_meta$key == key, "context"]
    # I'm leaving year as a regex instead of taking it from meta because this ensures it is numeric and therefore sortable
    # year <- meta[meta$key == key, "year"]
    filetype <- stringr::str_extract(file, "\\.[[:alpha:]]*$")
    datatype <- dplyr::case_when(
      grepl("COV", file) ~ "COV",
      grepl("SD", file) ~ "SD",
      TRUE ~ "mean"
    )

    con <- file(path, "r")
    firstline <- readLines(con = con, n = 1)
    close(con)
    if(grepl(',', firstline)){
      # the file is comma-separated
      sep <- ","
    } else {
      # file is space separated
      sep <- " "
    }

    if(grepl('term', firstline)){
      head <- TRUE
    } else {
      head <- FALSE
    }

    data <- read.table(path, header = head, sep = sep, quote = "", fill=FALSE)
    nc <- ncol(data)
    namesplaceholder <- list()
    for(i in 1:nc){
      namesplaceholder <- append(namesplaceholder, paste0("V", i))
    }
    names(data) <- namesplaceholder

    if(datatype == "mean"){

      male <- data %>%
        dplyr::select(-c(V5:V7))
      female <- data %>%
        dplyr::select(-c(V2:V4))
      average <- data %>%
        dplyr::rowwise() %>%
        dplyr::mutate(avE = mean(c(V2, V5)),
                      avP = mean(c(V3, V6)),
                      avA = mean(c(V4, V7))) %>%
        dplyr::select(-c(V2:V7))

      if(ncol(female) == 5){
        colnames(male) <- c("term", "E", "P", "A", "instcodes")
        colnames(female) <- c("term", "E", "P", "A", "instcodes")
        colnames(average) <- c("term", "instcodes", "E", "P", "A")
        average <- dplyr::select(average, term, E, P, A, instcodes)
      } else {
        male$instcodes <- NA
        female$instcodes <- NA
        average$instcodes <- NA
        colnames(male) <- c("term", "E", "P", "A", "instcodes")
        colnames(female) <- c("term", "E", "P", "A", "instcodes")
        colnames(average) <- c("term", "E", "P", "A", "instcodes")
      }

      # standardize terms
      male <- standardize_terms(male, key, component)
      female <- standardize_terms(female, key, component)
      average <- standardize_terms(average, key, component)

      term_table_input <- cbind(average[,1], rep(1, length(average[,1])))
      colnames(term_table_input) <- c("term", key)

      # # get institution codes; add to aggregate list
      # if("instcodes" %in% colnames(average)){
      #   inst_table_input <- dplyr::select(average, term, instcodes)
      #   colnames(inst_table_input) <- c("term", key)
      #
      #   if(component == 'identities'){
      #     inst_code_table_ident <- dplyr::full_join(inst_code_table_ident, inst_table_input, by = "term")
      #   } else if (component == 'behaviors'){
      #     inst_code_table_beh <- dplyr::full_join(inst_code_table_beh, inst_table_input, by = "term")
      #   } else if (component == 'mods'){
      #     inst_code_table_mod <- dplyr::full_join(inst_code_table_mod, inst_table_input, by = "term")
      #   } else if (component == 'settings'){
      #     inst_code_table_set <- dplyr::full_join(inst_code_table_set, inst_table_input, by = "term")
      #   }
      # }

      # are the male and female sets identical? If so the reported values are averages already and need only print one file
      if(isTRUE(all.equal(male$E, female$E))){
        avonly <- TRUE
      } else {
        avonly <- FALSE
      }

      # format average file for long format and append to complete df
      average$dataset <- key
      average$context <- context
      average$year <- year
      average$component <- component
      average$group <- "all"
      average <- dplyr::select(average, all_of(meannames))

      mean_epa <- rbind(mean_epa, average)


      # then do the same with male and female files if necessary
      if(avonly == FALSE){
        male$dataset <- key
        male$context <- context
        male$year <- year
        male$component <- component
        male$group <- "male"
        male <- dplyr::select(male, all_of(meannames))

        female$dataset <- key
        female$context <- context
        female$year <- year
        female$component <- component
        female$group <- "female"
        female <- dplyr::select(female, all_of(meannames))

        if(key == "internationaldomesticrelations1981"){
          male$group <- "professional"
          female$group <- "nonprofessional"
        } else if(key == "gaymensanfrancisco1980"){
          male$group <- "unsafebetter"
          female$group <- "safebetter"
        }

        mean_epa <- rbind(mean_epa, male)
        mean_epa <- rbind(mean_epa, female)
      }
    }
  }
}

mean_epa <- mean_epa %>%
  dplyr::rename(comp = component) %>%
  dplyr::mutate(
    comp = dplyr::case_when(
      comp == "identities" ~ "identity",
      comp == "behaviors" ~ "behavior",
      comp == "mods" ~ "modifier",
      comp == "settings" ~ "setting",
      TRUE ~ NA_character_
    )
  ) %>%
  dplyr::rename(component = comp)

# usethis::use_data(mean_epa, overwrite = TRUE)

#### MEANS DATASETS THAT NEED MORE REFORMATTING: CALCUTTA, LULHAM AND SHANK, MOSTAFAVI ####################################################

source_folder <- "data-raw/dicts/summary_raw/"
files <- list.files(source_folder)

for(file in files){
  path <- paste0(source_folder, "/", file)
  key <- stringr::str_extract(file, "^[[:alnum:]]*")
  year <- stringr::str_extract(key, "[[:digit:]]*$")
  # print(key)

  if(grepl("calcutta", key)){
    # the calcutta dataset should be split into two: one for all respondents, one for the subset of respondents that uses the scales correctly.
    data <- readr::read_csv(path) %>%
      dplyr::rename(term = English) %>%
      dplyr::select(-Bengali) %>%
      dplyr::mutate(term = tolower(term)) %>%
      dplyr::rename_with(~stringr::str_replace(., "@", "all_")) %>%
      dplyr::rename_with(~stringr::str_replace(., "%", "subset_"))

    # standardize terms
    data_std <- standardize_terms(data, key = "calcutta", component = "undetermined") %>%
      mutate(term = dplyr::case_when(term == "know_it_all" & all_mE == .16 ~ "know_it_all_translation_1",
                                     term == "know_it_all" & all_mE == -.57 ~ "know_it_all_translation_2",
                                     TRUE ~ term))

    # term_table_input_calcutta <- cbind(data_std[,1], rep(1, length(data_std[,1])))
    # colnames(term_table_input_calcutta) <- c("term", key)

    calcutta <- data_std %>%
      tidyr::pivot_longer(cols = c(starts_with("all"), starts_with("subset")),
                          names_to = c("dataset", ".value"), names_pattern = "([[:alpha:]]*)_(.*)") %>%
      dplyr::rowwise() %>%
      dplyr::mutate(aE = (mE*mEN + fE*fEN)/(mEN + fEN),
                    aP = (mP*mPN + fP*fPN)/(mPN + fPN),
                    aA = (mA*mAN + fA*fAN)/(mAN + fAN),
                    aEN = mEN + fEN,
                    aPN = mPN + fPN,
                    aAN = mAN + fAN,
                    aE_SD = sqrt(((mEN - 1)*mE_SD^2 + (fEN - 1)*fE_SD^2)/(mEN + fEN - 2)),
                    aP_SD = sqrt(((mPN - 1)*mP_SD^2 + (fPN - 1)*fP_SD^2)/(mPN + fPN - 2)),
                    aA_SD = sqrt(((mAN - 1)*mA_SD^2 + (fAN - 1)*fA_SD^2)/(mAN + fAN - 2))
      ) %>%
      dplyr::ungroup() %>%
      tidyr::pivot_longer(cols = c(-term, -component, -dataset),
                          names_to = c("group", ".value"),
                          names_pattern = "^(.)(.*)") %>%
      dplyr::rename(n_E = EN,
                    n_P = PN,
                    n_A = AN,
                    sd_E = E_SD,
                    sd_P = P_SD,
                    sd_A = A_SD) %>%
      dplyr::mutate(context = dict_meta[dict_meta$key == "calcuttaall2017", "context"],
                    year = year,
                    dataset = dplyr::case_when(dataset == "all" ~ "calcuttaall2017",
                                               dataset == "subset" ~ "calcuttasubset2017"),
                    group = dplyr::case_when(group == "m" ~ "male",
                                              group == "f" ~ "female",
                                              group == "a" ~ "all")) %>%
      dplyr::mutate(across(where(is.numeric), ~round(., digits = 2))) %>%
      dplyr::mutate(component = ifelse(.data$component == "other", "artifact", .data$component))
  } else {
    data <- read.csv(path)

    if(grepl("employeeorg", key)){
      data_std <- data %>%
        dplyr::mutate(
          term = tolower(stringr::str_squish(term)),
          # there are two term formats here; companies and the people who work for them
          term = ifelse(condition == "org",
                        term,
                        paste0("employee of ", term)
          ),
          mean_E = stringr::str_extract(stringr::str_squish(E), ".*(?=\\s)"),
          sd_E = stringr::str_extract(stringr::str_squish(E), "(?<=\\().*(?=\\))"),
          mean_P = stringr::str_extract(stringr::str_squish(P), ".*(?=\\s)"),
          sd_P = stringr::str_extract(stringr::str_squish(P), "(?<=\\().*(?=\\))"),
          mean_A = stringr::str_extract(stringr::str_squish(A), ".*(?=\\s)"),
          sd_A = stringr::str_extract(stringr::str_squish(A), "(?<=\\().*(?=\\))"),
          component = "identity",
          group = "average"
        ) %>%
        dplyr::mutate(across(c(starts_with("mean"), starts_with("sd")), ~round(as.numeric(.), digits = 2))) %>%
        dplyr::select(term, component, group, starts_with("mean"), starts_with("sd")) %>%
        dplyr::rename(E = mean_E,
                      P = mean_P,
                      A = mean_A) %>%
        standardize_terms(key = key)
    } else if (grepl("generaltech", key)){
      data_std <- data %>%
        dplyr::rename(term = MEANS,
                      sd_E = E.1,
                      sd_P = P.1,
                      sd_A = A.1) %>%
        dplyr::select(-SDs) %>%
        dplyr::mutate(across(c(E, P, A, starts_with("sd")), ~round(as.numeric(.), digits = 2))) %>%
        dplyr::mutate(component = "artifact",
                      group = "all") %>%
        standardize_terms(key = key)
    } else if (grepl("groups2017", key)){
      data_std <- data %>%
        dplyr::rename(term = Group_concept,
                      E = Evaluation,
                      P = Potency,
                      A = Activity) %>%
        dplyr::mutate(component = "identity",
                      group = "all") %>%
        dplyr::mutate(across(c(E, P, A), ~round(as.numeric(.), digits = 2))) %>%
        standardize_terms(key = key)
    } else if (grepl("groups2019", key)){
      data_std <- data %>%
        dplyr::rename(term = X.1,
                      E = Means,
                      P = X.2,
                      A = X.3) %>%
        dplyr::select(-X) %>%
        dplyr::filter(term != "") %>%
        dplyr::mutate(component = "identity",
                      group = "all") %>%
        dplyr::mutate(across(c(E, P, A), ~round(as.numeric(.), digits = 2))) %>%
        standardize_terms(key = key)
    } else if (grepl("nounphrasegrammar2019", key)){
      data_std <- data %>%
        standardize_terms(key = key) %>%
        dplyr::mutate(
          mean = as.numeric(stringr::str_extract(stringr::str_squish(rating), ".*(?=\\s)")),
          sd = as.numeric(stringr::str_extract(stringr::str_squish(rating), "(?<=\\().*(?=\\))")),
          plural = paste0(term, "s")) %>%
        dplyr::mutate(term_new = dplyr::case_when(
          condition == 1 & stringr::str_extract(term, "^.") %in% c("a", "e", "i", "o", "u") ~ paste0("an_", term),
          condition == 1 ~ paste0("a_", term),
          condition == 2 ~ paste0("the_", term),
          condition == 3 ~ plural,
          condition == 4 ~ paste0("the_", plural),
          condition == 5 ~ paste0("all_", plural)
        )) %>%
        dplyr::select(term_new, dimension, mean, sd) %>%
        tidyr::pivot_wider(names_from = dimension, values_from = c("mean", "sd")) %>%
        dplyr::rename(E = mean_E,
                      P = mean_P,
                      A = mean_A,
                      term = term_new) %>%
        dplyr::mutate(across(c(E, P, A, starts_with("sd")), ~round(as.numeric(.), digits = 2))) %>%
        dplyr::mutate(component = "identity",
                      group = "all")
    } else if (grepl("techvshuman", key)){
      data_std <- data %>%
        dplyr::rename(
          term_human = X,
          term_comp = X.1,
          term_ai = X.2,
          E_human = Evaluation,
          E_comp = X.3,
          E_ai = X.4,
          P_human = Potency,
          P_comp = X.5,
          P_ai = X.6,
          A_human = Activity,
          A_comp = X.7,
          A_ai = X.8
        ) %>%
        dplyr::filter(term_human != "human identity") %>%
        tidyr::pivot_longer(cols = everything(),
                            names_to = c(".value", "actortype"),
                            names_pattern = "(.*)_(.*)") %>%
        dplyr::mutate(across(c(E, P, A), ~round(as.numeric(.), digits = 2))) %>%
        dplyr::select(-actortype) %>%
        dplyr::mutate(component = "identity",
                      group = "all") %>%
        standardize_terms(key = key)
    } else if (grepl("ugatech", key)){
      data_std <- data %>%
        dplyr::mutate(n_E_male = n_male,
                      n_P_male = n_male,
                      n_A_male = n_male,
                      n_E_female = n_female,
                      n_P_female = n_female,
                      n_A_female = n_female) %>%
        dplyr::rowwise() %>%
        dplyr::mutate(
                      mean_E_average = (mean_E_male * n_male + mean_E_female * n_female)/(n_male + n_female),
                      mean_P_average = (mean_P_male * n_male + mean_P_female * n_female)/(n_male + n_female),
                      mean_A_average = (mean_A_male * n_male + mean_A_female * n_female)/(n_male + n_female),
                      sd_E_average = sqrt(((n_male - 1)*sd_E_male^2 + (n_female - 1)*sd_E_female^2)/(n_male + n_female - 2)),
                      sd_P_average = sqrt(((n_male - 1)*sd_P_male^2 + (n_female - 1)*sd_P_female^2)/(n_male + n_female - 2)),
                      sd_A_average = sqrt(((n_male - 1)*sd_A_male^2 + (n_female - 1)*sd_A_female^2)/(n_male + n_female - 2)),
                      n_E_average = n_male + n_female,
                      n_P_average = n_male + n_female,
                      n_A_average = n_male + n_female,
                      ) %>%
        dplyr::ungroup() %>%
        dplyr::select(-n_male, -n_female) %>%
        tidyr::pivot_longer(cols = c(contains("male"), contains("average")),
                            names_to = c(".value", "dimension", "group"),
                            names_sep = "_") %>%
        dplyr::group_by(term, group) %>%
        dplyr::mutate(across(c("mean", "sd"), ~round(., digits = 2))) %>%
        tidyr::pivot_wider(names_from = "dimension", values_from = c("mean", "sd", "n")) %>%
        dplyr::rename(E = mean_E,
                      P = mean_P,
                      A = mean_A)
    } else if(grepl("mostafavi", key)){
      data_std <- data %>%
        dplyr::select(Original_term, component, E, P, A, E_std, P_std, A_std) %>%
        dplyr::rename(term = Original_term,
                      sd_E = E_std,
                      sd_P = P_std,
                      sd_A = A_std) %>%
        dplyr::mutate(group = "all") %>%
        standardize_terms(key = key) %>%
        dplyr::filter(term != "")

    }
  }

  data_std <- data_std %>%
    dplyr::mutate(context = ifelse(!grepl("calcutta", key), dict_meta[dict_meta$key == key, "context"], context),
                  year = year,
                  dataset = key) %>%
    dplyr::select(any_of(cnames))

  mean_epa <- mean_epa %>%
    dplyr::full_join(data_std)
}



#### NOW INDIVIDUAL DATA: USE TO CALCULATE SD/COV AND LUMP TOGETHER TO SAVE #######################


mean_variance_epa <- data.frame(matrix(nrow = 0, ncol = length(cnames) - 1))
individual <- data.frame()
names(mean_variance_epa) <- cnames[cnames != "instcodes"]

source_folder <- "data-raw/dicts/individual"
ind_file_list <- grep("RDS$", list.files(source_folder), value = TRUE)
for(file in ind_file_list){
  path <- paste0(source_folder, "/", file)

  key <- stringr::str_extract(file, "^[[:alnum:]]*(?=_)")
  if(!(key %in% exclude_keys)){
    # context <- stringr::str_extract(key, "^[[:alpha:]]*(?=[[:digit:]])")
    context <- dict_meta[dict_meta$key == key, "context"]
    # I'm leaving year as a regex instead of taking it from meta because this ensures it is numeric and therefore sortable
    year <- stringr::str_extract(key, "[[:digit:]]*$")
    # year <- meta[meta$key == key, "year"]

    data <- readRDS(file = path) %>%
      dplyr::mutate(dataset = key,
                    context = context,
                    year = year) %>%
      dplyr::select(dataset, context, year, dplyr::everything()) %>%
      dplyr::mutate(across(everything(), as.character))

    sum_data <- epa_summary(data)
    # commented out because it fails with the mturk dictionary, I think because it calculates the sd with all values but the vcov matrix only with complete pairs.
    # if(!check_sd_cov_vals(sum_data)){
    #   stop(print(paste("error with current dataset ", key)))
    # }

    # add in dataset level variables
    # in principle you could calculate different gender versions but in practice these are generally not useful so I am going to lump all together.
    # if someone wants to do this (for any characteristic) they can using the individual data.
    sum_data <- sum_data %>%
      dplyr::mutate(dataset = key,
                    context = context,
                    year = year,
                    group = "all",
                    E = mean_E,
                    P = mean_P,
                    A = mean_A) %>%
      dplyr::select(any_of(cnames))

    # some of this info is duplicative but also this is what bayesact expects so perhaps it's worth keeping all and just making note... the datasets aren't that big
    mean_variance_epa <- rbind(mean_variance_epa, sum_data)

    if(nrow(individual) == 0){
      individual <- data.frame(matrix("", nrow = 0, ncol = ncol(data)))
      names(individual) <- names(data)
    }

    individual <- dplyr::full_join(individual, data)
    }
}

duplicateid <- individual %>%
  dplyr::select(dataset, userid) %>%
  dplyr::distinct() %>%
  dplyr::group_by(userid) %>%
  dplyr::mutate(n = dplyr::n()) %>%
  dplyr::filter(n > 1,
                dataset %in% c("usfullsurveyor2015", "usstudent2015")) %>%
  dplyr::select(-n)

individual <- individual %>%
  dplyr::anti_join(duplicateid)

# # no uga userIDs left in the usfullsurveyor dataset--all UGA folks are accounted for under the uga dataset.
# unique(stringr::str_extract(dplyr::filter(individual, dataset == "usfullsurveyor2015")$userid, "[[:alpha:]]*"))
#
# duplicated <- individual %>%
#   dplyr::inner_join(dplyr::select(duplicateid, userid)) %>%
#   dplyr::distinct(dplyr::across(-dataset))

# # Only issue is that two people in duke community got the same identifier--modify so they are different.
# problemmatch <- duplicated %>%
#   dplyr::group_by(userid, term, component) %>%
#   dplyr::mutate(n = dplyr::n()) %>%
#   dplyr::filter(n > 1)


#### INSTITUTION CODES #################################

instcodes_df <- utils::read.csv2("data-raw/dicts/instcodes.csv", header = FALSE, sep = ",", col.names = c("term", "component", "instcodes"))
instcodes_df <- rbind(standardize_terms(instcodes_df[which(instcodes_df$component == "identity"),], key = "uga2015", component = "identity"),
                   standardize_terms(instcodes_df[which(instcodes_df$component == "behavior"),], key = "uga2015", component = "behavior"),
                   standardize_terms(instcodes_df[which(instcodes_df$component == "modifier"),], key = "uga2015", component = "modifier"),
                   standardize_terms(instcodes_df[which(instcodes_df$component == "setting"),], key = "uga2015", component = "setting")) %>%
  mutate(instcodes = stringr::str_trim(instcodes))

individual <- individual %>%
  dplyr::mutate(
    userid = dplyr::case_when(userid == "DComm597" & gender == "Female" ~ "DComm597a",
                              userid == "DComm597" & gender == "Male" ~ "DComm597b",
                              TRUE ~ userid)
  ) %>%
  dplyr::left_join(instcodes_df, by = c("term", "component")) %>%
  dplyr::select(any_of(c("dataset", "context", "year", "userid", "gender", "age",
                         "raceeth", "race", "race1", "race2", "hisp", "term", "component", "instcodes")),
                everything())

individual <- tibble::as_tibble(individual) %>%
  dplyr::mutate(E = as.numeric(E),
                P = as.numeric(P),
                A = as.numeric(A))


epa_summary_statistics <- dplyr::bind_rows(mean_variance_epa, mean_epa) %>%
  dplyr::full_join(calcutta) %>%
  dplyr::filter(!is.na(E) | !is.na(P) | !is.na(A)) %>%
  dplyr::filter(!is.na(term)) %>%
  dplyr::arrange(dataset, term) %>%
  dplyr::rename(instcodes_old = instcodes) %>%
  dplyr::left_join(instcodes_df, by = c("term", "component")) %>%
  # merge the old and new instititution codes together -- take the uga one unless there is no uga one
  dplyr::mutate(instcodes = ifelse(is.na(instcodes), instcodes_old, instcodes)) %>%
  dplyr::mutate(instcodes = stringr::str_trim(instcodes)) %>%
  dplyr::select(-instcodes_old) %>%
  dplyr::select(term, component, dataset, context, year, group, instcodes, everything())

epa_summary_statistics <- tibble::as_tibble(epa_summary_statistics)  %>%
  dplyr::mutate(E = as.numeric(E),
                P = as.numeric(P),
                A = as.numeric(A))

# there are 642 instances where institution codes do not agree between the uga set and whatever the old set was
# I am overwriting the old codes with the uga codes, for consistency
# notequal <- dplyr::filter(epa_summary_statistics, instcodes != stringr::str_trim(instcodes_old))
# # there are 10389 instances where a term has an institution code in some dataset but not in uga
# # are there inconsistencies here?
# notinuga <- dplyr::filter(epa_summary_statistics, is.na(instcodes) & !is.na(instcodes_old)) %>%
#   dplyr::select(term, component, instcodes_old) %>%
#   dplyr::distinct() %>%
#   dplyr::group_by(term, component) %>%
#   dplyr::mutate(n = dplyr::n()) %>%
#   filter(n > 1)
#
# # there are 27 terms which do not have a code in the uga dataset and which have conflicting codes in other datasets
# length(unique(notinuga$term))

# save the combined summary statistic dataframe
# usethis::use_data(mean_variance_epa, overwrite = TRUE)

usethis::use_data(epa_summary_statistics, overwrite = TRUE, compress = "bzip2")

# save the combined individual dataframe
usethis::use_data(individual, overwrite = TRUE, compress = "bzip2")



check_sd_cov_vals <- function(data){
  # check if the diagonal of the vcov matrix is the same as the standard deviation squared (ie is it really the variance)
  dat_check <- data %>%
    dplyr::mutate(E_var_sd2 = sd_E*sd_E,
                  P_var_sd2 = sd_P*sd_P,
                  A_var_sd2 = sd_A*sd_A,
                  var_E_equal = abs(E_var_sd2 - cov_EE) <= 1e-1,
                  var_P_equal = abs(P_var_sd2 - cov_PP) <= 1e-1,
                  var_A_equal = abs(A_var_sd2 - cov_AA) <= 1e-1,
                  refl1 = cov_EP == cov_PE,
                  refl2 = cov_EA == cov_AE,
                  refl3 = cov_AP == cov_PA)
  if(!all(dat_check$var_E_equal, na.rm = TRUE) |
     !all(dat_check$var_P_equal, na.rm = TRUE) |
     !all(dat_check$var_A_equal, na.rm = TRUE)) {
    return(FALSE)
  } else {
    print("variance and sd check out")
  }

  # check for expected reflection in the vcov matrix
  if(!all(dat_check$refl1, na.rm = TRUE) |
     !all(dat_check$refl2, na.rm = TRUE) |
     !all(dat_check$refl3, na.rm = TRUE)){
    return(FALSE)
  } else {
    print("matrix is upper triangular")
  }

  return(TRUE)
}

##### CREATE TERM TABLE

keys <- unique(epa_summary_statistics$dataset)
term_table <- epa_summary_statistics %>%
  dplyr::select(term, component) %>%
  dplyr::distinct()

for(key in keys){
  subset_idents <- epa_summary_statistics[epa_summary_statistics[["dataset"]] == key,] %>%
    dplyr::select(term, component) %>%
    dplyr::distinct() %>%
    dplyr::mutate({{key}} := 1)

  term_table <- term_table %>%
    dplyr::left_join(subset_idents, by = c("term", "component"))
}

term_table <- term_table %>%
  dplyr::mutate(across(-c("term", "component"), ~replace(., is.na(.), 0))) %>%
  dplyr::select(term, component, everything())

usethis::use_data(term_table, overwrite = TRUE, compress = "bzip2")



#
# instcode_rowequal <- function(row){
#   noterm <- row[,2:ncol(row)]
#   noterm <- as.character(noterm)
#   noterm <- noterm[!is.na(noterm)]
#   if(length(unique(noterm)) > 1){
#     return(FALSE)
#   }
#   else{
#     return(TRUE)
#   }
# }

# inst_code_table_ident <- dplyr::select(inst_code_table_ident, -allsame)
# inst_code_table_beh <- dplyr::select(inst_code_table_beh, -allsame)
# inst_code_table_mod <- dplyr::select(inst_code_table_mod, -allsame)
# inst_code_table_set <- dplyr::select(inst_code_table_set, -allsame)
#
#
# # figure out which are duplicates
# inst_code_table_ident <- inst_code_table_ident %>%
#   dplyr::filter(!is.na(term))
# inst_code_table_beh <- inst_code_table_beh %>%
#   dplyr::filter(!is.na(term))
# inst_code_table_mod <- inst_code_table_mod %>%
#   dplyr::filter(!is.na(term))
# inst_code_table_set <- inst_code_table_set %>%
#   dplyr::filter(!is.na(term))
#
#
# inst_code_table_ident_temp <- inst_code_table_ident
# for(i in 1:nrow(inst_code_table_ident)){
#   inst_code_table_ident_temp[i, "allsame"] <- instcode_rowequal(inst_code_table_ident[i,])
# }
# inst_code_table_ident <- inst_code_table_ident_temp
#
# inst_code_table_beh_temp <- inst_code_table_beh
# for(i in 1:nrow(inst_code_table_beh)){
#   inst_code_table_beh_temp[i, "allsame"] <- instcode_rowequal(inst_code_table_beh[i,])
# }
# inst_code_table_beh <- inst_code_table_beh_temp
#
# inst_code_table_mod_temp <- inst_code_table_mod
# for(i in 1:nrow(inst_code_table_mod)){
#   inst_code_table_mod_temp[i, "allsame"] <- instcode_rowequal(inst_code_table_mod[i,])
# }
# inst_code_table_mod <- inst_code_table_mod_temp
#
# inst_code_table_set_temp <- inst_code_table_set
# for(i in 1:nrow(inst_code_table_set)){
#   inst_code_table_set_temp[i, "allsame"] <- instcode_rowequal(inst_code_table_set[i,])
# }
# inst_code_table_set <- inst_code_table_set_temp
#
# inst_dups_ident <- dplyr::filter(inst_code_table_ident, allsame == FALSE)
# inst_dups_beh <- dplyr::filter(inst_code_table_beh, allsame == FALSE)
# inst_dups_mod <- dplyr::filter(inst_code_table_mod, allsame == FALSE)
# inst_dups_set <- dplyr::filter(inst_code_table_set, allsame == FALSE)
