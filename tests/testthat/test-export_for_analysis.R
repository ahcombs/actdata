test_that("save_for_interact file name and type and data frame type error handling works", {
  data <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "nc1978")

  expect_error(save_for_interact(data, filename = 1, savefile = FALSE), "File name must be a string.")
  expect_error(save_for_interact(data, filename = c("file1", "file2"), savefile = FALSE), "Must provide a single file name.")
  expect_error(save_for_interact(data, filename = "file1", savefile = FALSE), "Invalid file extension. Extension .txt required.")
  expect_error(save_for_interact(data, filename = "file1.xls", savefile = FALSE), "Invalid file extension. Extension .txt required.")

  expect_error(save_for_interact(data, type = "invalidtype", filename = "file1.txt", savefile = FALSE), "Invalid data type. Must be 'dict' or 'eqn'.")

  expect_error(save_for_interact(1, filename = "file1.txt", savefile = FALSE), "data must be a tibble or data frame")
  expect_error(save_for_interact("notdf", filename = "file1.txt", savefile = FALSE), "data must be a tibble or data frame")
  expect_error(save_for_interact(matrix(data = 1:6, ncol = 3), filename = "file1.txt", savefile = FALSE), "data must be a tibble or data frame")
})

test_that("save_for_interact error handling for column names and institution codes works", {
  data <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "politics2003", gender == "average")

  data_twogender <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "politics2003", gender %in% c("female", "average"))

  ### TERM COLUMN NAMES
  names(data) <- rep("", ncol(data))
  expect_error(save_for_interact(data, filename = "file.txt", savefile = FALSE), "data must contain a column titled 'term'")

  names(data) <- c("t", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt", savefile = FALSE), "data must contain a column titled 'term'")

  names(data) <- c("term", "term", "context", "year", "component", "gender", "E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt", savefile = FALSE), "data must only contain one term column")


  ### EPA COLUMN NAMES
  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "no_E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt", savefile = FALSE), "data is missing an E, P, or A column")

  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "no_A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt", savefile = FALSE), "data is missing an E, P, or A column")

  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "E_n", "n_P", "n_A", "E_sd", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt", savefile = FALSE), "data has too many columns starting with E, P, or A")

  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "E_n", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt", savefile = FALSE), "data must have either one each or two each of E, P, and A columns")

  names(data_twogender) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "E_n", "P_n", "A_n", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data_twogender, group = "gender", filename = "file.txt", savefile = FALSE), "cannot provide both multiple E, P, and A columns and a group column")

  ### TERM AND EPA COLUMN FORMAT AND TYPES
  names(data) <- c("term", "dataset", "context", "year", "component", "E", "not_E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt", savefile = FALSE), "E, P, and A columns must be completely numeric or coercible to numeric")
  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  data_naterm <- data
  data_naterm$term[1] <- NA
  expect_error(save_for_interact(data_naterm, filename = "file.txt", savefile = FALSE), "all entries in term column must be coercible to character")

  ### GROUP
  expect_error(save_for_interact(data, group = c("gender", "dataset"), filename = "file.txt", savefile = FALSE), "only one grouping column can be provided")
  expect_error(save_for_interact(data, group = "notvalid", filename = "file.txt", savefile = FALSE), "group column does not exist")
  data_nagroup <- data
  data_nagroup$gender[1] <- NA
  expect_error(save_for_interact(data_nagroup, group = "gender", filename = "file.txt", savefile = FALSE), "group column must not contain NA values")
  expect_error(save_for_interact(data, group = "gender", filename = "file.txt", savefile = FALSE), "group column must have exactly two unique values")
  data_nofirstrow <- data_twogender[-1,]
  expect_error(save_for_interact(data_nofirstrow, group = "gender", filename = "file.txt", savefile = FALSE), "each term must have values for both groups")

  ### INSTITUTION CODES
  data_noinstcodes <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "politics2003", gender == "average") %>%
    dplyr::select(-.data$instcodes)
  expect_message(expect_warning(save_for_interact(data_noinstcodes, filename = "file.txt", savefile = FALSE), "There is no column named instcodes. All terms will be given institution code 11 111111111 111, indicating all institutions."))
})

test_that("save_for_interact error handling for reformatting works", {
  ### LONG
  longdf <- epa_subset(dataset = "germany2007", gender = c("male", "female"), component = "behavior", stat = "mean")
  # longdf$instcodes <- "abcde"
  longdf_icode <- longdf
  longdf_icode$instcodes[1] <- "notthesame"

  expect_message(expect_warning(save_for_interact(longdf_icode, group = "gender", filename = "file.txt", savefile = FALSE), "Institution codes are not always the same within terms. The codes for the first group have been presented in output."))
  expect_message(expect_warning(save_for_interact(longdf, filename = "file.txt", savefile = FALSE),
               "Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. It is recommended that all terms are uniquely named."))

  longdf_dup <- epa_subset(dataset = "nc1978", gender = c("male", "female"), component = "identity", stat = "mean")
  expect_error(save_for_interact(longdf_dup, group = "gender", filename = "file.txt", savefile = FALSE),
               "Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. All terms must be uniquely named if a long dataset is provided and grouping is used.")

  ### WIDE
  widedf <- longdf %>%
    tidyr::pivot_wider(names_from = "gender", values_from = c("E", "P", "A"))
  widedf_nosuffix <- widedf
  names(widedf_nosuffix) <- gsub("(_male)|(_female)", "", names(widedf))
  expect_error(save_for_interact(widedf_nosuffix, filename = "file.txt", savefile = FALSE))

  widedf_twoidentical <- widedf
  names(widedf_twoidentical)[7] <- "E_female"
  expect_error(save_for_interact(widedf_twoidentical, filename = "file.txt", savefile = FALSE))

  widedf_dup <- widedf
  widedf_dup[408,] <- widedf[407,]
  expect_message(expect_warning(save_for_interact(widedf_dup, filename = "file.txt", savefile = FALSE),
                 "Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. It is recommended that all terms are uniquely named."))
})

test_that("save_for_interact output data frame format looks good", {
  ### LONG
  longdf <- epa_subset(dataset = "germany2007", gender = c("male", "female"), component = "behavior", stat = "mean")

  ### WIDE
  widedf <- longdf %>%
    tidyr::pivot_wider(names_from = "gender", values_from = c("E", "P", "A"))

  # out_df <- widedf %>%
  #   dplyr::select("term", "E_female", "P_female", "A_female", "E_male", "P_male", "A_male", "instcodes")

  expect_message(expect_equal(names(save_for_interact(longdf, group = "gender", filename = "file.txt", savefile = FALSE)),
                              c("term", "E_female", "P_female", "A_female", "E_male", "P_male", "A_male", "instcodes")))
  expect_message(expect_equal(names(save_for_interact(widedf, filename = "file.txt", savefile = FALSE)),
                              c("term", "E_female", "P_female", "A_female", "E_male", "P_male", "A_male", "instcodes")))
  expect_message(expect_message(expect_equal(
    save_for_interact(longdf, group = "gender", filename = "file.txt", savefile = FALSE),
    save_for_interact(widedf, filename = "file.txt", savefile = FALSE)
  )))
})








test_that("format_for_bayesact file stat and data frame type error handling works", {
  data <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "nc1978")

  expect_error(format_for_bayesact(data, stat = "not a stat"), "Invalid statistic 'not a stat' provided. Valid statistics are mean, sd, cov.")

  expect_error(format_for_bayesact(1, stat = "mean"), "data must be a tibble or data frame")
  expect_error(format_for_bayesact("notdf", stat = "sd"), "data must be a tibble or data frame")
  # TODO should we allow matrices? Can they have column names?
  expect_error(format_for_bayesact(matrix(data = 1:6, ncol = 3), stat = "cov"), "data must be a tibble or data frame")
})

test_that("format_for_bayesact error handling for column names and institution codes works", {
  data <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "politics2003",
                  gender == "average")

  ### TERM COLUMN NAMES
  names(data) <- rep("", ncol(data))
  expect_error(format_for_bayesact(data, stat = "mean"), "data must contain a column titled 'term'")

  names(data) <- c("t", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(format_for_bayesact(data, stat = "mean"), "data must contain a column titled 'term'")

  names(data) <- c("term", "term", "context", "year", "component", "gender", "E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(format_for_bayesact(data, stat = "cov"), "data must only contain one term column")


  ### EPA COLUMN NAMES
  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "no_E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(format_for_bayesact(data, stat = "mean"), "data is missing an E, P, or A column")

  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "no_A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(format_for_bayesact(data, stat = "cov"), "data is missing an E, P, or A column")

  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "E_n", "n_P", "n_A", "E_sd", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(format_for_bayesact(data, stat = "sd"), "data has too many columns starting with E, P, or A")

  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "E_n", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(format_for_bayesact(data, stat = "mean"), "data has too many columns starting with E, P, or A")

  ### TERM AND EPA COLUMN FORMAT AND TYPES
  names(data) <- c("term", "dataset", "context", "year", "component", "E", "not_E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(format_for_bayesact(data, stat = "mean"), "E, P, and A columns must be completely numeric or coercible to numeric")
  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  data_naterm <- data
  data_naterm$term[1] <- NA
  expect_error(format_for_bayesact(data_naterm, stat = "mean"), "all entries in term column must be coercible to character")


  ### INSTITUTION CODES
  data_noinstcodes <- data[,-ncol(data)] %>%
    dplyr::filter(component == "identity",
                  gender == "average")
  expect_warning(format_for_bayesact(data_noinstcodes, stat = "mean"), "There is no column named instcodes. All terms will be given institution code 11 111111111 111, indicating all institutions.")

  data_nainst <- epa_subset(dataset = "germany2007", gender = "average", component = "identity")
  data_nainst[1,"instcodes"] <- NA
  expect_warning(format_for_bayesact(data_nainst, stat = "mean"), "At least one of the institution codes is NA. NA's will be replaced with institution code 11 111111111 111, indicating all institutions.")

})

test_that("format_for_bayesact error handling for reformatting works", {
  data <- epa_subset(dataset = "usmturk2015")
  expect_warning(format_for_bayesact(data, stat = "cov"),
                 "Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. It is recommended that all terms are uniquely named.")

})

test_that("format_for_bayesact output data frame format looks good", {
  data <- epa_subset(dataset = "germany2007", component = "behavior", gender = "average")
  expect_equal(names(format_for_bayesact(data, stat = "mean")), c("term", "E", "P", "A", "E_placeholder", "P_placeholder", "A_placeholder", "instcodes"))

  data <- epa_subset(dataset = "morocco2015", component = "modifier")
  data$instcodes <- "11 111111111 111"
  expect_equal(names(format_for_bayesact(data, stat = "sd")), c("term", "E", "P", "A", "sd_E", "sd_P", "sd_A", "instcodes"))
  expect_equal(names(format_for_bayesact(data, stat = "cov")), c("term", "E", "P", "A", "cov_EE", "cov_EP", "cov_EA", "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes"))
})


