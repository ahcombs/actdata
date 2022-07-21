meta <- utils::read.csv("data-raw/dicts/dict_info.csv")
source_folder <- "data-raw/dicts/individual_raw"
ind_file_list <- grep("csv$", list.files(source_folder), value = TRUE)

# read in files
for(file in ind_file_list){
  path <- paste0(source_folder, "/", file)
  key <- stringr::str_extract(file, "^[[:alnum:]]*(?=_)")
  # context <- stringr::str_extract(key, "^[[:alpha:]]*(?=[[:digit:]])")
  context <- meta[meta$key == key, "context"]
  # I'm leaving year as a regex instead of taking it from meta because this ensures it is numeric and therefore sortable
  year <- stringr::str_extract(key, "[[:digit:]]*$")
  # year <- meta[meta$key == key, "year"]

  data <- read.csv2(path, sep = ",") %>%
    dplyr::rename(term = term_ID)

  data <- standardize_terms(data, key) %>%
    dplyr::rename_with(tolower, !dplyr::matches("^[EPA]$")) %>%
    dplyr::select(dplyr::any_of(c("userid", "gender", "age", "race", "race1", "race2", "term", "component", "E", "P", "A"))) %>%
    dplyr::mutate(dplyr::across(c("E", "P", "A"), ~ifelse(. == "", NA_real_, .)))

  # then re-save
  name <- paste0(key, "_individual")
  x <- list(data)
  names(x) <- paste(name, sep = "")
  saveRDS(data, file=paste0("data-raw/dicts/individual/", name, ".RDS"))
  # save(list=names(x), file=paste0("data-raw/dicts/individual/", name, ".rda"), envir=list2env(x), compress = "gzip")
}
