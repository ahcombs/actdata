# TODO: Which dictionaries to include? All? Or should it be limited to those that have been published with (so not gaysex1980)? Should I include subsets (prisoner's dilemma)?
# TODO: Split year and location into two columns. This will involve figuring out when exactly some stuff was collected (Japan).

source_folder <- "data-raw/dicts"
file_list <- list.files(source_folder)

# set up base dataframe
cnames <- c(
  "term",
  "dataset",
  "context",
  "year",
  "component",
  "instcodes",
  "gender",
  "E",
  "P",
  "A"
  # "sd_E",
  # "sd_P",
  # "sd_A"
)

alldata <- data.frame(matrix(nrow = 0, ncol = length(cnames)))
names(alldata) <- cnames

for(file in file_list){
  # should deal with the mean-only datasets and the SD/COV datasets separately
  # TODO: individual datasets
  path <- paste0(source_folder, "/", file)
  component <- stringr::str_extract(file, "(?<=_)[[:alpha:]]*(?=.)")
  context <- stringr::str_extract(component, "^[[:alpha:]]*(?=[[:digit:]])")
  year <- stringr::str_extract(component, "[[:digit:]]*")

  # this screens out Jesse's emotions component, which is really mods--should fix this in a better way
  if(component %in% c("identities", "behaviors", "mods", "settings")){
    key <- stringr::str_extract(file, "^[[:alnum:]]*(?=_)")
    filetype <- stringr::str_extract(file, "\\.[[:alpha:]]*$")
    datatype <- dplyr::case_when(
      grepl("COV", file) ~ "COV",
      grepl("SD", file) ~ "SD",
      TRUE ~ "mean"
    )

    con <- file(path, "r")
    firstline <- readLines(con = con, n = 1)
    close(con)
    if(grepl(',', firstline)){
      # the file is comma-separated
      sep <- ","
    } else {
      # file is space separated
      sep <- " "
    }

    if(grepl('term', firstline)){
      head <- TRUE
    } else {
      head <- FALSE
    }

    data <- read.table(path, header = head, sep = sep, quote = "", fill=FALSE)
    nc <- ncol(data)
    namesplaceholder <- list()
    for(i in 1:nc){
      namesplaceholder <- append(namesplaceholder, paste0("V", i))
    }
    names(data) <- namesplaceholder

    if(datatype == "mean"){

      male <- data %>%
        dplyr::select(-c(V5:V7))
      female <- data %>%
        dplyr::select(-c(V2:V4))
      average <- data %>%
        dplyr::rowwise() %>%
        dplyr::mutate(avE = mean(c(V2, V5)),
                      avP = mean(c(V3, V6)),
                      avA = mean(c(V4, V7))) %>%
        dplyr::select(-c(V2:V7))

      if(ncol(female) == 5){
        colnames(male) <- c("term", "E", "P", "A", "instcodes")
        colnames(female) <- c("term", "E", "P", "A", "instcodes")
        colnames(average) <- c("term", "instcodes", "E", "P", "A")
        average <- dplyr::select(average, term, E, P, A, instcodes)
      } else {
        male$instcodes <- NA
        female$instcodes <- NA
        average$instcodes <- NA
        colnames(male) <- c("term", "E", "P", "A", "instcodes")
        colnames(female) <- c("term", "E", "P", "A", "instcodes")
        colnames(average) <- c("term", "E", "P", "A", "instcodes")
      }

      # standardize terms
      male <- standardize_terms(male, key, component)
      female <- standardize_terms(female, key, component)
      average <- standardize_terms(average, key, component)

      term_table_input <- cbind(average[,1], rep(1, length(average[,1])))
      colnames(term_table_input) <- c("term", key)

      # # get institution codes; add to aggregate list
      # if("instcodes" %in% colnames(average)){
      #   inst_table_input <- dplyr::select(average, term, instcodes)
      #   colnames(inst_table_input) <- c("term", key)
      #
      #   if(component == 'identities'){
      #     inst_code_table_ident <- dplyr::full_join(inst_code_table_ident, inst_table_input, by = "term")
      #   } else if (component == 'behaviors'){
      #     inst_code_table_beh <- dplyr::full_join(inst_code_table_beh, inst_table_input, by = "term")
      #   } else if (component == 'mods'){
      #     inst_code_table_mod <- dplyr::full_join(inst_code_table_mod, inst_table_input, by = "term")
      #   } else if (component == 'settings'){
      #     inst_code_table_set <- dplyr::full_join(inst_code_table_set, inst_table_input, by = "term")
      #   }
      # }

      # are the male and female sets identical? If so the reported values are averages already and need only print one file
      if(isTRUE(all.equal(male$E, female$E))){
        avonly <- TRUE
      } else {
        avonly <- FALSE
      }

      # format average file for long format and append to complete df
      average$dataset <- key
      average$context <- context
      average$year <- year
      average$component <- component
      average$gender <- "average"
      # average$sd_E <- NA
      # average$sd_P <- NA
      # average$sd_A <- NA
      average <- dplyr::select(average, all_of(cnames))

      alldata <- rbind(alldata, average)


      # then do the same with male and female files if necessary
      if(avonly == FALSE){
        male$dataset <- key
        male$context <- context
        male$year <- year
        male$component <- component
        male$gender <- "male"
        # male$sd_E <- NA
        # male$sd_P <- NA
        # male$sd_A <- NA
        male <- dplyr::select(average, all_of(cnames))

        female$dataset <- key
        female$context <- context
        female$year <- year
        female$component <- component
        female$gender <- "female"
        # female$sd_E <- NA
        # female$sd_P <- NA
        # female$sd_A <- NA
        female <- dplyr::select(average, all_of(cnames))

        alldata <- rbind(alldata, male)
        alldata <- rbind(alldata, female)
      }

      # TODO: Calculate sd/cov values for individual data and redo this!
      # now deal with covariance datasets which will be different.
      # The one provided (georgia-duke 2015; probably same data as UGA 2015) does not split by gender
      # cov data has 9 additional columns
      # can leave as is with the exception of standardizing term format
    }
    # else if (datatype == "COV") {
    #   names(data) <- c('term', 'E', 'P', 'A', 'cov1', 'cov2', 'cov3', 'cov4', 'cov5', 'cov6', 'cov7', 'cov8', 'cov9')
    #   data_clean <- standardize_terms(data, key, component)
    #   filename <- paste0(key, "_", component, "_av_COV")
    #   saveit(data_clean, name = filename)
    #
    #   term_table_input <- cbind(data_clean[,1], rep(1, length(data_clean[,1])))
    #   colnames(term_table_input) <- c("term", key)
    #
    # } else if (datatype == "SD") {
    #   # standard deviation has three additional columns; does not split by gender
    #   names(data) <- c('term', 'E', 'P', 'A', 'sd1', 'sd2', 'sd3')
    #   data_clean <- standardize_terms(data, key, component)
    #   filename <- paste0(key, "_", component, "_av_SD")
    #   saveit(data_clean, name = filename)
    #
    #   term_table_input <- cbind(data_clean[,1], rep(1, length(data_clean[,1])))
    #   colnames(term_table_input) <- c("term", key)
    #
    # }
  }

}

means <- alldata
save(means, file = "data/means.RData")


# TODO: Redo term tables. Combine to one.
keys <- unique(means$dataset)
term_table <- means %>%
  dplyr::select(term, component) %>%
  dplyr::distinct()

for(key in keys){
  subset_idents <- means[means[["dataset"]] == key,] %>%
    dplyr::select(term, component) %>%
    dplyr::distinct() %>%
    dplyr::mutate({{key}} := 1)

  term_table <- term_table %>%
    dplyr::left_join(subset_idents, by = c("term", "component"))
}

term_table[is.na(term_table)] <- 0

save(term_table, file = "data/term_table.RData")





# TODO: Contact Kait Boyle about the institution code stuff

instcode_rowequal <- function(row){
  noterm <- row[,2:ncol(row)]
  noterm <- as.character(noterm)
  noterm <- noterm[!is.na(noterm)]
  if(length(unique(noterm)) > 1){
    return(FALSE)
  }
  else{
    return(TRUE)
  }
}

# inst_code_table_ident <- dplyr::select(inst_code_table_ident, -allsame)
# inst_code_table_beh <- dplyr::select(inst_code_table_beh, -allsame)
# inst_code_table_mod <- dplyr::select(inst_code_table_mod, -allsame)
# inst_code_table_set <- dplyr::select(inst_code_table_set, -allsame)
#
#
# # figure out which are duplicates
# inst_code_table_ident <- inst_code_table_ident %>%
#   dplyr::filter(!is.na(term))
# inst_code_table_beh <- inst_code_table_beh %>%
#   dplyr::filter(!is.na(term))
# inst_code_table_mod <- inst_code_table_mod %>%
#   dplyr::filter(!is.na(term))
# inst_code_table_set <- inst_code_table_set %>%
#   dplyr::filter(!is.na(term))
#
#
# inst_code_table_ident_temp <- inst_code_table_ident
# for(i in 1:nrow(inst_code_table_ident)){
#   inst_code_table_ident_temp[i, "allsame"] <- instcode_rowequal(inst_code_table_ident[i,])
# }
# inst_code_table_ident <- inst_code_table_ident_temp
#
# inst_code_table_beh_temp <- inst_code_table_beh
# for(i in 1:nrow(inst_code_table_beh)){
#   inst_code_table_beh_temp[i, "allsame"] <- instcode_rowequal(inst_code_table_beh[i,])
# }
# inst_code_table_beh <- inst_code_table_beh_temp
#
# inst_code_table_mod_temp <- inst_code_table_mod
# for(i in 1:nrow(inst_code_table_mod)){
#   inst_code_table_mod_temp[i, "allsame"] <- instcode_rowequal(inst_code_table_mod[i,])
# }
# inst_code_table_mod <- inst_code_table_mod_temp
#
# inst_code_table_set_temp <- inst_code_table_set
# for(i in 1:nrow(inst_code_table_set)){
#   inst_code_table_set_temp[i, "allsame"] <- instcode_rowequal(inst_code_table_set[i,])
# }
# inst_code_table_set <- inst_code_table_set_temp
#
# inst_dups_ident <- dplyr::filter(inst_code_table_ident, allsame == FALSE)
# inst_dups_beh <- dplyr::filter(inst_code_table_beh, allsame == FALSE)
# inst_dups_mod <- dplyr::filter(inst_code_table_mod, allsame == FALSE)
# inst_dups_set <- dplyr::filter(inst_code_table_set, allsame == FALSE)
