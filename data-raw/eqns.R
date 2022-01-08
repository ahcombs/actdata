# Script that determines which coefficients are gender neutral (male and female sets are the same)
# then writes to the correct spots
source_folder <- "data-raw/eqns"
file_list <- list.files(source_folder)

base_list <- unique(unlist(lapply(file_list, function(x) gsub("_[f|m]", "", x))))
base_list <- base_list[base_list != "eqn_info.csv"]

info <- data.frame(matrix(nrow = length(base_list), ncol = 2))
colnames(info) <- c("dataset", "genderneutral")

i = 0
for(dict in base_list){
  i = i + 1
  # check whether male and female datasets are the same
  m <- read.table(paste0(source_folder, "/", gsub("\\.dat", "_m.dat", dict)))
  f <- read.table(paste0(source_folder, "/", gsub("\\.dat", "_f.dat", dict)))

  neutral <- isTRUE(all.equal(m, f))

  info[i,] <- c(dict, neutral)

  if(neutral){
    # write.table(f, file = paste0(dest_folder, "/", gsub("\\.dat", "_av.dat", dict)), quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")
    saveit(f, name = gsub("\\.dat", "_av", dict))
  }
  else {
    saveit(m, name = gsub("\\.dat", "_m", dict))
    saveit(f, name = gsub("\\.dat", "_f", dict))
    # write.table(m, file = paste0(dest_folder, "/", gsub("\\.dat", "_m.dat", dict)), quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")
    # write.table(f, file = paste0(dest_folder, "/", gsub("\\.dat", "_f.dat", dict)), quote = FALSE, row.names = FALSE, col.names = FALSE, sep = "\t")
  }
}
