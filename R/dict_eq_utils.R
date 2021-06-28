#' Dictionary subset
#'
#' Extracts the keys of dictionaries, optionally subsetted by type (mean, SD, COV) or component (identities, behaviors, mods, settings)
#'
#' @param dicts list of dictionary objects
#' @param type string (\code{"mean"}, \code{"sd"}, or \code{"cov"})
#' @param component string (\code{"identities"}, \code{"behaviors"}, \code{"mods"}, or \code{"settings"})
#'
#' @return list of dictionary keys
#' @keywords internal
dict_subset <- function(dicts, type = NA, component = NA){
  names <- c()
  # subset by type and/or components available
  for(dict in dicts){
    if((type %in% dict@types | is.na(type)) & (component %in% dict@components | is.na(component))){
      names <- append(names, dict@key)
    }
  }

  return(names)
}


#' Equation subset
#'
#' Extracts the keys of equations, optionally subsetted by gender
#'
#' @param eqns list of equation objects
#' @param gender string
#'
#' @return list of equation keys
#' @keywords internal
eqn_subset <- function(eqns, gender = NA){
  names <- c()
  # subset by gender available
  for(eqn in eqns){
    if(gender %in% eqn@gender | is.na(gender)){
      names <- append(names, eqn@key)
    }
  }

  return(names)
}


#' Get dictionary or equation object
#'
#' Extracts metadata object for a single dictionary or equation of a given name from the master list
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
