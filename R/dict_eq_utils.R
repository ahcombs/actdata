#' search_dict
#'
#' Dictionary term search
#'
#' @param expr A term or regular expression to search
#' @param key The key of the dictionary (or list of multiple) to search in. Default is "all."
#' @param component The component of the dictionary to use (identity, behavior, modifier, setting). Default is "all."
#' @param gender The gender of the dictionary to use (male, female, average). Default it "all."
#'
#' @return FALSE if the provided term or expression is not in any provided dictionary. If it occurs at least once, returns the subset of the dictionary(s) of interest where the term matches the provided expression.
#' @export
search_dict <- function(expr, key = "all", component = "all", gender = "all"){
  # TODO TEST THIS FUNCTION
  if(key != "all"){
    check_key(key)
  }
  if(component != "all"){
    check_component(component)
  }
  if(gender != "all"){
    check_gender(gender)
  }

  if(!is.character(expr)){
    stop("Must provide a character expression or vector")
  }

  subset <- actdata::epa_summary_statistics[grepl(expr, actdata::epa_summary_statistics$term),]

  if(key != "all"){
    k <- key
    subset <- subset %>%
      dplyr::filter(key %in% k)
  }

  if(component != "all"){
    c <- component
    subset <- subset %>%
      dplyr::filter(component %in% c)
  }

  if(gender != "all"){
    g <- gender
    subset <- subset %>%
      dplyr::filter(gender %in% g)
  }

  if(nrow(subset == 0)){
    return(FALSE)
  }

  return(subset)
}


# TODO this is super confusing that I have this function here and also a file called dict_subset with other functions. What is this doing and can it be moved?

#' dict_subset
#'
#' Dictionary subset. Extracts the keys of dictionaries, optionally subsetted by type (mean, sd, cov, individual) or component (identity, behavior, modifier, setting)
#'
#' @param dicts list of dictionary objects
#' @param type string (\code{"mean"}, \code{"sd"}, or \code{"cov"})
#' @param component string (\code{"identity"}, \code{"behavior"}, \code{"modifier"}, or \code{"setting"})
#'
#' @return list of dictionary keys
#' @export
dict_subset <- function(type = NA, component = NA, dicts = get_dicts()){
  # TODO I changed the parameter to make get_dicts() the default and put it last--update within bayesact
  # TODO allow abbreviations? Is this likely to be used by users or is it just for bayesactr?
  names <- c()
  # subset by type and/or components available
  for(dict in dicts){
    if((type %in% dict@types | is.na(type)) & (component %in% dict@components | is.na(component))){
      names <- append(names, dict@key)
    }
  }

  return(names)
}


#' eqn_subset
#'
#' Equation subset. Extracts the keys of equations, optionally subsetted by gender
#'
#' @param eqns list of equation objects
#' @param gendercomponent string
#'
#' @return list of equation keys
#' @export
eqn_subset <- function(eqns, gendercomponent = NA){
  names <- c()
  # subset by component/gender available
  for(eqn in eqns){
    if(gendercomponent %in% eqn@gendercomponents | is.na(gendercomponent)){
      names <- append(names, eqn@key)
    }
  }

  return(names)
}


#' this_dict
#'
#' Get dictionary or equation object. Extracts metadata object for a single dictionary or equation of a given name from the master list
#'
#' @param name string
#' @param class string (\code{"equation"} or \code{"dictionary"})
#'
#' @return dictionary object
#' @export
this_dict <- function(name, class = 'dictionary'){
  if(class == 'dictionary'){
    dicts <- get_dicts()
  }
  else {
    dicts <- get_eqns()
  }

  for(d in dicts){
    if(d@key == name){
      return(d)
    }
  }
}

#' Valid key check
#'
#' Checks provided key(s) to see if they are available in the summary statistics supplied.
#'
#' @param key string
#'
#' @return TRUE if available; throws error otherwise
check_key <- function(key){
  keys_avail <- unique(actdata::epa_summary_statistics[,c("dataset")])
  for(k in key){
    if(!(k %in% unlist(keys_avail))){
      stop(message = paste0("Invalid dataset key '", k,"' provided. Use dict_info() to see datasets available."))
    }
  }

  return(TRUE)
}


#' Valid component check
#'
#' Checks provided component(s) to see if they are available in the summary statistics supplied. Takes certain abbreviations/alternate spellings.
#' Accepted values are:
#'     b, beh, behavior, behaviour, behaviors, behaviours
#'     m, mod, modifier, modifiers
#'     i, ident, identity, identities
#'     s, set, setting, settings
#'
#' @param component string
#'
#' @return TRUE if available; throws error otherwise
check_component <- function(component){
  components_avail <- c("behavior", "modifier", "identity", "setting", "b", "beh", "m", "mod", "i", "ident", "s", "set", "behaviors", "modifiers", "settings", "identities")
  for(c in component){
    if(!(c %in% unlist(components_avail))){
      stop(message = paste0("Invalid component '", c,"' provided. Valid components are identity, behavior, modifier, and setting."))
    }
  }

  return(TRUE)
}

#' Valid gender check
#'
#' Checks provided component(s) to see if they are available in the summary statistics supplied. Takes certain abbreviations/alternate spellings.
#' Accepted values are:
#'     m, male, man
#'     f, female, woman
#'     a, av, average
#'
#' @param gender string
#'
#' @return TRUE if available; throws error otherwise
check_gender <- function(gender){
  genders_avail <- c("m", "male", "man", "f", "female", "woman", "a", "av", "average")
  for(g in gender){
    if(!(g %in% unlist(genders_avail))){
      stop(message = paste0("Invalid gender '", g,"' provided. Valid genders are average, female, and male."))
    }
  }

  return(TRUE)
}

# TODO write a function for standardizing inputs (so if someone provides an abbreviation, convert to input needed for filtering) and tie to above check functions perhaps
