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
  save(list=names(x), file=paste0("data/", name, "_", type, ".rda"), envir=list2env(x))

  # # this does the csvs/.dat files
  # if(type == "dict"){
  #   write.csv(..., paste0("inst/extdata/", name, "_", type, ".csv"))
  # } else {
  #   write.table(..., file = paste0("inst/extdata/", name, "_", type, ".dat"), quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")
  # }
}


#' Save for export to Interact
#'
#' Saves dictionary and equation files in a format that can be directly copy/pasted into Interact.
#' This may be useful for easily creating subsets of data to use in Interact or for importing dictionaries that are not already included.
#'
#' @param data dataframe to save
#' @param type string ("dict" or "eqn") indicating type of data
#' @param filename string the filepath at which to save (must end in .txt)
#'
#' @export
save_for_interact <- function(data, type = "dict", filename = paste0(deparse(substitute(data)), ".txt")){
  if(length(filename) != 1){
    stop("Must provide a single file name.")
  }

  if(grepl("\\.txt$", filename) == FALSE){
    stop("Invalid file extension. Extension .txt required.")
  }

  if(!(type %in% c("dict", "eqn"))){
    stop("Invalid data type. Must be 'dict' or 'eqn'.")
  }

  if(type == "dict"){
    utils::write.table(data, file = filename, quote = FALSE, row.names = FALSE, col.names = FALSE, sep = ", ")
  } else {
    utils::write.table(data, file = filename, quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")
  }
}
