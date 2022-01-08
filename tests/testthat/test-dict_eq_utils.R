# TODO FINISH TESTS FOR THESE FUNCTIONS
# ALSO: ANYWHERE ELSE IN THE CODE WHERE I AM CHECKING USER INPUT, CHANGE TO THESE HELPER FUNCTIONS

test_that("search_dict works", {
  expect_equal(2 * 2, 4)
})

test_that("check_key works", {
  expect_equal(2 * 2, 4)
})

test_that("check_component works", {
  expect_equal(2 * 2, 4)
})

test_that("check_gender works", {
  expect_equal(2 * 2, 4)
})

test_that("standardize_option works", {
  expect_equal(standardize_option("m", "gender"), "male")
  expect_equal(standardize_option("f", "gender"), "female")
  expect_equal(standardize_option("a", "gender"), "average")
  expect_equal(standardize_option(c("male", "man", "woman"), "gender"), c("male", "male", "female"))
  expect_equal(standardize_option("behaviour", "component"), "behavior")
  expect_equal(standardize_option(c("m", "standard deviation", 3), "stat"), c("mean", "sd", "3"))
  expect_error(standardize_option("m", "not a valid parameter"), "Invalid parameter type provided.")
})

