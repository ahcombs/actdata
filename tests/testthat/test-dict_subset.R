test_that("epa_subset works", {
  # tests of term, gender, and component arguments
  man_search <- actdata::epa_summary_statistics[grepl("man", actdata::epa_summary_statistics$term),]
  expect_equal(epa_subset("man"), man_search)
  expect_equal(epa_subset("man", gender = "male"), dplyr::filter(man_search, gender == "male"))
  expect_equal(epa_subset("man", datatype = "individual", gender = "male"), epa_subset("man", datatype = "individual"))
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
  expect_equal(epa_subset(dataset = "uga2015", component = "identity", datatype = "individual"), dplyr::filter(individual, dataset == "uga2015", component == "identity"))

  # stats tests
  expect_equal(epa_subset(stat = "cov", stat_na_exclude = FALSE),
               dplyr::select(actdata::epa_summary_statistics, -c("E", "P", "A"), -dplyr::starts_with("n"), -dplyr::starts_with("sd")))
  expect_equal(epa_subset(stat = c("mean", "cov"), stat_na_exclude = FALSE),
               dplyr::select(actdata::epa_summary_statistics, -dplyr::starts_with("n"), -dplyr::starts_with("sd")))
  expect_equal(epa_subset(stat = c("mean", "cov"), stat_na_exclude = TRUE),
               dplyr::filter(dplyr::select(actdata::epa_summary_statistics, -dplyr::starts_with("n"), -dplyr::starts_with("sd")), if_any(dplyr::starts_with("cov"), ~!is.na(.))))
  expect_equal(epa_subset(stat = c("mean", "sd", "n", "cov"), stat_na_exclude = FALSE),
               actdata::epa_summary_statistics)
  expect_equal(epa_subset(datatype = "individual", dataset = "dukecommunity2015"),
               epa_subset(datatype = "individual", dataset = "dukecommunity2015", stat = "mean"))

  # instcodes inclusion test
  expect_equal(epa_subset(instcodes = FALSE),
               dplyr::select(actdata::epa_summary_statistics, -instcodes))

  # institution codes filtering test
  b_lay <- suppressMessages(epa_subset(expr = "^b", dataset = "uga2015", institutions = "lay", stat = "mean"))
  b_pol <- epa_subset("^b", dataset = "indiana2003", institutions = "politics", stat = "mean")
  b_overt <- epa_subset("^b", dataset = "indiana2003", institutions = "overt", stat = "mean")
  b_emotion <- epa_subset("^b", dataset = "indiana2003", institutions = "emotion", stat = "mean")
  b_male_bus <- epa_subset("^b", dataset = "indiana2003", institutions = c("male", "business"), stat = "mean")
  b_lay_indiv <- suppressMessages(epa_subset(expr = "^b", dataset = "uga2015", institutions = "lay", stat = "mean", datatype = "individual"))
  b_lay_indiv_drop <- epa_subset(expr = "^b", dataset = "uga2015", institutions = "lay", stat = "mean", datatype = "individual", drop.na.instcodes = TRUE)

  b_subset <- epa_subset(expr = "^b", dataset = "uga2015", stat = "mean", datatype = "individual")
  expect_equal(is.data.frame(b_lay), TRUE)
  expect_false(nrow(b_overt) == nrow(b_pol))
  expect_equal(unique(b_overt$component), "behavior")
  expect_equal(unique(b_emotion$component), "modifier")
  expect_true(all(substr(b_male_bus$instcodes, 1, 1) == 1 | substr(b_male_bus$instcodes, 5, 5) == 1))
  expect_true(all(substr(b_lay$instcodes, 4, 4) == 1 | is.na(substr(b_lay$instcodes, 4, 4))))
  expect_true(nrow(b_lay_indiv) > nrow(b_lay))
  expect_true(nrow(b_lay_indiv) > nrow(b_lay_indiv_drop))

  # more individual data tests
  indiv <- individual %>%
    dplyr::filter(term == "genius")
  expect_error(epa_subset(datatype = "notatype"),
               "Invalid data type 'notatype' provided. Data type may be summary or individual.")
  expect_error(epa_subset(datatype = 14),
               "Invalid data type '14' provided. Data type may be summary or individual.")
  expect_true(all.equal(sort(unique(epa_subset(dataset = "usfullsurveyor2015", datatype = "individual")$dataset)),
                        sort(c("dukecommunity2015", "uga2015", "dukestudent2015"))))
  expect_true(all.equal(sort(unique(epa_subset(dataset = "usstudent2015", datatype = "individual")$dataset)),
                        sort(c("uga2015", "dukestudent2015"))))
  expect_equal(indiv, epa_subset(expr = "genius", exactmatch = TRUE, datatype = "individual"))
  expect_equal(indiv, epa_subset(expr = "genius", exactmatch = TRUE, datatype = "i"))
  expect_error(epa_subset(datatype = c("summary", "individual")), "Only one data type may be provided")
  expect_error(epa_subset(datatype = c("summary", "summary")), "Only one data type may be provided")

})


test_that("institution code conversions work", {
  # from logical to string
  expect_equal(create_instcode("identity", male = T, female = T), "11 000000000 000")
  expect_equal(create_instcode("behavior", male = T, female = T), "00 000000000 000")
  expect_equal(create_instcode("identity", male = F, female = T), "01 000000000 000")
  expect_equal(create_instcode("modifier"), "00 000000000 000")
  expect_equal(create_instcode("mod"), "00 000000000 000")
  expect_error(create_instcode("notacomponent"), "Invalid component 'notacomponent' provided. Valid components are identity, behavior, modifier, and setting.")

  # # from string to logical cols
  expect_true(is.data.frame(expand_instcodes(tibble::tibble(instcodes = "11 000000000 000", component = "identity", term = "thing"))))
  expect_equal(nrow(expand_instcodes(tibble::tibble(instcodes = "11 000000000 000", component = "identity", term = "thing"))), 1)
  expect_equal(names(expand_instcodes(tibble::tibble(instcodes = "11 000000000 000", component = "identity", term = "thing"))),
               c("instcodes", "component", "term", "male", "female", "lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual", "monadic", "group", "corporal"))
  expect_equal(names(expand_instcodes(tibble::tibble(instcodes = c("11 000000000 000", "00 111111111 000"), component = c("identity", "setting"), term = c("thing1", "thing2")))),
               c("instcodes", "component", "term", "male", "female", "place", "time", "lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual", "monadic", "group", "corporal"))
  expect_equal(names(expand_instcodes(tibble::tibble(instcodes = "11 000000000 000", component = "behavior", term = "thing"))),
               c("instcodes", "component", "term", "overt", "surmised", "lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual", "monadic", "group", "corporal"))
  expect_equal(names(expand_instcodes(tibble::tibble(instcodes = "11 000000000 000", component = "setting", term = "thing"))),
               c("instcodes", "component", "term", "place", "time", "lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual", "monadic", "group", "corporal"))
  expect_equal(names(expand_instcodes(tibble::tibble(instcodes = "11 000000000 000", component = "modifier", term = "thing"))),
               c("instcodes", "component", "term", "adjective", "adverb", "emotion", "trait", "status", "feature", "emotion_spiral"))
  expect_error(expand_instcodes(tibble::tibble(instcodes = "11 000000000", component = "modifier", term = "thing")))
  expect_error(expand_instcodes(tibble::tibble(instcodes = "11 000000000 00a", component = "modifier", term = "thing")))
  expect_error(expand_instcodes(tibble::tibble(instcodes = "11 000000000 002", component = "modifier", term = "thing")))
  expect_error(expand_instcodes(tibble::tibble(instcodes = 11000000000000, component = "modifier", term = "thing")))

})

test_that("expand_instcodes works", {
  toexpand <- epa_subset(expr = "^a", dataset = "usmturk2015", stat = "mean")

  expect_error(expand_instcodes(dplyr::select(toexpand, -component)), "Data requires a component column")
  expect_error(expand_instcodes(dplyr::select(toexpand, -term)), "Data requires a term column")
  expect_message(expand_instcodes(toexpand), "At least one of the institution codes is NA.")
  expect_message(expand_instcodes(toexpand, na.sub = TRUE), "At least one of the institution codes is NA. NA's will be replaced with institution code 11 111111111 111, indicating all institutions.")
  expect_message(expand_instcodes(toexpand, na.sub = FALSE), "At least one of the institution codes is NA. NA's will be replaced with institution code 00 000000000 000, indicating no institutions.")

  natrue <- suppressMessages(expand_instcodes(toexpand, na.sub = TRUE))
  nafalse <- suppressMessages(expand_instcodes(toexpand, na.sub = FALSE))
  nadrop <- suppressMessages(expand_instcodes(toexpand, na.sub = "drop"))
  nana <- suppressMessages(expand_instcodes(toexpand, na.sub = NA))

  expect_equal(nrow(natrue), nrow(nafalse))
  expect_equal(nrow(natrue), nrow(nana))
  expect_true(nrow(natrue) > nrow(nadrop))

  narows <- is.na(nana$instcodes)
  expect_true(all(natrue[narows, "instcodes"] == "11 111111111 111"))
  expect_true(all(nafalse[narows, "instcodes"] == "00 000000000 000"))
  expect_true(all(!is.na(nadrop$instcodes)))
})

test_that("get_eqn works", {
  expect_error(get_eqn("nc1978", equation_type = "selfdir", gender = "av"))
  expect_true(is.data.frame(get_eqn("nc1978", equation_type = "selfdir", gender = "m")))
  expect_equal(dim(get_eqn("nc1978", equation_type = "selfdir", gender = "m")), c(12, 7))
})
