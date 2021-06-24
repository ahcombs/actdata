#' Get equation information
#'
#' Return metadata for all available equations as a list of equation objects
#'
#' @return list of equation objects
#'
#' @export
get_eqns <- function(){
  # TODO: update path
  source_folder <- "/Users/aidan/Desktop/interact_data/eq_coefs/clean"

  ## CONSTANTS
  # available equations
  methods::setClass("equation",
           methods::representation(
             key = "character",
             genders = "vector",
             filetype = "character",
             source = "character",
             description = "character",
             citation = "character"),
           methods::prototype(key = NA_character_,
                     genders = c("male", "female"),
                     filetype = ".dat",
                     source = "Interact 2.1 (May 2021)",
                     description = "unknown",
                     citation = "unknown"))

  file_list <- list.files(source_folder)
  eqns = list()

  for(file in file_list){
    key <- regmatches(file, regexpr("^[[:alnum:]]*_[[:alnum:]]*", file))
    gender <- gsub("\\.[[:alnum:]]*$", "", regmatches(file, regexpr("[[:alnum:]]*\\.[[:alnum:]]*$", file)))
    filetype <- regmatches(file, regexpr("\\.[[:alnum:]]*$", file))

    if(gender %in% c("f", "av")){
      if(gender == "f"){
        genders <- c("female", "male")
      }
      else {
        genders <- c("neutral")
      }
      eqns <- append(eqns, methods::new("equation",
                               key = key,
                               genders = genders,
                               filetype = filetype))
    }
  }

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
        paste("Genders:", paste(unlist(thiseqn@genders), collapse = ', ')),
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
          paste("Available genders:", paste(unlist(e@genders), collapse = ', ')),
          sep = "\n"
        )
      )
      cat("\n\n")
    }
  }
}
