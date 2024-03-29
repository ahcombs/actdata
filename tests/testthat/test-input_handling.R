# TODO: ANYWHERE ELSE IN THE CODE THAT IS CHECKING INPUT, USE THESE HELPER FUNCTIONS

test_that("check_dataset works", {
  expect_equal(check_dataset("indiana2003", "summary"), TRUE)
  expect_error(check_dataset("indiana2003", "individual"))
  expect_equal(check_dataset(c("nc1978", "politics2003"), "summary"), TRUE)
  expect_equal(check_dataset(c("usfullsurveyor2015", "dukestudent2015"), "individual"), TRUE)
  expect_error(check_dataset(c("usfullsurveyor2015", "indiana2003"), "individual"))
  expect_error(check_dataset(c("notakey", "germany2007"), "individual"), "Invalid dataset key 'notakey' provided for individual data. Use the dict_info\\(\\) function to see datasets available.")
  expect_error(check_dataset(c("germany2007", TRUE, "notakey"), "summary"), "Invalid dataset key 'TRUE' provided for summary data. Use the dict_info\\(\\) function to see datasets available.")
})

test_that("check_component works", {
  expect_equal(check_component("beh"), TRUE)
  expect_equal(check_component(c("m", "setting", "behaviour", "identity")), TRUE)
  expect_error(check_component("notacomponent"), "Invalid component 'notacomponent' provided. Valid components are identity, behavior, modifier, and setting.")
  expect_error(check_component(3), "Invalid component '3' provided. Valid components are identity, behavior, modifier, and setting.")
  expect_error(check_component(c("identity", TRUE)), "Invalid component 'TRUE' provided. Valid components are identity, behavior, modifier, and setting.")
})

test_that("check_group works", {
  expect_equal(check_group("male"), TRUE)
  expect_equal(check_group(c("male", "woman")), TRUE)
  expect_equal(check_group(c("m", "f", "average", "av", "a")), TRUE)
  expect_error(check_group(c("female", "notagroup")), "Invalid respondent group 'notagroup' provided. Valid groups depend on dataset.")
})

test_that("check_stat works", {
  expect_equal(check_stat("m"), TRUE)
  expect_equal(check_stat(c("mean", "covariance")), TRUE)
  expect_equal(check_stat(c("m", "c", "sd")), TRUE)
  expect_error(check_stat(c("n", "notastat")), "Invalid statistic 'notastat' provided. Valid statistics are mean, sd, cov, n.")
})

test_that("standardize_option works", {
  expect_equal(standardize_option("m", "group"), "male")
  expect_equal(standardize_option("f", "group"), "female")
  expect_equal(standardize_option("a", "group"), "all")
  expect_equal(standardize_option(c("male", "man", "woman"), "group"), c("male", "male", "female"))
  expect_equal(standardize_option("behaviour", "component"), "behavior")
  expect_equal(standardize_option(c("m", "standard deviation", 3), "stat"), c("mean", "sd", "3"))
  expect_error(standardize_option("m", "not a valid parameter"), "Invalid parameter type provided.")
})

# test_that("check_valid catches input of wrong type", {
#   expect_error(check_valid(1, c("s1","s2")))
#   expect_error(check_valid(TRUE, c("s1","s2")))
#   expect_error(check_valid(NA, c("s1","s2")))
#   expect_error(check_valid(c(1, "s1"), c("s1","s2")))
#   expect_error(check_valid(c(NA, TRUE), c("s1","s2")))
# })
#
# test_that("check_valid catches input of wrong string", {
#   expect_error(check_valid("a", c("s1","s2")))
#   expect_error(check_valid(c("a", "s1"), c("s1","s2")))
# })
#
# test_that("check_valid returns TRUE when input is correct", {
#   expect_equal(check_valid("s1", c("s1","s2")), TRUE)
#   expect_equal(check_valid(c("s1", "s1"), c("s1","s2")), TRUE)
#   expect_equal(check_valid(c("s1", "s2"), c("s1","s2")), TRUE)
# })

