#' Dictionary term standardization
#'
#' This fixes spelling mistakes and standardizes choices of capitalization, spaces, etc so that terms are easily comparable across dictionaries
#' Used in the data prep script in the raw data folder
#'
#' @importFrom magrittr "%>%"
#' @importFrom stringr "str_replace"
#' @importFrom stringr "str_replace_all"
#' @importFrom dplyr "mutate"
#' @importFrom rlang .data
#'
#' @param data the dictionary dataset
#' @param key string name of the dataset
#' @param component string type of dictionary
#'
#' @return the standardized dataset
standardize_terms <- function(data, key, component = "undetermined"){
  if(component == "identities" & key %in% c("uga2015", "usfullsurveyor2015", "usmturk2015", "usstudent2015", "indiana2003")){
    data <- data %>%
      dplyr::mutate(term = str_replace(.data$term, "divorc[e\\u00e9][e\\u00e9]", "divorcee (female)"),
                    term = str_replace(.data$term, "divorc[e\\u00e9](?![_e\\u00e9 ])", "divorcee (male)"))
  } else if (component == "identities") {
    data <- data %>%
      dplyr::mutate(term = str_replace(.data$term, "divorcee", "divorcee (gender neutral)"))
  } else if (component == "undetermined"){
    # this applies to the individual level data where all terms are mixed together. We need to extract the component from the term ID
    # most terms have an indicator on the front followed by an underscore (ie, i_firefighter)
    # in the Egypt dictionary, some do not and instead they have some other code that I don't understand for term ID (ie, mi29)
    data <- data %>%
      dplyr::mutate(
        component = dplyr::case_when(
          grepl("^i_", term) == TRUE ~ "identity",
          grepl("^b_", term) == TRUE ~ "behavior",
          grepl("^s_", term) == TRUE ~ "setting",
          grepl("^m_", term) == TRUE ~ "modifier",
          TRUE ~ NA_character_
        )
      )
  }

  data_clean <- data %>%
    dplyr::mutate(
      term_new = str_replace(.data$term, "^A?n?i?b?m?s?_", ""),
      term_new = str_replace_all(.data$term_new, "(?<!\\.)(?<![[:upper:]])(?=[[:upper:]])", " "),
      term_new = str_replace_all(.data$term_new, "[_-]", " "),
      term_new = stringr::str_squish(.data$term_new),
      term_new = tolower(.data$term_new),
      term_new = str_replace_all(.data$term_new, "[\\s-]", "_"),
      term_new = str_replace_all(.data$term_new, "\\(_", "\\("),

      # identities
      term_new = str_replace(.data$term_new, '^adultress$', "adulteress"),
      term_new = str_replace(.data$term_new, '^adviser$', "advisor"),
      term_new = str_replace(.data$term_new, '^baby_sitter$', "babysitter"),
      term_new = str_replace(.data$term_new, '^bigbrother$', "big_brother"),
      term_new = str_replace(.data$term_new, '^bigsister$', "big_sister"),
      term_new = str_replace(.data$term_new, '^bigshot$', "big_shot"),
      term_new = str_replace(.data$term_new, '^boyscout$', "boy_scout"),
      term_new = str_replace(.data$term_new, '^bureacrat$', "bureaucrat"),
      term_new = str_replace(.data$term_new, '^bureacracy$', "bureaucracy"),
      term_new = str_replace(.data$term_new, '^busdriver$', "bus_driver"),
      term_new = str_replace(.data$term_new, '^callgirl$', "call_girl"),
      term_new = str_replace(.data$term_new, '^chaperon$', "chaperone"),
      term_new = str_replace(.data$term_new, '^chief_justice_sup_court$', "chief_justice_of_the_supreme_court"),
      term_new = str_replace(.data$term_new, 'computerexpert', "computer_expert"),
      term_new = str_replace(.data$term_new, '^demogogue$', "demagogue"),
      term_new = str_replace(.data$term_new, '^dicatator$', "dictator"),
      term_new = str_replace(.data$term_new, '^dietitican$', "dietitian"),
      term_new = str_replace(.data$term_new, '^end_football$', "end_(football)"),
      term_new = str_replace(.data$term_new, '^end_(football_player)$', "end_(football)"),
      term_new = str_replace(.data$term_new, '^father_my$', "father_(my)"),
      term_new = str_replace(.data$term_new, "^fianc[e\\u00e9]$", "fiance_(male)"),
      term_new = str_replace(.data$term_new, "^fianc[e\\u00e9][e\\u00e9]$", "fiancee_(female)"),
      term_new = str_replace(.data$term_new, '^greatgrandfather$', "great_grandfather"),
      term_new = str_replace(.data$term_new, '^greatgrandmother$', "great_grandmother"),
      term_new = str_replace(.data$term_new, '^grownup$', "grown_up"),
      term_new = str_replace(.data$term_new, '^guard_football$', "guard_(football)"),
      term_new = str_replace(.data$term_new, '^househusband$', "house_husband"),
      term_new = str_replace(.data$term_new, '^houseguest$', "house_guest"),
      term_new = str_replace(.data$term_new, '^illigitimate_child$', "illegitimate_child"),
      term_new = str_replace(.data$term_new, '^justice_supreme_court$', "justice_of_the_supreme_court"),
      term_new = str_replace(.data$term_new, '^ladykiller$', "lady_killer"),
      term_new = str_replace(.data$term_new, '^lawbreaker$', "law_breaker"),
      term_new = str_replace(.data$term_new, '^lieutenant_govenor$', "lieutenant_governor"),
      term_new = str_replace(.data$term_new, '^loanshark$', "loan_shark"),
      term_new = str_replace(.data$term_new, '^lookout$', "look_out"),
      term_new = str_replace(.data$term_new, '^mother_in_law_maternal$', "mother_in_law_(maternal)"),
      term_new = str_replace(.data$term_new, '^nephewson_of_brother$', "nephew_(son_of_brother)"),
      term_new = str_replace(.data$term_new, '^nephew(sonofbrother)$', "nephew_(son_of_brother)"),
      term_new = str_replace(.data$term_new, '^nephewson_of_sister$', "nephew_(son_of_sister)"),
      term_new = str_replace(.data$term_new, '^nephew(sonofsister)$', "nephew_(son_of_sister)"),
      term_new = str_replace(.data$term_new, '^nephewsonofbrother$', "nephew_(son_of_brother)"),
      term_new = str_replace(.data$term_new, '^nephewsonofsister$', "nephew_(son_of_sister)"),
      term_new = str_replace(.data$term_new, '^niecedaughter_of_brother$', "niece_(daughter_of_brother)"),
      term_new = str_replace(.data$term_new, '^niece(daughterofbrother)$', "niece_(daughter_of_brother)"),
      term_new = str_replace(.data$term_new, '^niecedaughter_of_sister$', "niece_(daughter_of_sister)"),
      term_new = str_replace(.data$term_new, '^niece(daughterofsister)$', "niece_(daughter_of_sister)"),
      term_new = str_replace(.data$term_new, '^niecedaughterofbrother$', "niece_(daughter_of_brother)"),
      term_new = str_replace(.data$term_new, '^niecedaughterofsister$', "niece_(daughter_of_sister)"),
      term_new = str_replace(.data$term_new, '^nightwatchman$', "night_watchman"),
      term_new = str_replace(.data$term_new, '^nonsmoker$', "non_smoker"),
      term_new = str_replace(.data$term_new, '^oldgeezer$', "old_geezer"),
      term_new = str_replace(.data$term_new, '^oldman$', "old_man"),
      term_new = str_replace(.data$term_new, '^oldtimer$', "old_timer"),
      term_new = str_replace(.data$term_new, '^passerby$', "passer_by"),
      term_new = str_replace(.data$term_new, '^penticostal$', "pentecostal"),
      term_new = str_replace(.data$term_new, '^pornostar$', "porno_star"),
      term_new = str_replace(.data$term_new, '^receptionistf$', "receptionist_(female)"),
      term_new = str_replace(.data$term_new, '^receptionist(f)$', "receptionist_(female)"),
      term_new = str_replace(.data$term_new, '^receptionistm$', "receptionist_(male)"),
      term_new = str_replace(.data$term_new, '^receptionist(m)$', "receptionist_(male)"),
      term_new = str_replace(.data$term_new, '^rolemodel$', "role_model"),
      term_new = str_replace(.data$term_new, '^righthand_man$', "right_hand_man"),
      term_new = str_replace(.data$term_new, '^room_mate$', "roommate"),
      term_new = str_replace(.data$term_new, '^salesclerk$', "sales_clerk"),
      term_new = str_replace(.data$term_new, '^sap_head$', "saphead"),
      term_new = str_replace(.data$term_new, '^secretaryf$', "secretary_(female)"),
      term_new = str_replace(.data$term_new, '^secretary(f)$', "secretary_(female)"),
      term_new = str_replace(.data$term_new, '^secretarym$', "secretary_(male)"),
      term_new = str_replace(.data$term_new, '^secretary(m)$', "secretary_(male)"),
      term_new = str_replace(.data$term_new, '^sickperson$', "sick_person"),
      term_new = str_replace(.data$term_new, '^slavedriver$', "slave_driver"),
      term_new = str_replace(.data$term_new, '^smartaleck$', "smart_aleck"),
      term_new = str_replace(.data$term_new, '^soulmate$', "soul_mate"),
      term_new = str_replace(.data$term_new, '^stoolpigeon$', "stool_pigeon"),
      term_new = str_replace(.data$term_new, '^strikeleader$', "strike_leader"),
      # term_new = str_replace(.data$term_new, '^sweetheart_(female)$', "sweetheart_(male)"),
      term_new = str_replace(.data$term_new, '^sweetheart(f)$', "sweetheart_(female)"),
      term_new = str_replace(.data$term_new, '^sweetheart(m)$', "sweetheart_(male)"),
      term_new = str_replace(.data$term_new, '^sweetheartf$', "sweetheart_(female)"),
      term_new = str_replace(.data$term_new, '^sweetheartm$', "sweetheart_(male)"),
      term_new = str_replace(.data$term_new, '^taxidriver$', "taxi_driver"),
      term_new = str_replace(.data$term_new, '^teacher_of_deaf$', "teacher_(of_deaf)"),
      term_new = str_replace(.data$term_new, '^truelove$', "true_love"),
      term_new = str_replace(.data$term_new, '^ukranian$', "ukrainian"),
      term_new = str_replace(.data$term_new, '^unemployedperson$', "unemployed_person"),
      term_new = str_replace(.data$term_new, '^whizkid$', "whiz_kid"),
      term_new = str_replace(.data$term_new, '^youth(m)$', "youth_(male)"),
      term_new = str_replace(.data$term_new, '^youth(f)$', "youth_(female)"),
      term_new = str_replace(.data$term_new, '^youthm$', "youth_(male)"),
      term_new = str_replace(.data$term_new, '^youthf$', "youth_(female)"),

      # behaviors
      term_new = str_replace(.data$term_new, '^complainto$', "complain_to"),
      term_new = str_replace(.data$term_new, '^crossexamine$', "cross_examine"),
      term_new = str_replace(.data$term_new, '^dickerwith$', "dicker_with"),
      term_new = str_replace(.data$term_new, '^doublecross$', "double_cross"),
      term_new = str_replace(.data$term_new, '^freakout$', 'freak_out'),
      term_new = str_replace(.data$term_new, '^have_heart_to_heart_talk_with$', "have_a_heart_to_heart_talk_with"),
      term_new = str_replace(.data$term_new, '^humour$', 'humor'),
      term_new = str_replace(.data$term_new, '^snear_at$', "sneer_at"),

      # mods
      term_new = str_replace(.data$term_new, '^absentminded$', 'absent_minded'),
      term_new = str_replace(.data$term_new, '^abusive_physically$', "abusive_(physically)"),
      term_new = str_replace(.data$term_new, '^abusive_verbally$', "abusive_(verbally)"),
      term_new = str_replace(.data$term_new, '^letdown$', 'let_down'),
      term_new = str_replace(.data$term_new, '^lighthearted$', 'light_hearted'),
      term_new = str_replace(.data$term_new, '^middleaged$', 'middle_aged'),
      term_new = str_replace(.data$term_new, '^middleclass$', 'middle_class'),
      term_new = str_replace(.data$term_new, '^narrowminded$', 'narrow_minded'),
      term_new = str_replace(.data$term_new, '^obstinant$', 'obstinate'),
      term_new = str_replace(.data$term_new, '^oldfashioned$', 'old_fashioned'),
      term_new = str_replace(.data$term_new, '^openminded$', 'open_minded'),
      term_new = str_replace(.data$term_new, '^selfassured$', 'self_assured'),
      term_new = str_replace(.data$term_new, '^softspoken$', 'soft_spoken'),
      term_new = str_replace(.data$term_new, '^wishywashy$', 'wishy_washy'),

      # settings
      term_new = str_replace(.data$term_new, '^airraid$', 'air_raid'),
      term_new = str_replace(.data$term_new, "^april_fools'_day$", 'april_fools_day'),
      term_new = str_replace(.data$term_new, '^ballgame$', 'ball_game'),
      term_new = str_replace(.data$term_new, '^fleamarket$', 'flea_market'),
      term_new = str_replace(.data$term_new, '^hide_out$', 'hideout'),
      term_new = str_replace(.data$term_new, '^kindergarden$', 'kindergarten'),
      term_new = str_replace(.data$term_new, "^lawyer's_office$", 'lawyers_office'),
      term_new = str_replace(.data$term_new, "^new_years'_eve$", "new_year's_eve"),
      term_new = str_replace(.data$term_new, '^peniteniary$', 'penitentiary'),
      term_new = str_replace(.data$term_new, '^petstore$', 'pet_store'),

      # remove parentheses and single and double quotes -- interact does not accept them
      term_new = str_replace_all(.data$term_new, "\\(", ""),
      term_new = str_replace_all(.data$term_new, "'", ""),
      term_new = str_replace_all(.data$term_new, '"', "")
    ) %>%
    dplyr::select(-.data$term) %>%
    dplyr::rename(term = .data$term_new) %>%
    dplyr::select(.data$term, tidyselect::everything())

  # drop the encoding issues and the modifiers from the cov and sd datasets
  if(component == 'identities' & key == 'uga2015bayesactsubset'){
    data_clean <- data_clean %>%
      dplyr::filter(!grepl("^divor.{,7}$", .data$term)) %>%
      dplyr::filter(!grepl("^fian", .data$term)) %>%
      dplyr::filter(!grepl("blackm|educatedm|elderlym|employedm|femalem|lower_classm|malem|middle_agedm|middle_classm|oldm$|poorm|richm|uneducatedm|unemployedm|wealthym|whitem|youngm", .data$term))
  }

  return(data_clean)
}



utils::globalVariables("where")

#' epa_summary
#'
#' Calculates the mean, standard deviation, and variance-covariance matrix for each term in one of the included individual datasets. This is useful when a user wants summary EPA information for a subset of respondents, for example, when comparing cultural meaning across groups.
#'
#' @param data individual level data
#'
#' @return a summary dataset with one row per term. Includes the evaluation, potency, and activity mean, standard deviation, and variance-covariance matrix entries for each term.
#' @export
#'
epa_summary <- function(data){
  if(!("term" %in% names(data))){
    stop(message = "data must have a column named 'term'")
  }
  trim_data <- data %>%
    dplyr::select("term", "component", "E", "P", "A")

  trim_data <- trim_data %>%
    mutate(tcid = paste(.data$term, .data$component, sep = ""))

  sum_data <- trim_data %>%
    dplyr::mutate(dplyr::across(c(-.data$term, -.data$component, -.data$tcid), as.numeric)) %>%
    dplyr::group_by(.data$term, .data$component, .data$tcid) %>%
    dplyr::summarize(
      # TODO: what's the deal with the zeros? skips? Do all datasets have a lot of zeros?
      n_E = sum(!is.na(.data$E)),
      n_P = sum(!is.na(.data$P)),
      n_A = sum(!is.na(.data$A)),
      mean_E = mean(.data$E, na.rm = TRUE),
      mean_P = mean(.data$P, na.rm = TRUE),
      mean_A = mean(.data$A, na.rm = TRUE),
      sd_E = ifelse(.data$n_E > 1, stats::sd(.data$E, na.rm = TRUE), NA),
      sd_P = ifelse(.data$n_P > 1, stats::sd(.data$P, na.rm = TRUE), NA),
      sd_A = ifelse(.data$n_A > 1, stats::sd(.data$A, na.rm = TRUE), NA)) %>%
    dplyr::ungroup()

  # ADD COV
  # Calculate a separate covariance matrix for each term, and input the values into the dataframe above.
  alltcid <- unique(sum_data$tcid)
  covars <- data.frame(matrix(nrow = 0, ncol = 10))
  names(covars) <- c("term", "cov_EE", "cov_EP", "cov_EA", "cov_PE", "cov_PP", "cov_PA", "cov_AE", "cov_AP", "cov_AA")
  for(t in alltcid){
    subset <- trim_data[trim_data$tcid == t,] %>%
      dplyr::select("E", "P", "A") %>%
      dplyr::mutate(dplyr::across(dplyr::everything(), as.numeric))

    nE <- sum_data[sum_data$tcid == t, "n_E"][[1]]
    nP <- sum_data[sum_data$tcid == t, "n_P"][[1]]
    nA <- sum_data[sum_data$tcid == t, "n_A"][[1]]

    # check how to handle missing values here--right now we are going to listwise delete.
    # There is also a pairwise option but it sounds more complicated.
    # Really, we don't need to include all 9 values here; 3 should be repeated.
    # Also, the diagonals should be the square of the sd values--there's an argument for keeping this in anyway though if we want to report var and sd (but do we need sd?)
    # TODO: Remove once tested
    if(nE > 0 & nP > 0 & nA > 0){
      covarmat <- stats::cov(subset, use = "complete.obs") # 3x3 mat
      covarvec <- data.frame(tcid = t,
                             cov_EE = ifelse(nE > 1, covarmat[1, 1], NA),
                             cov_EP = ifelse(nE > 1 & nP > 1, covarmat[1, 2], NA),
                             cov_EA = ifelse(nE > 1 & nA > 1, covarmat[1, 3], NA),
                             cov_PE = ifelse(nP > 1 & nE > 1, covarmat[2, 1], NA),
                             cov_PP = ifelse(nP > 1, covarmat[2, 2], NA),
                             cov_PA = ifelse(nP > 1 & nA > 1, covarmat[2, 3], NA),
                             cov_AE = ifelse(nA > 1 & nE > 1, covarmat[3, 1], NA),
                             cov_AP = ifelse(nA > 1 & nP > 1, covarmat[3, 2], NA),
                             cov_AA = ifelse(nA > 1,covarmat[3, 3], NA))
    } else {
      covarvec <- data.frame(tcid = t,
                             cov_EE = NA,
                             cov_EP = NA,
                             cov_EA = NA,
                             cov_PE = NA,
                             cov_PP = NA,
                             cov_PA = NA,
                             cov_AE = NA,
                             cov_AP = NA,
                             cov_AA = NA)
    }

    covars <- rbind(covars, covarvec)
  }

  sum_data <- dplyr::left_join(sum_data, covars, by = "tcid") %>%
    dplyr::select(-.data$tcid) %>%
    # round to the nearest .01
    dplyr::mutate(
      dplyr::across(
        where(is.numeric),
        ~round(.,2)
      )
    )
  return(sum_data)
}


#' Save data files
#'
#' Adapted from https://stackoverflow.com/questions/21248065/r-rename-r-object-while-save-ing-it : see Marco Wirthlin's answer
#'
#' @param ... data object
#' @param name desired object name (filename without type and extension)
#' @param type data type (dict or eqn)
saveit <- function(..., name, type = NA) {
  if(is.na(type)){
    if(is.element(TRUE, grepl("identities", name)) |
       is.element(TRUE, grepl("behaviors", name)) |
       is.element(TRUE, grepl("mods", name)) |
       is.element(TRUE, grepl("settings", name)) |
       is.element(TRUE, grepl("emotions", name))) {
      type <- "dict"
    } else if (is.element(TRUE, grepl("emotionid", name)) |
               is.element(TRUE, grepl("impressionabo", name)) |
               is.element(TRUE, grepl("selfdir", name)) |
               is.element(TRUE, grepl("traitid", name))){
      type <- "eqn"
    }
  }

  if(!(type %in% c("dict", "eqn"))){
    stop("Specify dataset type as dict or eqn")
  }

  # this does the .rda files
  x <- list(...)
  names(x) <- paste0(name, "_", type)
  save(list=names(x), file=paste0("data/", name, "_", type, ".rda"), envir=list2env(x), compress = "gzip")

  # # this does the csvs/.dat files
  # if(type == "dict"){
  #   write.csv(..., paste0("inst/extdata/", name, "_", type, ".csv"))
  # } else {
  #   write.table(..., file = paste0("inst/extdata/", name, "_", type, ".dat"), quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")
  # }
}

