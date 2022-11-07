dict_meta <- utils::read.csv("data-raw/dicts/dict_info.csv")
eqn_meta <- utils::read.csv("data-raw/eqns/eqn_info.csv")
occsterms <- utils::read.csv2("data-raw/dicts/occsterms.csv", sep = ",", header = TRUE)

# this saves some institution code information that can be used by other functions in subset.R

# are the monadic, group, and corporal categories meaningful for identities? Heise and Boyle seem to disagree.
# through this, I am following the "export" section in the interact PDF manual. I have verified it in spots.

inst_nine <- c("lay", "business", "law", "politics", "academe", "medicine", "religion", "family", "sexual")
inst_group <- c("monadic", "group", "corporal")
inst_first_identity <- c("male", "female")
inst_first_behavior <- c("overt", "surmised")
inst_first_setting <- c("place", "time")

inst_identity <- c("male", "female", inst_nine, inst_group)
inst_behavior <- c("overt", "surmised", inst_nine, inst_group)
inst_setting <- c("place", "time", inst_nine, inst_group)
inst_modifier <- c("adjective", "adverb", "emotion", "trait", "status", "feature", "emotion_spiral")

inst_all <- c(inst_first_identity, inst_first_behavior, inst_first_setting, inst_nine, inst_group, inst_modifier)

usethis::use_data(inst_nine, inst_group,
                  inst_first_behavior, inst_first_identity, inst_first_setting,
                  inst_identity, inst_behavior, inst_setting, inst_modifier,
                  inst_all,
                  dict_meta, eqn_meta,
                  occsterms,
                  internal = TRUE, overwrite = TRUE)
