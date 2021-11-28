#' Equation
#'
#' @slot key character. The equation name and year
#' @slot gendercomponents vector.
#' @slot filetype character.
#' @slot source character.
#' @slot description character.
#' @slot citation character.
#'
#' @importFrom methods "new"
#'
#' @return an equation object
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
#'
#' @return a new equation object
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

#' Get equation information
#'
#' Return metadata for all available equations as a list of equation objects
#'
#' @return list of equation objects
#'
#' @export
get_eqns <- function(){
  eqns = c()
  for(i in 1:nrow(e_info)){
    this <- e_info[i,]
    thiseqn <- equation(
      key = this$key,
      gendercomponents = str_split(this$gendercomponents, ", *")[[1]],
      filetype = this$filetype,
      source = ifelse(is.na(this$source), "unknown", this$source),
      description = ifelse(is.na(this$description), "unknown", this$description),
      citation = ifelse(is.na(this$citation), "unknown", this$citation),
      notes = ifelse(is.na(this$notes), "none", this$notes)
    )
    eqns <- append(eqns, thiseqn)
  }
  # eqns <- c(
  #   new("equation",
  #     key = "us2010",
  #     gendercomponents = c("impressionabo_av",
  #                          "impressionabos_f", "impressionabos_m",
  #                          "selfdir_f", "selfdir_m",
  #                          "traitid_av",
  #                          "emotionid_f", "emotionid_m"),
  #   ),
  #   new("equation",
  #     key = "nc1978",
  #     gendercomponents = c("impressionabo_f", "impressionabo_m",
  #                          "impressionabos_f", "impressionabos_m",
  #                          "selfdir_f", "selfdir_m",
  #                          "traitid_av",
  #                          "emotionid_f", "emotionid_m"),
  #   ),
  #   new("equation",
  #     key = "morocco2015",
  #     gendercomponents = c("impressionabo_av",
  #                          "impressionabos_f", "impressionabos_m",
  #                          "selfdir_f", "selfdir_m",
  #                          "traitid_av",
  #                          "emotionid_f", "emotionid_m"),
  #   ),
  #   new("equation",
  #     key = "japan1984",
  #     gendercomponents = c("impressionabo_f", "impressionabo_m",
  #                          "impressionabos_f", "impressionabos_m",
  #                          "selfdir_f", "selfdir_m",
  #                          "traitid_f", "traitid_m",
  #                          "emotionid_f", "emotionid_m"),
  #   ),
  #   new("equation",
  #     key = "egypt2014",
  #     gendercomponents = c("impressionabo_av",
  #                          "impressionabos_f", "impressionabos_m",
  #                          "selfdir_f", "selfdir_m",
  #                          "traitid_av",
  #                          "emotionid_f", "emotionid_m"),
  #   ),
  #   new("equation",
  #     key = "germany2007",
  #     gendercomponents = c("impressionabo_av",
  #                          "impressionabos_f", "impressionabos_m",
  #                          "selfdir_f", "selfdir_m",
  #                          "traitid_av",
  #                          "emotionid_av"),
  #   ),
  #   new("equation",
  #     key = "china2000",
  #     gendercomponents = c("impressionabo_f", "impressionabo_m",
  #                          "impressionabos_f", "impressionabos_m",
  #                          "selfdir_f", "selfdir_m",
  #                          "traitid_f", "traitid_m",
  #                          "emotionid_f", "emotionid_m"),
  #   ),
  #   new("equation",
  #     key = "canada20012003",
  #     gendercomponents = c("impressionabo_f", "impressionabo_m",
  #                          "impressionabos_f", "impressionabos_m",
  #                          "selfdir_f", "selfdir_m",
  #                          "traitid_av",
  #                          "emotionid_av"),
  #   ),
  #   new("equation",
  #     key = "canada1985",
  #     gendercomponents = c("impressionabo_f", "impressionabo_m",
  #                          "impressionabos_f", "impressionabos_m",
  #                          "selfdir_f", "selfdir_m",
  #                          "traitid_av",
  #                          "emotionid_av"),
  #   )
  # )
  return(eqns)
}

#' Print equation metadata
#'
#' Print metadata for requested equation name or (if name is not specified) for all available equations
#'
#' @param name string
#'
#' @export
eqn_info <- function(name = NA){
  eqns <- get_eqns()

  if(!is.na(name)){
    thiseqn <- this_dict(name, class = 'equation')

    if(length(thiseqn) == 0){
      eqnnames <- eqn_subset(eqns)
      stop(paste("Invalid equation key. Available equations are (use eqn_info() for details):", paste(unlist(eqnnames), collapse = ', ')))
    }

    cat(
      paste(
        paste("Equation set name:", name),
        paste("Component genders:", paste(unlist(thiseqn@gendercomponents), collapse = ', ')),
        sep = "\n"
      )
    )
  } else {
    cat("Available equations:")
    cat("\n\n")
    for(e in eqns){
      cat(
        paste(
          paste("Equation set name:", e@key),
          paste("Component genders:", paste(unlist(e@gendercomponents), collapse = ', ')),
          sep = "\n"
        )
      )
      cat("\n\n")
    }
  }
}
