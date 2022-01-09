
# ALSO: ANYWHERE ELSE IN THE CODE WHERE I AM CHECKING USER INPUT, CHANGE TO THESE HELPER FUNCTIONS

test_that("search_dict works", {
  # tests of term, gender, and component arguments
  man_search <- actdata::epa_summary_statistics[grepl("man", actdata::epa_summary_statistics$term),]
  expect_equal(search_dict("man"), man_search)
  expect_equal(search_dict("man", gender = "male"), dplyr::filter(man_search, gender == "male"))
  expect_equal(search_dict("man", gender = c("f", "av")), dplyr::filter(man_search, gender %in% c("female", "average")))
  expect_equal(search_dict("man", component = "ident"), dplyr::filter(man_search, component == "identity"))
  expect_equal(search_dict("man", component = c("ident", "behaviour")), dplyr::filter(man_search, component %in% c("identity", "behavior")))
  expect_equal(search_dict("man", dataset = c("egypt2015", "nc1978")), dplyr::filter(man_search, dataset %in% c("egypt2015", "nc1978")))

  only_man_search <- actdata::epa_summary_statistics[grepl("^man$", actdata::epa_summary_statistics$term),]
  expect_equal(search_dict("^man$"), only_man_search)

  multiple_search<- actdata::epa_summary_statistics[grepl("(man)|(dude)|(friend)", actdata::epa_summary_statistics$term),]
  expect_equal(search_dict(c("man", "dude", "friend")), multiple_search)

  expect_equal(search_dict(c("man", "dude", "friend"), component = c("identity", "beh"), gender = "average"),
               dplyr::filter(multiple_search, component %in% c("identity", "behavior"), gender == "average"))
  expect_equal(search_dict(c("man", "dude", "friend"), component = "identity", gender = "average", dataset = "usmturk2015"),
               dplyr::filter(multiple_search, component == "identity", gender == "average", dataset == "usmturk2015"))

  # warning for empty result
  expect_warning(search_dict("this is not in any dictionary"), "The search did not match any dictionary entries.")

  # search without including a term
  expect_equal(search_dict(), actdata::epa_summary_statistics)
  expect_equal(search_dict(component = "identity"), dplyr::filter(actdata::epa_summary_statistics, component == "identity"))

  # stats tests
  expect_equal(search_dict(stat = "cov", stat_na_exclude = FALSE),
               dplyr::select(actdata::epa_summary_statistics, -c("E", "P", "A"), -dplyr::starts_with("n"), -dplyr::starts_with("sd")))
  expect_equal(search_dict(stat = c("mean", "cov"), stat_na_exclude = FALSE),
               dplyr::select(actdata::epa_summary_statistics, -dplyr::starts_with("n"), -dplyr::starts_with("sd")))
  expect_equal(search_dict(stat = c("mean", "cov"), stat_na_exclude = TRUE),
               dplyr::filter(dplyr::select(actdata::epa_summary_statistics, -dplyr::starts_with("n"), -dplyr::starts_with("sd")), if_any(dplyr::starts_with("cov"), ~!is.na(.))))
  expect_equal(search_dict(stat = c("mean", "sd", "n", "cov"), stat_na_exclude = FALSE),
               actdata::epa_summary_statistics)

  # instcodes test
  expect_equal(search_dict(instcodes = FALSE),
               dplyr::select(actdata::epa_summary_statistics, -instcodes))
})

test_that("check_dataset works", {
  expect_equal(check_dataset("indiana2003"), TRUE)
  expect_equal(check_dataset(c("nc1978", "politics2003")), TRUE)
  expect_error(check_dataset(c("germany2007", "notakey")), "Invalid dataset key 'notakey' provided. Use the dict_info\\(\\) function to see datasets available.")
  expect_error(check_dataset(c("germany2007", TRUE, "notakey")), "Invalid dataset key 'TRUE' provided. Use the dict_info\\(\\) function to see datasets available.")
})

test_that("check_component works", {
  expect_equal(check_component("beh"), TRUE)
  expect_equal(check_component(c("m", "setting", "behaviour", "identity")), TRUE)
  expect_error(check_component("notacomponent"), "Invalid component 'notacomponent' provided. Valid components are identity, behavior, modifier, and setting.")
  expect_error(check_component(3), "Invalid component '3' provided. Valid components are identity, behavior, modifier, and setting.")
  expect_error(check_component(c("identity", TRUE)), "Invalid component 'TRUE' provided. Valid components are identity, behavior, modifier, and setting.")
})

test_that("check_gender works", {
  expect_equal(check_gender("male"), TRUE)
  expect_equal(check_gender(c("male", "woman")), TRUE)
  expect_equal(check_gender(c("m", "f", "average", "av", "a")), TRUE)
  expect_error(check_gender(c("female", "notagender")), "Invalid gender 'notagender' provided. Valid genders are average, female, and male.")
})

test_that("check_stat works", {
  expect_equal(check_stat("m"), TRUE)
  expect_equal(check_stat(c("mean", "covariance")), TRUE)
  expect_equal(check_stat(c("m", "c", "sd")), TRUE)
  expect_error(check_stat(c("n", "notastat")), "Invalid statistic 'notastat' provided. Valid statistics are mean, sd, cov, and n.")
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

