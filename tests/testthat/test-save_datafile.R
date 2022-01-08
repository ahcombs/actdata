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
  expect_warning(save_for_interact(data, filename = "file.txt"), "Some terms are duplicated. This can indicate you have not limited to one gender or dataset and have also not grouped by gender or dataset. Ensure duplicates are intentional.")


  ### INSTITUTION CODES
  data_noinstcodes <- data[,-ncol(data)] %>%
    dplyr::filter(component == "identity",
                  gender == "average")
  expect_warning(save_for_interact(data_noinstcodes, filename = "file.txt"), "There is no column named instcodes. When imported to interact, all terms will be given institution code 11 111111111 111, indicating all institutions.")
})


# unsure what this was for?
# save_for_interact(data_twogender, group = "gender", filename = "file.txt")
