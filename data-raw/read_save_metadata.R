dict_meta <- utils::read.csv("data-raw/dicts/dict_info.csv")
eqn_meta <- utils::read.csv("data-raw/eqns/eqn_info.csv")
usethis::use_data(dict_meta, eqn_meta, internal = TRUE, overwrite = TRUE)
