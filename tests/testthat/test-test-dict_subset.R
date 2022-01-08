test_that("check_valid catches input of wrong type", {
  expect_error(check_valid(1, c("s1","s2")))
  expect_error(check_valid(TRUE, c("s1","s2")))
  expect_error(check_valid(NA, c("s1","s2")))
  expect_error(check_valid(c(1, "s1"), c("s1","s2")))
  expect_error(check_valid(c(NA, TRUE), c("s1","s2")))
})

test_that("check_valid catches input of wrong string", {
  expect_error(check_valid("a", c("s1","s2")))
  expect_error(check_valid(c("a", "s1"), c("s1","s2")))
})

test_that("check_valid returns TRUE when input is correct", {
  expect_equal(check_valid("s1", c("s1","s2")), TRUE)
  expect_equal(check_valid(c("s1", "s1"), c("s1","s2")), TRUE)
  expect_equal(check_valid(c("s1", "s2"), c("s1","s2")), TRUE)
})

test_that("get_data returns expected errors and warnings", {
  expect_error(get_data(dataset = "this is not a key"))
  expect_error(get_data(dataset = "nc1978", component = "this is not a component"))
  expect_error(get_data(dataset = "nc1978", component = "identity", gender = "this is not a gender"))
  expect_error(get_data(dataset = "nc1978", component = "identity", type = "this is not a type", gender = "male"))

  expect_warning(get_data(dataset = "uga2015", gender = "male"))
})

test_that("get_data returns expected dataset", {
  expect_s3_class(get_data(dataset = "nc1978"), "tbl_df")

  test1 <- get_data("nc1978", gender = "female", component = "modifier")
  test1_byhand <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "nc1978",
                  gender == "female",
                  component == "modifier")

  expect_identical(test1, test1_byhand)


  test2 <- get_data("nc1978", gender = "female", component = "modifier", type = "mean")
  test2_byhand <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "nc1978",
                  gender == "female",
                  component == "modifier") %>%
    dplyr::select(term:A, instcodes)

  expect_identical(test2, test2_byhand)


  test3 <- get_data("uga2015", gender = "av", component = "b", type = "cov")
  test3_byhand <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset == "uga2015",
                  gender == "average",
                  component == "behavior") %>%
    dplyr::select(term:A, instcodes, starts_with("cov"))

  expect_identical(test3, test3_byhand)

  test4 <- get_data(c("uga2015", "nc1978"), gender = c("av", "m"), component = c("i", "b"), type = "cov")
  test4_byhand <- actdata::epa_summary_statistics %>%
    dplyr::filter(dataset %in% c("uga2015", "nc1978"),
                  gender %in% c("average", "male"),
                  component %in% c("identity", "behavior")) %>%
    dplyr::select(term:A, instcodes, starts_with("cov"))

  expect_identical(test4, test4_byhand)
})
