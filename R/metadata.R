#' Get the list of dataset keys
#'
#' Returns the names of available datasets
#'
#' @param dicts list of dictionary objects
#'
#' @return list of dictionary keys
#' @export
#'
#' @examples
#' dataset_keys()
dataset_keys <- function(dicts = get_dicts()){
  names <- c()
  # subset by stat and/or components available
  for(dict in dicts){
    # if((stat %in% dict@stats | is.na(stat)) & (component %in% dict@components | is.na(component))){
      names <- append(names, dict@key)
    # }
  }
  return(names)
}

#' Get dictionary or equation object
#'
#' Extracts metadata object for a single dictionary of a given name.
#' Its main purpose is to allow for testing whether particular dictionaries
#' have particular elements.
#'
#' @param name string
#'
#' @return dictionary object
#' @export
#'
#' @examples
#' this_dict("uga2015")
this_dict <- function(name){
  dicts <- get_dicts()

  for(d in dicts){
    if(d@key == name){
      return(d)
    }
  }
}

#' Dictionary
#'
#' @slot key character. The dictionary name and year.
#' @slot context character. Country or context collected from.
#' @slot year character. Year collected (approximate in some cases).
#' @slot components vector. What types of terms are included (identities, behaviors, mods, settings)
#' @slot stats vector. What summary statistics available (mean, SD, COV)
#' @slot genders vector. What genders are available (male, female, av)
#' @slot individual logical. Whether or not individual data is available.
#' @slot filetype character. Original source file extension.
#' @slot source character. Where original data came from.
#' @slot description character. Description provided by the source for the dataset.
#' @slot citation character. Citation information for the dataset.
#' @slot notes character. Any notes for the dataset.
#'
#' @importFrom methods "new"
#'
#' @return a dictionary object
#' @keywords internal
dictionary <- methods::setClass("dictionary",
                                slots = list(
                                  key = "character",
                                  context = "character",
                                  year = "character",
                                  components = "vector",
                                  stats = "vector",
                                  genders = "vector",
                                  individual = "logical",
                                  filetype = "character",
                                  source = "character",
                                  description = "character",
                                  citation = "character",
                                  notes = "character"))

#' Initializer method for dictionary class
#'
#' sets defaults but allows them to be overridden by provided values
#'
#' @param dictionary dictionary object
#' @param .Object dictionary object (self)
#' @param key dictionary name
#' @param context country or context collected in
#' @param year year collected
#' @param components available components
#' @param stats available summary statistics
#' @param genders available genders
#' @param individual whether individual data is available
#' @param filetype original source filetype
#' @param source where data came from
#' @param description description provided for data
#' @param citation citation provided for data
#' @param notes any notes for the dataset
#'
#' @return a new dictionary object
#' @keywords internal
setMethod(f = "initialize", signature = "dictionary",
          definition = function(.Object,
                                key = NA_character_,
                                context = NA_character_,
                                year = NA_character_,
                                components = c("identity", "behavior", "modifier"),
                                stats = c("mean"),
                                genders = c("male", "female", "average"),
                                individual = FALSE,
                                filetype = ".dat",
                                source = "Interact 2.1 beta (May 2021)",
                                description = "unknown",
                                citation = "unknown",
                                notes = "none"
          ){
            .Object@key <- key
            .Object@context <- context
            .Object@year <- year
            .Object@components <- components
            .Object@stats <- stats
            .Object@genders <- genders
            .Object@individual <- individual
            .Object@filetype <- filetype
            .Object@source <- source
            .Object@description <- description
            .Object@citation <- citation
            .Object@notes <- notes
            return(.Object)
          }
)

#' Get dictionary information
#'
#' Return metadata of available dictionaries as a list of dictionary objects
#'
#' @return list of dictionary objects
#'
#' @export
#'
#' @examples
#' get_dicts()
get_dicts <- function(){
  dicts = c()
  d_info <- dict_meta
  for(i in 1:nrow(d_info)){
    this <- d_info[i,]
    thisdict <- dictionary(
      key = this$key,
      context = this$context,
      year = as.character(this$year),
      components = stringr::str_split(this$components, ", *")[[1]],
      stats = stringr::str_split(this$stats, ", *")[[1]],
      genders = stringr::str_split(this$genders, ", *")[[1]],
      individual = this$individual,
      filetype = this$filetype,
      source = ifelse(is.na(this$source), "unknown", this$source),
      description = ifelse(is.na(this$description), "unknown", this$description),
      citation = ifelse(is.na(this$citation), "unknown", this$citation),
      notes = ifelse(is.na(this$notes), "none", this$notes)
    )
    dicts <- append(dicts, thisdict)
  }
  return(dicts)
}



#' Print dictionary information
#'
#' Print metadata for the dictionary name specified or for all available dictionaries (if name is unspecified)
#'
#' @param name string
#'
#' @export
#'
#' @examples
#' dict_info()
#' dict_info("china1999")
dict_info <- function(name = NA){
  dicts <- get_dicts()

  if(!is.na(name)){
    thisdict <- this_dict(name)

    if(length(thisdict) == 0){
      dictnames <- dataset_keys(dicts)
      stop(paste("Invalid dictionary name. Available dictionaries are (use dict_info() for details):", paste(unlist(dictnames), collapse = ', ')))
    }

    cat(
      paste(
        paste("Dictionary:", name),
        paste("Country or context:", thisdict@context),
        paste("Year:", thisdict@year),
        paste("Description:", thisdict@description),
        paste("Components:", paste(unlist(thisdict@components), collapse = ', ')),
        paste("Genders:", paste(unlist(thisdict@genders), collapse = ', ')),
        paste("Stats:", paste(unlist(thisdict@stats), collapse = ', ')),
        paste("Individual data available? ", ifelse(thisdict@individual == TRUE, "Yes", "No")),
        paste("Source:", thisdict@source),
        paste("Citation:", thisdict@citation),
        paste("Notes:", thisdict@notes),
        sep = "\n"
      )
    )
  } else {
    cat("Available dictionaries: \n\n")
    for(d in dicts){
      cat(
        paste(
          paste("Dictionary:", d@key),
          paste("Country or context:", d@context),
          paste("Year:", d@year),
          paste("Description:", d@description),
          paste("Components:", paste(unlist(d@components), collapse = ', ')),
          paste("Genders:", paste(unlist(d@genders), collapse = ', ')),
          paste("Stats:", paste(unlist(d@stats), collapse = ', ')),
          paste("Individual data available? ", ifelse(d@individual == TRUE, "Yes", "No")),
          paste("Source:", d@source),
          paste("Citation:", d@citation),
          paste("Notes:", d@notes),
          sep = "\n"
        )
      )
      cat("\n\n")
    }
  }
}

#' Equation
#'
#' @slot key character. The equation name and year
#' @slot gendercomponents vector.
#' @slot filetype character.
#' @slot source character.
#' @slot description character.
#' @slot citation character.
#' @slot notes character.
#'
#' @importFrom methods "new"
#'
#' @return an equation object
#' @keywords internal
equation <- methods::setClass("equation",
                              slots = list(
                                key = "character",
                                gendercomponents = "vector",
                                filetype = "character",
                                source = "character",
                                description = "character",
                                citation = "character",
                                notes = "character"))


#' Initializer for the equation class
#'
#' sets defaults but allows them to be overridden by provided values
#'
#' @param equation equation object
#' @param .Object equation object (self)
#' @param key equation set name
#' @param gendercomponents component genders
#' @param filetype original source filetype
#' @param source where data came from
#' @param description description provided for data
#' @param citation citation provided for data
#' @param notes any notes provided for the dataset
#'
#' @return a new equation object
#' @keywords internal
setMethod(f = "initialize", signature = "equation",
          definition = function(.Object,
                                key = NA_character_,
                                gendercomponents = c("impressionabo_f", "impressionabo_m",
                                                     "impressionabos_f", "impressionabos_m",
                                                     "selfdir_f", "selfdir_m",
                                                     "traitid_f", "traitid_m",
                                                     "emotionid_f", "emotionid_m"),
                                filetype = ".dat",
                                source = "Interact 2.1 (May 2021)",
                                description = "unknown",
                                citation = "unknown",
                                notes = "none"
          ){
            .Object@key <- key
            .Object@gendercomponents <- gendercomponents
            .Object@filetype <- filetype
            .Object@source <- source
            .Object@description <- description
            .Object@citation <- citation
            .Object@notes <- notes
            return(.Object)
          }
)

#' Print equation metadata
#'
#' Print metadata for requested equation name or (if name is not specified) for all available equations
#'
#' @param name string
#'
#' @export
#'
#' @examples
#' eqn_info()
#' eqn_info("us2010")
eqn_info <- function(name = NA){
  eqns <- unique(actdata::equations$key)

  if(!is.na(name)){
    thiseqn <- actdata::equations[which(actdata::equations$key == name),] %>%
      dplyr::mutate(g = dplyr::case_when(gender == "male" ~ "m",
                                         gender == "female" ~ "f",
                                         TRUE ~ "av"),
                    cg = paste0(.data$equation_type, "_", .data$g))

    if(nrow(thiseqn) == 0){
      eqnnames <- actdata::equations$key
      stop(paste("Invalid equation key. Available equations sets are (use eqn_info() for details):", paste(unlist(eqnnames), collapse = ', ')))
    }



    cat(
      paste(
        paste("Equation set name:", name),
        paste("Equation types and genders:", paste(unlist(thiseqn$cg), collapse = ', ')),
        sep = "\n"
      )
    )
  } else {
    cat("Available equations:")
    cat("\n\n")
    for(e in eqns){
      thiseqn <- actdata::equations[which(actdata::equations$key == e),] %>%
        dplyr::mutate(g = dplyr::case_when(gender == "male" ~ "m",
                                           gender == "female" ~ "f",
                                           TRUE ~ "av"),
                      cg = paste0(.data$equation_type, "_", .data$g))

      cat(
        paste(
          paste("Equation set name:", e),
          paste("Equation types and genders:", paste(unlist(thiseqn$cg), collapse = ', ')),
          sep = "\n"
        )
      )
      cat("\n\n")
    }
  }
}

#' Just passes along the metadata object from internal data (for readme purposes)
#'
#' @param type dict or eqn
#'
#' @return metatdata df
#' @keywords internal
get_meta <- function(type){
  if(type == "dict"){
    return(dict_meta)
  } else {
    return(eqn_meta)
  }
}

