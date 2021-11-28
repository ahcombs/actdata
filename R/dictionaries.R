#' Dictionary
#'
#' @slot key character. The dictionary name and year.
#' @slot components vector. What types of terms are included (identities, behaviors, mods, settings)
#' @slot types vector. What type of data is available (mean, SD, COV)
#' @slot genders vector. What genders are available (male, female, av)
#' @slot filetype character. Original source file extension.
#' @slot source character. Where original data came from.
#' @slot description character. Description provided by the source for the dataset.
#' @slot citation character. Citation information for the dataset.
#'
#' @importFrom methods "new"
#'
#' @return a dictionary object
dictionary <- methods::setClass("dictionary",
                                slots = list(
                                  key = "character",
                                  components = "vector",
                                  types = "vector",
                                  genders = "vector",
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
#' @param components available components
#' @param types available data types
#' @param genders available genders
#' @param filetype original source filetype
#' @param source where data came from
#' @param description description provided for data
#' @param citation citation provided for data
#'
#' @return a new dictionary object
setMethod(f = "initialize", signature = "dictionary",
          definition = function(.Object,
                                key = NA_character_,
                                components = c("identity", "behavior", "modifier"),
                                types = c("mean"),
                                genders = c("male", "female", "average"),
                                filetype = ".dat",
                                source = "Interact 2.1 beta (May 2021)",
                                description = "unknown",
                                citation = "unknown",
                                notes = "none"
                                ){
            .Object@key <- key
            .Object@components <- components
            .Object@types <- types
            .Object@genders <- genders
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
get_dicts <- function(){
  dicts = c()
  d_info <- read_metadata(type = "dict")
  for(i in 1:nrow(d_info)){
    this <- d_info[i,]
    thisdict <- dictionary(
      key = this$key,
      components = stringr::str_split(this$components, ", *")[[1]],
      types = stringr::str_split(this$types, ", *")[[1]],
      genders = stringr::str_split(this$genders, ", *")[[1]],
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



#' Print dictionary info
#'
#' Print metadata for the dictionary name specified or for all available dictionaries (if name is unspecified)
#'
#' @param name string
#'
#' @export
dict_info <- function(name = NA){
  dicts <- get_dicts()

  if(!is.na(name)){
    thisdict <- this_dict(name)

    if(length(thisdict) == 0){
      dictnames <- dict_subset(dicts)
      stop(paste("Invalid dictionary name. Available dictionaries are (use dict_info() for details):", paste(unlist(dictnames), collapse = ', ')))
    }

    cat(
      paste(
        paste("Dictionary:", name),
        paste("Description:", thisdict@description),
        paste("Components:", paste(unlist(thisdict@components), collapse = ', ')),
        paste("Genders:", paste(unlist(thisdict@genders), collapse = ', ')),
        paste("Types:", paste(unlist(thisdict@types), collapse = ', ')),
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
          paste("Description:", d@description),
          paste("Components:", paste(unlist(d@components), collapse = ', ')),
          paste("Genders:", paste(unlist(d@genders), collapse = ', ')),
          paste("Types:", paste(unlist(d@types), collapse = ', ')),
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

#' read_metadata
#'
#' Reads in the metadata associated with equations and dictionaries available.
#'
#' @param type dict or eqn
#'
#' @return dataframe
read_metadata <- function(type){
  if(type == "dict"){
    meta <- read.csv("data-raw/dicts/dict_info.csv")
  } else if(type == "eqn") {
    meta <- read.csv("data-raw/eqns/eqn_info.csv")
  } else {
    stop("Invalid metadata type provided.")
  }
  return(meta)
}
