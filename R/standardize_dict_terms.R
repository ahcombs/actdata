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
standardize_terms <- function(data, key, component){
  if(component == "identities" & key %in% c("uga2015", "usfullsurveyor2015", "usmturk2015", "usstudent2015", "indiana2003")){
    data <- data %>%
      mutate(term = str_replace(.data$term, "divorc[e\\u00e9][e\\u00e9]", "divorcee (female)"),
             term = str_replace(.data$term, "divorc[e\\u00e9](?![_e\\u00e9 ])", "divorcee (male)"))
  } else if (component == "identities") {
    data <- data %>%
      mutate(term = str_replace(.data$term, "divorcee", "divorcee (gender neutral)"))
  }

  data_clean <- data %>%
    mutate(term_new = str_replace(.data$term, "^A?n?_", ""),
           term_new = str_replace_all(.data$term_new, "(?<!\\.)(?<![[:upper:]])(?=[[:upper:]])", " "),
           term_new = str_replace_all(.data$term_new, "[_-]", " "),
           term_new = stringr::str_squish(.data$term_new),
           term_new = tolower(.data$term_new),
           term_new = str_replace_all(.data$term_new, "[\\s-]", "_"),
           term_new = str_replace_all(.data$term_new, "\\(_", "\\("),

           # identities
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
           term_new = str_replace(.data$term_new, '^nephewson_of_sister$', "nephew_(son_of_sister)"),
           term_new = str_replace(.data$term_new, '^nephewsonofbrother$', "nephew_(son_of_brother)"),
           term_new = str_replace(.data$term_new, '^nephewsonofsister$', "nephew_(son_of_sister)"),
           term_new = str_replace(.data$term_new, '^niecedaughter_of_brother$', "niece_(daughter_of_brother)"),
           term_new = str_replace(.data$term_new, '^niecedaughter_of_sister$', "niece_(daughter_of_sister)"),
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
           term_new = str_replace(.data$term_new, '^rolemodel$', "role_model"),
           term_new = str_replace(.data$term_new, '^righthand_man$', "right_hand_man"),
           term_new = str_replace(.data$term_new, '^room_mate$', "roommate"),
           term_new = str_replace(.data$term_new, '^salesclerk$', "sales_clerk"),
           term_new = str_replace(.data$term_new, '^sap_head$', "saphead"),
           term_new = str_replace(.data$term_new, '^secretaryf$', "secretary_(female)"),
           term_new = str_replace(.data$term_new, '^secretarym$', "secretary_(male)"),
           term_new = str_replace(.data$term_new, '^sickperson$', "sick_person"),
           term_new = str_replace(.data$term_new, '^slavedriver$', "slave_driver"),
           term_new = str_replace(.data$term_new, '^smartaleck$', "smart_aleck"),
           term_new = str_replace(.data$term_new, '^soulmate$', "soul_mate"),
           term_new = str_replace(.data$term_new, '^stoolpigeon$', "stool_pigeon"),
           term_new = str_replace(.data$term_new, '^strikeleader$', "strike_leader"),
           term_new = str_replace(.data$term_new, '^sweetheart_(female)$', "sweetheart_(male)"),
           term_new = str_replace(.data$term_new, '^taxidriver$', "taxi_driver"),
           term_new = str_replace(.data$term_new, '^teacher_of_deaf$', "teacher_(of_deaf)"),
           term_new = str_replace(.data$term_new, '^truelove$', "true_love"),
           term_new = str_replace(.data$term_new, '^ukranian$', "ukrainian"),
           term_new = str_replace(.data$term_new, '^unemployedperson$', "unemployed_person"),
           term_new = str_replace(.data$term_new, '^whizkid$', "whiz_kid"),

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
