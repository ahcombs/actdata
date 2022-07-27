# TODO: Which dictionaries to include? All? Or should it be limited to those that have been published with? Should I include subsets (prisoner's dilemma)?



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
  "gender",
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
  "gender",
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
  "occs2020"
)

meta <- utils::read.csv("data-raw/dicts/dict_info.csv")

exclude_keys <- c("prisonersdilemma")

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
    context <- meta[meta$key == key, "context"]
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
      average$gender <- "average"
      average <- dplyr::select(average, all_of(meannames))

      mean_epa <- rbind(mean_epa, average)


      # then do the same with male and female files if necessary
      if(avonly == FALSE){
        male$dataset <- key
        male$context <- context
        male$year <- year
        male$component <- component
        male$gender <- "male"
        male <- dplyr::select(male, all_of(meannames))

        female$dataset <- key
        female$context <- context
        female$year <- year
        female$component <- component
        female$gender <- "female"
        female <- dplyr::select(female, all_of(meannames))

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




#### NOW INDIVIDUAL DATA: USE TO CALCULATE SD/COV AND LUMP TOGETHER TO SAVE #######################




mean_variance_epa <- data.frame(matrix(nrow = 0, ncol = length(cnames) - 1))
individual <- data.frame()
names(mean_variance_epa) <- cnames[cnames != "instcodes"]

source_folder <- "data-raw/dicts/individual"
ind_file_list <- grep("RDS$", list.files(source_folder), value = TRUE)
for(file in ind_file_list){
  path <- paste0(source_folder, "/", file)

  # TODO: maybe some NA values in dukecommunity 2015??
  key <- stringr::str_extract(file, "^[[:alnum:]]*(?=_)")
  # context <- stringr::str_extract(key, "^[[:alpha:]]*(?=[[:digit:]])")
  context <- meta[meta$key == key, "context"]
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
  # TODO: deal with institution codes here?
  sum_data <- sum_data %>%
    dplyr::mutate(dataset = key,
                  context = context,
                  year = year,
                  gender = "average",
                  E = mean_E,
                  P = mean_P,
                  A = mean_A) %>%
    dplyr::select(any_of(cnames))

  # TODO: some of this info is duplicative but also this is what bayesact expects so perhaps it's worth keeping all and just making note... the datasets aren't that big
  mean_variance_epa <- rbind(mean_variance_epa, sum_data)

  if(nrow(individual) == 0){
    individual <- data.frame(matrix("", nrow = 0, ncol = ncol(data)))
    names(individual) <- names(data)
  }

  individual <- dplyr::full_join(individual, data)
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

# duplicated <- individual %>%
#   dplyr::inner_join(dplyr::select(duplicateid, userid)) %>%
#   dplyr::distinct(dplyr::across(-dataset))
#
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


# TODO double check when occs data is added
individual <- individual %>%
  dplyr::mutate(
    userid = dplyr::case_when(userid == "DComm597" & gender == "Female" ~ "DComm597a",
                              userid == "DComm597" & gender == "Male" ~ "DComm597b",
                              TRUE ~ userid)
  ) %>%
  dplyr::left_join(instcodes_df, by = c("term", "component")) %>%
  dplyr::select(dataset, context, year, userid, gender, age, race1, race2, term, component, instcodes, everything())

individual <- tibble::as_tibble(individual)


epa_summary_statistics <- dplyr::bind_rows(mean_variance_epa, mean_epa) %>%
  dplyr::filter(!is.na(E) | !is.na(P) | !is.na(A)) %>%
  dplyr::arrange(dataset, term) %>%
  dplyr::rename(instcodes_old = instcodes) %>%
  dplyr::left_join(instcodes_df, by = c("term", "component")) %>%
  # merge the old and new instititution codes together -- take the uga one unless there is no uga one
  dplyr::mutate(instcodes = ifelse(is.na(instcodes), instcodes_old, instcodes)) %>%
  dplyr::mutate(instcodes = stringr::str_trim(instcodes)) %>%
  dplyr::select(-instcodes_old) %>%
  dplyr::select(term, component, dataset, context, year, gender, instcodes, everything())

epa_summary_statistics <- tibble::as_tibble(epa_summary_statistics)

# there are 642 instances where institution codes do not agree between the uga set and whatever the old set was
# I am overwriting the old codes with the uga codes, for consistency--TODO note this in documentation
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

# TODO: function for decoding the institution codes

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
  dplyr::mutate(across(-c("term", "component"), ~replace(., is.na(.), 0)))

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
