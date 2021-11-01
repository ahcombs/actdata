# TODO: Which dictionaries to include? All? Or should it be limited to those that have been published with (so not gaysex1980)? Should I include subsets (prisoner's dilemma)?

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
  "sd_E",
  "sd_P",
  "sd_A",
  "cov1",
  "cov2",
  "cov3",
  "cov4",
  "cov5",
  "cov6",
  "cov7",
  "cov8",
  "cov9"
)

meannames <- cnames[1:10]

# TODO: check what order the cov values are presented in (compare to Jesse's UGA datasets)

mean_epa <- data.frame(matrix(nrow = 0, ncol = length(meannames)))
names(mean_epa) <- meannames

for(file in means_file_list){
  # TODO: individual datasets
  path <- paste0(source_folder, "/", file)
  component <- stringr::str_extract(file, "(?<=_)[[:alpha:]]*(?=.)")

  key <- stringr::str_extract(file, "^[[:alnum:]]*(?=_)")
  context <- stringr::str_extract(key, "^[[:alpha:]]*(?=[[:digit:]])")
  year <- stringr::str_extract(key, "[[:digit:]]*$")
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




#### NOW INDIVIDUAL DATA: SAVE INDIVIDUALLY AND USE TO CALCULATE SD/COV #######################


calc_stats <- function(data, key){
  sum_data <- data %>%
    dplyr::select(term_ID, E, P, A) %>%
    dplyr::rename(term = term_ID)

  # TODO: Issue with standardize terms
  sum_data <- standardize_terms(sum_data, key)%>%
    dplyr::group_by(term) %>%
    dplyr::mutate(sd_E = sd(E, na.rm = TRUE),
                  sd_P = sd(P, na.rm = TRUE),
                  sd_A = sd(A, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(across(c(-term, -component), as.numeric))

  # ADD COV
  # Calculate a separate covariance matrix for each term, and input the values into the dataframe above.
  allterms <- unique(sum_data$term)
  covars <- data.frame(matrix(nrow = 0, ncol = 10))
  names(covars) <- c("term", "cov_EE", "cov_EP", "cov_EA", "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA")
  for(t in allterms){
    subset <- sum_data[sum_data$term == t,] %>%
      dplyr::select(E, P, A)

    # check how to handle missing values here--right now we are going to listwise delete.
    # There is also a pairwise option but it sounds more complicated.
    # Really, we don't need to include all 9 values here; 3 should be repeated.
    # Also, the diagonals should be the square of the sd values--there's an argument for keeping this in anyway though if we want to report var and sd (but do we need sd?)
    # TODO: Remove once tested
    covarmat <- cov(subset, use = "complete.obs") # 3x3 mat
    covarvec <- data.frame(term = t,
                           cov_EE = covarmat[1, 1],
                           cov_EP = covarmat[1, 2],
                           cov_EA = covarmat[1, 3],
                           cov_PE = covarmat[2, 1],
                           cov_PP = covarmat[2, 2],
                           cov_PA = covarmat[2, 3],
                           cov_AE = covarmat[3, 1],
                           cov_AP = covarmat[3, 2],
                           cov_AA = covarmat[3, 3])

    covars <- rbind(covars, covarvec)
  }

  sum_data <- dplyr::left_join(sum_data, covars, by = "term")
  return(sum_data)
}



source_folder <- "data-raw/dicts/individual"
ind_file_list <- list.files(source_folder)
for(file in ind_file_list){
  path <- paste0(source_folder, "/", file)

  # TODO: maybe some NA values in dukecommunity 2015??
  print(key)
  key <- stringr::str_extract(file, "^[[:alnum:]]*(?=_)")
  context <- stringr::str_extract(key, "^[[:alpha:]]*(?=[[:digit:]])")
  year <- stringr::str_extract(key, "[[:digit:]]*$")

  data <- read.csv2(path, sep = ",")

  sum_data <- calc_stats(data, key)
  if(!check_sd_cov_vals(sum_data)){
    stop(print(paste("error with current dataset ", key)))
  }

  # some of this info is duplicative but also this is what bayesact expects so perhaps it's worth keeping all and just making note... the datasets aren't that big

  # NEXT: COMPARE AGAINST JESSE'S DATASETS

  # then save individual data
}

check_sd_cov_vals <- function(data){
  # check if the diagonal of the vcov matrix is the same as the standard deviation squared (ie is it really the variance)
  dat_check <- data %>%
    dplyr::mutate(E_var_sd2 = sd_E*sd_E,
                  P_var_sd2 = sd_P*sd_P,
                  A_var_sd2 = sd_A*sd_A,
                  var_E_equal = abs(E_var_sd2 - cov_EE) <= 1e-5,
                  var_P_equal = abs(P_var_sd2 - cov_PP) <= 1e-5,
                  var_A_equal = abs(A_var_sd2 - cov_AA) <= 1e-5,
                  refl1 = cov_EP == cov_PE,
                  refl2 = cov_EA == cov_AE,
                  refl3 = cov_AP == cov_PA)
  if(!all(dat_check$var_E_equal) |
     !all(dat_check$var_P_equal) |
     !all(dat_check$var_A_equal)) {
    return(FALSE)
  } else {
    print("variance and sd check out")
  }

  # check for expected reflection in the vcov matrix
  if(!all(dat_check$refl1) |
     !all(dat_check$refl2) |
     !all(dat_check$refl3)){
    return(FALSE)
  } else {
    print("matrix is upper triangular")
  }

  return(TRUE)
}


save(mean_epa, file = "data/mean_epa.RData")


keys <- unique(mean_epa$dataset)
term_table <- mean_epa %>%
  dplyr::select(term, component) %>%
  dplyr::distinct()

for(key in keys){
  subset_idents <- mean_epa[mean_epa[["dataset"]] == key,] %>%
    dplyr::select(term, component) %>%
    dplyr::distinct() %>%
    dplyr::mutate({{key}} := 1)

  term_table <- term_table %>%
    dplyr::left_join(subset_idents, by = c("term", "component"))
}

term_table[is.na(term_table)] <- 0

save(term_table, file = "data/term_table.RData")




# TODO: Contact Kait Boyle about the institution code stuff

instcode_rowequal <- function(row){
  noterm <- row[,2:ncol(row)]
  noterm <- as.character(noterm)
  noterm <- noterm[!is.na(noterm)]
  if(length(unique(noterm)) > 1){
    return(FALSE)
  }
  else{
    return(TRUE)
  }
}

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
