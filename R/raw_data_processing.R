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
#' @keywords internal
standardize_terms <- function(data, key, component = "undetermined"){
  if(
    component == "identities" & key %in% c("uga2015", "usfullsurveyor2015", "usmturk2015", "usstudent2015", "indiana2003")
  ){
    data <- data %>%
      dplyr::mutate(term = str_replace(.data$term, "divorc[e\\u00e9][e\\u00e9]", "divorcee (female)"),
                    term = str_replace(.data$term, "divorc[e\\u00e9](?![_e\\u00e9 ])", "divorcee (male)"))
  } else if (component == "undetermined" & key %in% c("calcutta")){
    data <- data %>%
      dplyr::mutate(term = str_replace(.data$term, "i_divorc[\\ufffd]e", "i_divorcee (female)"),
                    term = str_replace(.data$term, "i_divorc[\\ufffd](?![_e\\u00e9 ])", "i_divorcee (male)"))
  } else if (component == "identities") {
    data <- data %>%
      dplyr::mutate(term = str_replace(.data$term, "divorcee", "divorcee (gender neutral)"))
  }

  if (component == "undetermined" &
      !(grepl("generaltech", key) | grepl("employeeorg", key) | grepl("ugatech", key) |
        grepl("groups", key) | grepl("nounphrasegrammar", key) | grepl("techvshuman", key) |
        grepl("mostafavi", key))){
    # this applies to the individual level data where all terms are mixed together. We need to extract the component from the term ID
    # most terms have an indicator on the front followed by an underscore (ie, i_firefighter)
    # in the Egypt and Morocco dictionaries, some do not and instead they have some other code that I don't understand for term ID (ie, mi29)
    data <- data %>%
      dplyr::mutate(
        component = dplyr::case_when(
          grepl("^i_", term) == TRUE ~ "identity",
          grepl("^b_", term) == TRUE ~ "behavior",
          grepl("^s_", term) == TRUE ~ "setting",
          grepl("^m_", term) == TRUE ~ "modifier",
          grepl("^o_", term) == TRUE ~ "other",
          # everything in the occupations data set is an identity
          grepl("occs", key) == TRUE ~ "identity",
          TRUE ~ NA_character_
        )
      )
  }

  if(grepl("occs", key)){
    data <- data %>%
      dplyr::left_join(occsterms, by = "term") %>%
      dplyr::mutate(term = ifelse(!is.na(.data$label), .data$label, .data$term)) %>%
      dplyr::select(-.data$label)
  }

  if(!grepl("values", key)){
    data <- data %>%
      dplyr::mutate(
        term = stringr::str_squish(.data$term),
        term = str_replace_all(.data$term, "\\*", ""),
        term = str_replace_all(.data$term, "[\\s-]", "_"),
        term = str_replace(.data$term, "^a?A?n?i?b?m?s?_", ""),
        term = str_replace(.data$term, "^t?o?_", "")
        )
  }

  data_clean <- data %>%
    dplyr::mutate(
      term_new = .data$term,
      term_new = str_replace_all(.data$term_new, "(?<!\\.)(?<![[:upper:]])(?=[[:upper:]])", " "),
      term_new = str_replace_all(.data$term_new, "\\*", ""),
      term_new = str_replace_all(.data$term_new, "/", " "),
      term_new = str_replace_all(.data$term_new, "[_-]", " "),
      term_new = stringr::str_squish(.data$term_new),
      term_new = tolower(.data$term_new),
      term_new = str_replace_all(.data$term_new, "[\\s-]", "_"),
      term_new = str_replace_all(.data$term_new, "\\(_", "\\("),
      term_new = str_replace_all(.data$term_new, "\\.", "_"),
      term_new = str_replace_all(.data$term_new, "__", "_"),
      # term_new = str_replace(.data$term_new, "^a?A?n?i?b?m?s?o?_", ""),

      # remove parentheses and single and double quotes -- interact does not accept them
      term_new = str_replace_all(.data$term_new, "\\(", ""),
      term_new = str_replace_all(.data$term_new, "\\)", ""),
      term_new = str_replace_all(.data$term_new, "'", ""),
      term_new = str_replace_all(.data$term_new, '"', ""),

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
      term_new = str_replace(.data$term_new, "^commerical", "commercial"),
      term_new = str_replace(.data$term_new, '^demogogue$', "demagogue"),
      term_new = str_replace(.data$term_new, '^dicatator$', "dictator"),
      term_new = str_replace(.data$term_new, '^dietitican$', "dietitian"),
      # term_new = str_replace(.data$term_new, '^end_football$', "end_football"),
      term_new = str_replace(.data$term_new, '^end_football_player$', "end_football"),
      # term_new = str_replace(.data$term_new, '^father_my$', "father_(my)"),
      term_new = str_replace(.data$term_new, "^fianc[e\\u00e9]$", "fiance_male"),
      term_new = str_replace(.data$term_new, "^fianc[e\\u00e9][e\\u00e9]$", "fiancee_female"),
      term_new = str_replace(.data$term_new, '^greatgrandfather$', "great_grandfather"),
      term_new = str_replace(.data$term_new, '^greatgrandmother$', "great_grandmother"),
      term_new = str_replace(.data$term_new, '^grownup$', "grown_up"),
      # term_new = str_replace(.data$term_new, '^guard_football$', "guard_(football)"),
      term_new = str_replace(.data$term_new, '^househusband$', "house_husband"),
      term_new = str_replace(.data$term_new, '^houseguest$', "house_guest"),
      term_new = str_replace(.data$term_new, '^illigitimate_child$', "illegitimate_child"),
      term_new = str_replace(.data$term_new, '^i_myself_as$', "myself_as"),
      term_new = str_replace(.data$term_new, '^justice_supreme_court$', "justice_of_the_supreme_court"),
      term_new = str_replace(.data$term_new, '^ladykiller$', "lady_killer"),
      term_new = str_replace(.data$term_new, '^lawbreaker$', "law_breaker"),
      term_new = str_replace(.data$term_new, '^lieutenant_govenor$', "lieutenant_governor"),
      term_new = str_replace(.data$term_new, '^loanshark$', "loan_shark"),
      term_new = str_replace(.data$term_new, '^lookout$', "look_out"),
      term_new = str_replace(.data$term_new, '^mother_in_law_maternal$', "mother_in_law_maternal"),
      term_new = str_replace(.data$term_new, '^nephewson_of_brother$', "nephew_son_of_brother"),
      term_new = str_replace(.data$term_new, '^nephewsonofbrother$', "nephew_son_of_brother"),
      term_new = str_replace(.data$term_new, '^nephewson_of_sister$', "nephew_son_of_sister"),
      term_new = str_replace(.data$term_new, '^nephewsonofsister$', "nephew_son_of_sister"),
      term_new = str_replace(.data$term_new, '^nephewsonofbrother$', "nephew_son_of_brother"),
      term_new = str_replace(.data$term_new, '^nephewsonofsister$', "nephew_son_of_sister"),
      term_new = str_replace(.data$term_new, '^niecedaughter_of_brother$', "niece_daughter_of_brother"),
      term_new = str_replace(.data$term_new, '^niecedaughterofbrother$', "niece_daughter_of_brother"),
      term_new = str_replace(.data$term_new, '^niecedaughter_of_sister$', "niece_daughter_of_sister"),
      term_new = str_replace(.data$term_new, '^niecedaughterofsister$', "niece_daughter_of_sister"),
      term_new = str_replace(.data$term_new, '^niecedaughterofbrother$', "niece_daughter_of_brother"),
      term_new = str_replace(.data$term_new, '^niecedaughterofsister$', "niece_daughter_of_sister"),
      term_new = str_replace(.data$term_new, '^nightwatchman$', "night_watchman"),
      term_new = str_replace(.data$term_new, '^nonsmoker$', "non_smoker"),
      term_new = str_replace(.data$term_new, '^oldgeezer$', "old_geezer"),
      term_new = str_replace(.data$term_new, '^oldman$', "old_man"),
      term_new = str_replace(.data$term_new, '^oldtimer$', "old_timer"),
      term_new = str_replace(.data$term_new, '^passerby$', "passer_by"),
      term_new = str_replace(.data$term_new, '^penticostal$', "pentecostal"),
      term_new = str_replace(.data$term_new, '^pornostar$', "porno_star"),
      term_new = str_replace(.data$term_new, '^receptionistf$', "receptionist_female"),
      # term_new = str_replace(.data$term_new, '^receptionist(f)$', "receptionist_female"),
      term_new = str_replace(.data$term_new, '^receptionistm$', "receptionist_male"),
      # term_new = str_replace(.data$term_new, '^receptionist(m)$', "receptionist_male"),
      term_new = str_replace(.data$term_new, '^rolemodel$', "role_model"),
      term_new = str_replace(.data$term_new, '^righthand_man$', "right_hand_man"),
      term_new = str_replace(.data$term_new, '^room_mate$', "roommate"),
      term_new = str_replace(.data$term_new, '^salesclerk$', "sales_clerk"),
      term_new = str_replace(.data$term_new, '^sap_head$', "saphead"),
      term_new = str_replace(.data$term_new, '^secretaryf$', "secretary_female"),
      # term_new = str_replace(.data$term_new, '^secretary(f)$', "secretary_female"),
      term_new = str_replace(.data$term_new, '^secretarym$', "secretary_male"),
      # term_new = str_replace(.data$term_new, '^secretary(m)$', "secretary_male"),
      term_new = str_replace(.data$term_new, '^sickperson$', "sick_person"),
      term_new = str_replace(.data$term_new, '^slavedriver$', "slave_driver"),
      term_new = str_replace(.data$term_new, '^smartaleck$', "smart_aleck"),
      term_new = str_replace(.data$term_new, '^soulmate$', "soul_mate"),
      term_new = str_replace(.data$term_new, '^stoolpigeon$', "stool_pigeon"),
      term_new = str_replace(.data$term_new, '^strikeleader$', "strike_leader"),
      # term_new = str_replace(.data$term_new, '^sweetheart_(female)$', "sweetheart_(male)"),
      # term_new = str_replace(.data$term_new, '^sweetheart(f)$', "sweetheart_female"),
      # term_new = str_replace(.data$term_new, '^sweetheart(m)$', "sweetheart_male"),
      term_new = str_replace(.data$term_new, '^sweetheartf$', "sweetheart_female"),
      term_new = str_replace(.data$term_new, '^sweetheartm$', "sweetheart_male"),
      term_new = str_replace(.data$term_new, '^taxidriver$', "taxi_driver"),
      # term_new = str_replace(.data$term_new, '^teacher_of_deaf$', "teacher_of_deaf"),
      term_new = str_replace(.data$term_new, '^truelove$', "true_love"),
      term_new = str_replace(.data$term_new, '^ukranian$', "ukrainian"),
      term_new = str_replace(.data$term_new, '^unemployedperson$', "unemployed_person"),
      term_new = str_replace(.data$term_new, '^whizkid$', "whiz_kid"),
      # term_new = str_replace(.data$term_new, '^youth(m)$', "youth_male"),
      # term_new = str_replace(.data$term_new, '^youth(f)$', "youth_female"),
      term_new = str_replace(.data$term_new, '^youthm$', "youth_male"),
      term_new = str_replace(.data$term_new, '^youthf$', "youth_female"),
      term_new = str_replace(.data$term_new, '^male_student_of_commerce$', "student_of_commerce_male"),
      term_new = str_replace(.data$term_new, '^female_student_of_commerce$', "student_of_commerce_female"),

      # behaviors
      term_new = str_replace(.data$term_new, '^complainto$', "complain_to"),
      term_new = str_replace(.data$term_new, '^crossexamine$', "cross_examine"),
      term_new = str_replace(.data$term_new, '^dickerwith$', "dicker_with"),
      term_new = str_replace(.data$term_new, '^desire_someone_sexually$', "desire_sexually"),
      term_new = str_replace(.data$term_new, '^doublecross$', "double_cross"),
      term_new = str_replace(.data$term_new, '^escape_from$', "escape"),
      term_new = str_replace(.data$term_new, '^flee_from$', "flee"),
      term_new = str_replace(.data$term_new, '^freakout$', 'freak_out'),
      term_new = str_replace(.data$term_new, '^have_heart_to_heart_talk_with$', "have_a_heart_to_heart_talk_with"),
      term_new = str_replace(.data$term_new, '^humour$', 'humor'),
      term_new = str_replace(.data$term_new, '^promise_something$', 'promise_something_to'),
      term_new = str_replace(.data$term_new, '^scheming$', 'scheme'),
      term_new = str_replace(.data$term_new, '^sell_to$', 'sell_something_to'),
      term_new = str_replace(.data$term_new, '^suggest_to$', 'suggest_something_to'),
      term_new = str_replace(.data$term_new, '^snear_at$', "sneer_at"),
      term_new = str_replace(.data$term_new, '^co_operate_with$', "cooperate_with"),
      term_new = str_replace(.data$term_new, '^deride_mock_scoff_at_ridicule_3$', "deride_mock_scoff_at_ridicule_translation_3"),
      term_new = str_replace(.data$term_new, '^nudge_push_shove_jostle_3$', "nudge_push_shove_jostle_translation_3"),

      # mods
      term_new = str_replace(.data$term_new, '^absentminded$', 'absent_minded'),
      # term_new = str_replace(.data$term_new, '^abusive_physically$', "abusive_physically"),
      # term_new = str_replace(.data$term_new, '^abusive_verbally$', "abusive_verbally"),
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
      # term_new = str_replace(.data$term_new, "^lawyer's_office$", 'lawyers_office'),
      # term_new = str_replace(.data$term_new, "^new_years'_eve$", "new_year's_eve"),
      term_new = str_replace(.data$term_new, '^peniteniary$', 'penitentiary'),
      term_new = str_replace(.data$term_new, '^petstore$', 'pet_store'),

      # values
      term_new = str_replace(.data$term_new, "^sucessful$", "successful"),
      term_new = str_replace(.data$term_new, "^tranquillity$", "tranquility"),
      term_new = str_replace(.data$term_new, "^reciprocation_of_favours$", "reciprocation_of_favors"),

      # fixing spacing with "a"
      term_new = str_replace(.data$term_new, "^bathing_ababy$", "bathing_a_baby"),
      term_new = str_replace(.data$term_new, "^cleaning_abathroom$", "cleaning_a_bathroom"),
      term_new = str_replace(.data$term_new, "^cleaning_akitchen$", "cleaning_a_kitchen"),
      term_new = str_replace(.data$term_new, "^diapering_ababy$", "diapering_a_baby"),
      term_new = str_replace(.data$term_new, "^feeding_ababy$", "feeding_a_baby"),
      term_new = str_replace(.data$term_new, "^sweeping_afloor$", "sweeping_a_floor"),
      term_new = str_replace(.data$term_new, "^vacuuming_acarpet$", "vacuuming_a_carpet"),
      term_new = str_replace(.data$term_new, "_aharsh_", "_a_harsh_"),
      term_new = str_replace(.data$term_new, "_ahand_", "_a_hand_"),
      term_new = str_replace(.data$term_new, "_asweeping_", "_a_sweeping_"),
      term_new = str_replace(.data$term_new, "_ahigh_", "_a_high_"),
      term_new = str_replace(.data$term_new, "_ahoarse_", "_a_hoarse_"),
      term_new = str_replace(.data$term_new, "_amellow_", "_a_mellow_"),
      term_new = str_replace(.data$term_new, "_alow_", "_a_low_"),
      term_new = str_replace(.data$term_new, "_amonotone", "_a_monotone"),
      term_new = str_replace(.data$term_new, "_aquavering_", "_a_quavering_"),
      term_new = str_replace(.data$term_new, "_astep_", "_a_step_"),
      term_new = str_replace(.data$term_new, "_afamily", "_a_family"),
      term_new = str_replace(.data$term_new, "_ajoint_", "_a_joint_"),
      term_new = str_replace(.data$term_new, "^making_afist$", "making_a_fist"),
      term_new = str_replace(.data$term_new, "_awar_", "_a_war_"),
      term_new = str_replace(.data$term_new, "_acease_", "_a_cease_"),
      term_new = str_replace(.data$term_new, "_athird_", "_a_third_"),
      term_new = str_replace(.data$term_new, "_ageneral_", "_a_general_"),
      term_new = str_replace(.data$term_new, "_adraft_", "_a_draft_"),
      term_new = str_replace(.data$term_new, "_adelegation_", "_a_delegation_"),
      term_new = str_replace(.data$term_new, "_aprotest_", "_a_protest_"),
      term_new = str_replace(.data$term_new, "_apartial_", "_a_partial_"),
      term_new = str_replace(.data$term_new, "_atotal_", "_a_total_")

    ) %>%
    dplyr::mutate(
      term_new = dplyr::case_when((grepl("expressive2002", key) | grepl("household1994", key) | grepl("internationaldomesticrelations1981", key)) ~
                             str_replace(.data$term_new, "(?<=^[[:alpha:]]{1,50})ing(?=(_|$))", ""),
                           TRUE ~ .data$term_new)
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

  # fix the "ing" problems

  if(grepl("expressive2002", key) | grepl("household1994", key) | grepl("internationaldomesticrelations1981", key)){
    data_clean <- data_clean %>%
      dplyr::mutate(term = str_replace(.data$term, "^bar[e]?(?=(_|$))", "bare"),
                    term = str_replace(.data$term, "^clapp", "clap"),
                    term = str_replace(.data$term, "^clos[e]?(?=(_|$))", "close"),
                    term = str_replace(.data$term, "^giggl[e]?(?=(_|$))", "giggle"),
                    term = str_replace(.data$term, "^glanc[e]?(?=(_|$))", "glance"),
                    term = str_replace(.data$term, "^grinn", "grin"),
                    term = str_replace(.data$term, "^hugg", "hug"),
                    term = str_replace(.data$term, "^ly", "lie"),
                    term = str_replace(.data$term, "^mak[e]?(?=(_|$))", "make"),
                    term = str_replace(.data$term, "^nodd", "nod"),
                    term = str_replace(.data$term, "^ogl[e]?(?=(_|$))", "ogle"),
                    term = str_replace(.data$term, "^patt", "pat"),
                    term = str_replace(.data$term, "^plac[e]?(?=(_|$))", "place"),
                    term = str_replace(.data$term, "^putt", "put"),
                    term = str_replace(.data$term, "^rais[e]?(?=(_|$))", "raise"),
                    term = str_replace(.data$term, "^shak[e]?(?=(_|$))", "shake"),
                    term = str_replace(.data$term, "^shrugg", "shrug"),
                    term = str_replace(.data$term, "^sitt", "sit"),
                    term = str_replace(.data$term, "^smil[e]?(?=(_|$))", "smile"),
                    term = str_replace(.data$term, "^snuggl[e]?(?=(_|$))", "snuggle"),
                    term = str_replace(.data$term, "^spitt", "spit"),
                    term = str_replace(.data$term, "^star[e]?(?=(_|$))", "stare"),
                    term = str_replace(.data$term, "^tak[e]?(?=(_|$))", "take"),
                    term = str_replace(.data$term, "^tickl[e]?(?=(_|$))", "tickle"),
                    term = str_replace(.data$term, "^wav[e]?(?=(_|$))", "wave"),
                    term = str_replace(.data$term, "^wrinkl[e]?(?=(_|$))", "wrinkle"),
                    term = str_replace(.data$term, "^bath[e]?(?=(_|$))", "bathe"),
                    term = str_replace(.data$term, "^driv[e]?(?=(_|$))", "drive"),
                    term = str_replace(.data$term, "^hav[e]?(?=(_|$))", "have"),
                    term = str_replace(.data$term, "^pollut[e]?(?=(_|$))", "pollute"),
                    term = str_replace(.data$term, "^accus[e]?(?=(_|$))", "accuse"),
                    term = str_replace(.data$term, "^announc[e]?(?=(_|$))", "announce"),
                    term = str_replace(.data$term, "^apologiz[e]?(?=(_|$))", "apologize"),
                    term = str_replace(.data$term, "^assassinat[e]?(?=(_|$))", "assassinate"),
                    term = str_replace(.data$term, "^captur[e]?(?=(_|$))", "capture"),
                    term = str_replace(.data$term, "^ceas[e]?(?=(_|$))", "cease"),
                    term = str_replace(.data$term, "^celebrat[e]?(?=(_|$))", "celebrate"),
                    term = str_replace(.data$term, "^charg[e]?(?=(_|$))", "charge"),
                    term = str_replace(.data$term, "^com[e]?(?=(_|$))", "come"),
                    term = str_replace(.data$term, "^communicat[e]?(?=(_|$))", "communicate"),
                    term = str_replace(.data$term, "^compensat[e]?(?=(_|$))", "compensate"),
                    term = str_replace(.data$term, "^conclud[e]?(?=(_|$))", "conclude"),
                    term = str_replace(.data$term, "^conferr", "confer"),
                    term = str_replace(.data$term, "^creat[e]?(?=(_|$))", "create"),
                    term = str_replace(.data$term, "^denounc[e]?(?=(_|$))", "denounce"),
                    term = str_replace(.data$term, "^devaluat[e]?(?=(_|$))", "devaluate"),
                    term = str_replace(.data$term, "^encourag[e]?(?=(_|$))", "encourage"),
                    term = str_replace(.data$term, "^exchang[e]?(?=(_|$))", "exchange"),
                    term = str_replace(.data$term, "^execut[e]?(?=(_|$))", "execute"),
                    term = str_replace(.data$term, "^expell", "expel"),
                    term = str_replace(.data$term, "^explor[e]?(?=(_|$))", "explore"),
                    term = str_replace(.data$term, "^expropriat[e]?(?=(_|$))", "expropriate"),
                    term = str_replace(.data$term, "^forbidd", "forbid"),
                    term = str_replace(.data$term, "^freez[e]?(?=(_|$))", "freeze"),
                    term = str_replace(.data$term, "^giv[e]?(?=(_|$))", "give"),
                    term = str_replace(.data$term, "^impos[e]?(?=(_|$))", "impose"),
                    term = str_replace(.data$term, "^improv[e]?(?=(_|$))", "improve"),
                    term = str_replace(.data$term, "^incit[e]?(?=(_|$))", "incite"),
                    term = str_replace(.data$term, "^increas[e]?(?=(_|$))", "increase"),
                    term = str_replace(.data$term, "^interven[e]?(?=(_|$))", "intervene"),
                    term = str_replace(.data$term, "^issu[e]?(?=(_|$))", "issue"),
                    term = str_replace(.data$term, "^kidnapp", "kidnap"),
                    term = str_replace(.data$term, "^legislat[e]?(?=(_|$))", "legislate"),
                    term = str_replace(.data$term, "^lin[e]?", "line"),
                    term = str_replace(.data$term, "^manipulat[e]?(?=(_|$))", "manipulate"),
                    term = str_replace(.data$term, "^meet", "meeting"),
                    term = str_replace(.data$term, "^merg[e]?(?=(_|$))", "merge"),
                    term = str_replace(.data$term, "^min[e]?(?=(_|$))", "mine"),
                    term = str_replace(.data$term, "^mobiliz[e]?(?=(_|$))", "mobilize"),
                    term = str_replace(.data$term, "^nationaliz[e]?(?=(_|$))", "nationalize"),
                    term = str_replace(.data$term, "^negotiat[e]?(?=(_|$))", "negotiate"),
                    term = str_replace(.data$term, "^participat[e]?(?=(_|$))", "participate"),
                    term = str_replace(.data$term, "^postpon[e]?(?=(_|$))", "postpone"),
                    term = str_replace(.data$term, "^propos[e]?(?=(_|$))", "propose"),
                    term = str_replace(.data$term, "^provid[e]?(?=(_|$))", "provide"),
                    term = str_replace(.data$term, "^pursu[e]?(?=(_|$))", "pursue"),
                    term = str_replace(.data$term, "^rais[e]?(?=(_|$))", "raise"),
                    term = str_replace(.data$term, "^recogniz[e]?(?=(_|$))", "recognize"),
                    term = str_replace(.data$term, "^reduc[e]?(?=(_|$))", "reduce"),
                    term = str_replace(.data$term, "^refus[e]?(?=(_|$))", "refuse"),
                    term = str_replace(.data$term, "^reshuffl[e]?(?=(_|$))", "reshuffle"),
                    term = str_replace(.data$term, "^resum[e]?(?=(_|$))", "resume"),
                    term = str_replace(.data$term, "^seiz[e]?(?=(_|$))", "seize"),
                    term = str_replace(.data$term, "^shar[e]?(?=(_|$))", "share"),
                    term = str_replace(.data$term, "^terminat[e]?(?=(_|$))", "terminate"),
                    term = str_replace(.data$term, "^tortur[e]?(?=(_|$))", "torture"),
                    term = str_replace(.data$term, "^violat[e]?(?=(_|$))", "violate"),
                    term = str_replace(.data$term, "^writ[e]?(?=(_|$))", "write"),


                    term = str_replace(.data$term, "_elevating_", "_elevate_"),
                    term = str_replace(.data$term, "_organizing_", "_organize_"),
                    term = str_replace(.data$term, "_torturing_", "_torture_"),
                    term = str_replace(.data$term, "_aiding_", "_aid_"),
                    term = str_replace(.data$term, "_blocking_", "_block_"),
                    term = str_replace(.data$term, "_placing_", "_place_"),
                    term = str_replace(.data$term, "_arresting_", "_arrest_"),
                    term = str_replace(.data$term, "kidnap_or_assassinations_of_public_officials", "kidnappings_or_assassinations_of_public_officials")
      )
  }


# politics2003: remove unnecessary "to_X_someone"
  if(grepl("politics2003", key)){
    data_clean <- data_clean %>%
      dplyr::mutate(
        term = str_replace(.data$term, "^to_", ""),
        term = str_replace(.data$term, "_someone(?=(_|$))", ""),
        term = str_replace(.data$term, "^having_", "have_"),
      )
  }

  # The Lulham and Shank data--assign component
  if(grepl("artifact", key)){
    data_clean <- data_clean %>%
      dplyr::mutate(
        term = dplyr::case_when(
          term == "a_safe" ~ "safe",
          term == "a_sudoku" ~ "sudoku",
          TRUE ~ term
        ),
        component = dplyr::case_when(
          grepl("with", .data$term) ~ "modified_identity",
          term %in% c(
            "safe",
            "sudoku",
            "baby_blanket",
            "basketball",
            "bathroom_towel",
            "birthday_cake",
            "black_lipstick",
            "broken_computer",
            "cassette_tape_player",
            "chain_saw",
            "champagne",
            "chewing_tobacco",
            "cigar",
            "cigarette",
            "clunker_car",
            "cockroach_bait",
            "cremation_urn",
            "crib",
            "dictionary",
            "diet_shake",
            "doll",
            "flat_basketball",
            "french_maid_costume",
            "gas_guzzler",
            "gothic_clothing",
            "green_tea",
            "gun",
            "hospital_gown",
            "landline_phone",
            "lead_painted_toy",
            "mouse_trap",
            "noisemaker",
            "perfume",
            "pocket_radio",
            "power_tool",
            "race_car",
            "rowboat",
            "security_camera",
            "skates",
            "slippers",
            "slutty_halloween_costume",
            "soured_milk",
            "sports_car",
            "steroids",
            "suicide_vest",
            "totaled_car",
            "tricycle",
            "trophy",
            "umbrella",
            "vcr",
            "wall_crucifix",
            "yard_gnome"
          ) ~ "artifact",
          term %in% c(
            "abortionist",
            "adolescent",
            "beginner",
            "brat",
            "brute",
            "buddy",
            "bully",
            "champion",
            "child",
            "critic",
            "delinquent",
            "do_nothing",
            "drunk",
            "executioner",
            "follower",
            "foster_child",
            "gangster",
            "genius",
            "grandparent",
            "gunman",
            "hero",
            "hoodlum",
            "idiot",
            "intern",
            "introvert",
            "judge",
            "librarian",
            "loafer",
            "maniac",
            "mobster",
            "old_maid",
            "old_timer",
            "orphan",
            "pal",
            "pastor",
            "patient",
            "pedestrian",
            "pimp",
            "prostitute",
            "psychiatrist",
            "psychopath",
            "racist",
            "schoolboy",
            "schoolgirl",
            "scientist",
            "sexist",
            "sick_person",
            "spouse",
            "sweetheart",
            "teammate",
            "teenager",
            "tutor",
            "underachiever",
            "widow",
            "winner",
            "witness",
            "youngster",
            "youth"
          ) ~ "identity"
        )
      )
  } else if (grepl("humanvalues", key)){
    data_clean <- data_clean %>%
      dplyr::mutate(component = "value")
  } else if (grepl("products", key)){
    data_clean <- data_clean %>%
      dplyr::mutate(component = "artifact")
  }

  return(data_clean)
}



utils::globalVariables("where")

#' epa_summary
#'
#' Calculates the mean, standard deviation, and variance-covariance matrix for
#' each term in an individual-level data set. This is useful when a user wants
#' summary EPA information for a subset of respondents, for example, when comparing
#' cultural meaning across groups. In this case, a user would first create the
#' desired individual data subsets using the [epa_subset()] function, then pass the
#' resulting data frames to this function to calculate relevant summary statistics.
#'
#' @param data individual level data frame with columns for term, component, E, P, and A.
#'
#' @return a summary dataset with one row per term. Includes the evaluation, potency,
#'     and activity mean, standard deviation, and variance-covariance matrix entries
#'     for each term/component combination. Values are rounded to the nearest .01.
#' @export
#'
#' @examples
#' epa_summary(dplyr::filter(epa_subset(datatype = "individual", dataset = "usfullsurveyor2015"),
#'     gender == "Male"))
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
    # Also, the diagonals should be the square of the sd values--there's an argument for
    # keeping this in anyway though if we want to report var and sd (but do we need sd?)
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
#' @keywords internal
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

