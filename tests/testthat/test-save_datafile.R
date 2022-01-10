test_that("file name and type and data frame type error handling works", {
  data <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "nc1978")

  expect_error(save_for_interact(data, filename = 1), "File name must be a string.")
  expect_error(save_for_interact(data, filename = c("file1", "file2")), "Must provide a single file name.")
  expect_error(save_for_interact(data, filename = "file1"), "Invalid file extension. Extension .txt required.")
  expect_error(save_for_interact(data, filename = "file1.xls"), "Invalid file extension. Extension .txt required.")

  expect_error(save_for_interact(data, type = "invalidtype", filename = "file1.txt"), "Invalid data type. Must be 'dict' or 'eqn'.")

  expect_error(save_for_interact(1, filename = "file1.txt"), "data must be a tibble or data frame")
  expect_error(save_for_interact("notdf", filename = "file1.txt"), "data must be a tibble or data frame")
  expect_error(save_for_interact(matrix(data = 1:6, ncol = 3), filename = "file1.txt"), "data must be a tibble or data frame")
})

test_that("error handling for column names and institution codes works", {
  data <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "indiana2003")

  data_twogender <- data %>%
    dplyr::filter(gender %in% c("male", "average"))

  ### TERM COLUMN NAMES
  names(data) <- rep("", ncol(data))
  expect_error(save_for_interact(data, filename = "file.txt"), "data must contain a column titled 'term'")

  names(data) <- c("t", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt"), "data must contain a column titled 'term'")

  names(data) <- c("term", "term", "context", "year", "component", "gender", "E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt"), "data must only contain one term column")


  ### EPA COLUMN NAMES
  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "no_E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt"), "data is missing an E, P, or A column")

  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "no_A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt"), "data is missing an E, P, or A column")

  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "E_n", "n_P", "n_A", "E_sd", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt"), "data has too many columns starting with E, P, or A")

  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "E_n", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt"), "data must have either one each or two each of E, P, and A columns")

  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "E_n", "P_n", "A_n", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, group = "gender", filename = "file.txt"), "cannot provide both multiple E, P, and A columns and a group column")

  ### TERM AND EPA COLUMN FORMAT AND TYPES
  names(data) <- c("term", "dataset", "context", "year", "component", "E", "not_E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  expect_error(save_for_interact(data, filename = "file.txt"), "E, P, or A column must be completely numeric or coercible to numeric")
  names(data) <- c("term", "dataset", "context", "year", "component", "gender", "E", "P", "A",
                   "n_E", "n_P", "n_A", "sd_E", "sd_P", "sd_A", "cov_EE", "cov_EP", "cov_EA",
                   "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA", "instcodes")
  data_naterm <- data
  data_naterm$term[1] <- NA
  expect_error(save_for_interact(data_naterm, filename = "file.txt"), "all entries in term column must be coercible to character")

  ### GROUP
  expect_error(save_for_interact(data, group = c("gender", "dataset"), filename = "file.txt"), "only one grouping column can be provided")
  expect_error(save_for_interact(data, group = "notvalid", filename = "file.txt"), "group column does not exist")
  data_nagroup <- data
  data_nagroup$gender[1] <- NA
  expect_error(save_for_interact(data_nagroup, group = "gender", filename = "file.txt"), "group column must not contain NA values")
  expect_error(save_for_interact(data, group = "gender", filename = "file.txt"), "group column must have exactly two unique values")
  data_nofirstrow <- data_twogender[-1,]
  expect_error(save_for_interact(data_nofirstrow, group = "gender", filename = "file.txt"), "each term must have values for both groups")
  expect_warning(save_for_interact(data, filename = "file.txt"),
                 "Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. It is recommended that all terms are uniquely named.")


  ### INSTITUTION CODES
  data_noinstcodes <- data[,-ncol(data)] %>%
    dplyr::filter(component == "identity",
                  gender == "average")
  expect_warning(save_for_interact(data_noinstcodes, filename = "file.txt"), "There is no column named instcodes. All terms will be given institution code 11 111111111 111, indicating all institutions.")
})

test_that("error handling for reformatting works", {
  ### LONG
  longdf <- epa_subset(dataset = "germany2007", gender = c("male", "female"), component = "behavior", stat = "mean")
  # longdf$instcodes <- "abcde"
  longdf_icode <- longdf
  longdf_icode$instcodes[1] <- "notthesame"

  expect_warning(save_for_interact(longdf_icode, group = "gender", filename = "file.txt"), "Institution codes are not always the same within terms. The codes for the first group have been presented in output.")
  expect_warning(save_for_interact(longdf, filename = "file.txt"),
               "Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. It is recommended that all terms are uniquely named.")

  longdf_dup <- epa_subset(dataset = "nc1978", gender = c("male", "female"), component = "identity", stat = "mean")
  expect_error(save_for_interact(longdf_dup, group = "gender", filename = "file.txt"),
               "Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. All terms must be uniquely named if a long dataset is provided and grouping is used.")

  ### WIDE
  widedf <- longdf %>%
    tidyr::pivot_wider(names_from = "gender", values_from = c("E", "P", "A"))
  widedf_nosuffix <- widedf
  names(widedf_nosuffix) <- gsub("(_male)|(_female)", "", names(widedf))
  expect_error(save_for_interact(widedf_nosuffix, filename = "file.txt"), "Names of E, P, and A columns must have exactly two unique suffixes denoting two groups")

  widedf_twoidentical <- widedf
  names(widedf_twoidentical)[7] <- "E_female"
  expect_error(save_for_interact(widedf_twoidentical, filename = "file.txt", "Two or more of the E, P, and A columns are named identically."))

  widedf_dup <- widedf
  widedf_dup[408,] <- widedf[407,]
  expect_warning(save_for_interact(widedf_dup, filename = "file.txt"),
                 "Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Some datasets contain duplicate terms within the same gender and component. It is recommended that all terms are uniquely named.")
})

test_that("output data frame format looks good", {
  ### LONG
  longdf <- epa_subset(dataset = "germany2007", gender = c("male", "female"), component = "behavior", stat = "mean")

  ### WIDE
  widedf <- longdf %>%
    tidyr::pivot_wider(names_from = "gender", values_from = c("E", "P", "A"))

  out_df <- widedf %>%
    dplyr::select("term", "E_female", "P_female", "A_female", "E_male", "P_male", "A_male", "instcodes")

  expect_equal(save_for_interact(longdf, group = "gender", filename = "file.txt"), out_df)
  expect_equal(save_for_interact(widedf, filename = "file.txt"), out_df)
})
