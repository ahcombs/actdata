test_that("epa_subset works", {
  # tests of term, gender, and component arguments
  man_search <- actdata::epa_summary_statistics[grepl("man", actdata::epa_summary_statistics$term),]
  expect_equal(epa_subset("man"), man_search)
  expect_equal(epa_subset("man", gender = "male"), dplyr::filter(man_search, gender == "male"))
  expect_equal(epa_subset("man", gender = c("f", "av")), dplyr::filter(man_search, gender %in% c("female", "average")))
  expect_equal(epa_subset("man", component = "ident"), dplyr::filter(man_search, component == "identity"))
  expect_equal(epa_subset("man", component = c("ident", "behaviour")), dplyr::filter(man_search, component %in% c("identity", "behavior")))
  expect_equal(epa_subset("man", dataset = c("egypt2015", "nc1978")), dplyr::filter(man_search, dataset %in% c("egypt2015", "nc1978")))

  only_man_search <- actdata::epa_summary_statistics[grepl("^man$", actdata::epa_summary_statistics$term),]
  expect_equal(epa_subset("^man$"), only_man_search)

  multiple_search<- actdata::epa_summary_statistics[grepl("(man)|(dude)|(friend)", actdata::epa_summary_statistics$term),]
  expect_equal(epa_subset(c("man", "dude", "friend")), multiple_search)

  expect_equal(epa_subset(c("man", "dude", "friend"), component = c("identity", "beh"), gender = "average"),
               dplyr::filter(multiple_search, component %in% c("identity", "behavior"), gender == "average"))
  expect_equal(epa_subset(c("man", "dude", "friend"), component = "identity", gender = "average", dataset = "usmturk2015"),
               dplyr::filter(multiple_search, component == "identity", gender == "average", dataset == "usmturk2015"))

  # warning for empty result
  expect_warning(epa_subset("this is not in any dictionary"), "The search did not match any dictionary entries.")

  # search without including a term
  expect_equal(epa_subset(), actdata::epa_summary_statistics)
  expect_equal(epa_subset(component = "identity"), dplyr::filter(actdata::epa_summary_statistics, component == "identity"))

  # stats tests
  expect_equal(epa_subset(stat = "cov", stat_na_exclude = FALSE),
               dplyr::select(actdata::epa_summary_statistics, -c("E", "P", "A"), -dplyr::starts_with("n"), -dplyr::starts_with("sd")))
  expect_equal(epa_subset(stat = c("mean", "cov"), stat_na_exclude = FALSE),
               dplyr::select(actdata::epa_summary_statistics, -dplyr::starts_with("n"), -dplyr::starts_with("sd")))
  expect_equal(epa_subset(stat = c("mean", "cov"), stat_na_exclude = TRUE),
               dplyr::filter(dplyr::select(actdata::epa_summary_statistics, -dplyr::starts_with("n"), -dplyr::starts_with("sd")), if_any(dplyr::starts_with("cov"), ~!is.na(.))))
  expect_equal(epa_subset(stat = c("mean", "sd", "n", "cov"), stat_na_exclude = FALSE),
               actdata::epa_summary_statistics)

  # instcodes test
  expect_equal(epa_subset(instcodes = FALSE),
               dplyr::select(actdata::epa_summary_statistics, -instcodes))
})



# test_that("get_data returns expected errors and warnings", {
#   expect_error(get_data(dataset = "this is not a key"))
#   expect_error(get_data(dataset = "nc1978", component = "this is not a component"))
#   expect_error(get_data(dataset = "nc1978", component = "identity", gender = "this is not a gender"))
#   expect_error(get_data(dataset = "nc1978", component = "identity", type = "this is not a type", gender = "male"))
#
#   expect_warning(get_data(dataset = "uga2015", gender = "male"))
# })
#
# test_that("get_data returns expected dataset", {
#   expect_s3_class(get_data(dataset = "nc1978"), "tbl_df")
#
#   test1 <- get_data("nc1978", gender = "female", component = "modifier")
#   test1_byhand <- actdata::epa_summary_statistics %>%
#     dplyr::filter(dataset == "nc1978",
#                   gender == "female",
#                   component == "modifier")
#
#   expect_identical(test1, test1_byhand)
#
#
#   test2 <- get_data("nc1978", gender = "female", component = "modifier", type = "mean")
#   test2_byhand <- actdata::epa_summary_statistics %>%
#     dplyr::filter(dataset == "nc1978",
#                   gender == "female",
#                   component == "modifier") %>%
#     dplyr::select(term:A, instcodes)
#
#   expect_identical(test2, test2_byhand)
#
#
#   test3 <- get_data("uga2015", gender = "av", component = "b", type = "cov")
#   test3_byhand <- actdata::epa_summary_statistics %>%
#     dplyr::filter(dataset == "uga2015",
#                   gender == "average",
#                   component == "behavior") %>%
#     dplyr::select(term:A, instcodes, starts_with("cov"))
#
#   expect_identical(test3, test3_byhand)
#
#   test4 <- get_data(c("uga2015", "nc1978"), gender = c("av", "m"), component = c("i", "b"), type = "cov")
#   test4_byhand <- actdata::epa_summary_statistics %>%
#     dplyr::filter(dataset %in% c("uga2015", "nc1978"),
#                   gender %in% c("average", "male"),
#                   component %in% c("identity", "behavior")) %>%
#     dplyr::select(term:A, instcodes, starts_with("cov"))
#
#   expect_identical(test4, test4_byhand)
# })
