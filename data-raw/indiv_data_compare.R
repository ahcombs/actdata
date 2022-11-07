# # FILE COMPARISON
#
# # This script checks some data quality considerations with regard to the individual level data I have
#
# # Particularly:
# # 1. What is with all the zeros? Are these just in the surveyor datasets? If there seems to be an odd distribution, should I be counting them as skips rather than including them in statistic calculation?
# # 2. Do the means that I calculate from these data match the means that are reported online for the same datasets? If not, it could be that the datasets were cleaned differently.
#
# # Once I figure this out, I should remove the mean-only sets for the data collections with individual data. UGA, US student, MTurk, Egypt, Morocco, the full surveyor sample.
#
#
# # MEAN COMPARISON
# # there's a rounding thing. the means-only datasets are rounded to the nearest .01
#
# allzero <- function(data){
#   if(!all(data$e_diff == 0, na.rm = TRUE) |
#      !all(data$p_diff == 0, na.rm = TRUE) |
#      !all(data$a_diff == 0, na.rm = TRUE)){
#     # warning(message = "individual dataset and means only dataset are different")
#     return(FALSE)
#   } else {
#     return(TRUE)
#   }
# }
#
# data_eqcheck <- function(datasetname){
#   d <- epa_summary_statistics %>%
#     dplyr::filter(dataset == datasetname) %>%
#     dplyr::mutate(indiv = !is.na(n_E)) %>%
#     dplyr::select(term, component, E, P, A, indiv) %>%
#     tidyr::pivot_wider(names_from = indiv, values_from = c(E, P, A)) %>%
#     dplyr::mutate(e_diff = E_TRUE - E_FALSE,
#                   p_diff = P_TRUE - P_FALSE,
#                   a_diff = A_TRUE - A_FALSE)
#
#   return(d)
# }
#
# check_equal <- function(datasetname){
#   d <- data_eqcheck(datasetname)
#
#   if(allzero(d)){
#     return(TRUE)
#   } else {
#     return(d)
#   }
# }
#
# # exact equality when rounded
# check_equal("uga2015")
#
# # same
# check_equal("usstudent2015")
#
# # not quite exact equality but all differences within .01
# check_equal("usmturk2015")
# mturk <- data_eqcheck("usmturk2015")
#
# # exactly equal but there are a number of terms with cryptic codes--find key
# check_equal("egypt2015")
# egypt <- data_eqcheck("egypt2015")
#
# # same as egypt--exactly equal but with a number of cryptic terms
# check_equal("morocco2015")
# morocco <- data_eqcheck("morocco2015")
#
#
#
# # LOOK AT DISTRIBUTION OF ZEROS
#
#
# zeros_fsurv <- usfullsurveyor2015_individual %>%
#   dplyr::select(term, E, P, A) %>%
#   tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
#   dplyr::mutate(rating = as.numeric(rating),
#                 truezero = rating == 0)
#
# # weird pattern; you can see the 9 point scale but there are also ratings in between... and lots of zeros on activity especially
# ggplot2::ggplot(zeros_fsurv, ggplot2::aes(x = rating)) +
#   ggplot2::geom_histogram() +
#   ggplot2::facet_wrap("dim")
#
#
# # same here in the subset
# zeros_dcomm <- dukecommunity2015_individual %>%
#   dplyr::select(term, E, P, A) %>%
#   tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
#   dplyr::mutate(rating = as.numeric(rating),
#                 truezero = rating == 0)
#
# ggplot2::ggplot(zeros_dcomm, ggplot2::aes(x = rating)) +
#   ggplot2::geom_histogram() +
#   ggplot2::facet_wrap("dim")
#
#
# # same again
# zeros_usstudent <- usstudent2015_individual %>%
#   dplyr::select(term, E, P, A) %>%
#   tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
#   dplyr::mutate(rating = as.numeric(rating),
#                 truezero = rating == 0)
#
# ggplot2::ggplot(zeros_usstudent, ggplot2::aes(x = rating)) +
#   ggplot2::geom_histogram() +
#   ggplot2::facet_wrap("dim")
#
#
# # and also same with mturk which is interesting because mturk was collected with qualtrics
# zeros_mturk <- usmturk2015_individual %>%
#   dplyr::select(term, E, P, A) %>%
#   tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
#   dplyr::mutate(rating = as.numeric(rating),
#                 truezero = rating == 0)
#
# ggplot2::ggplot(zeros_mturk, ggplot2::aes(x = rating)) +
#   ggplot2::geom_histogram() +
#   ggplot2::facet_wrap("dim")
#
#
# # fewer zeros here relative to other ratings
# zeros_egypt <- egypt2015_individual %>%
#   dplyr::select(term, E, P, A) %>%
#   tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
#   dplyr::mutate(rating = as.numeric(rating),
#                 truezero = rating == 0)
#
# ggplot2::ggplot(zeros_egypt, ggplot2::aes(x = rating)) +
#   ggplot2::geom_histogram() +
#   ggplot2::facet_wrap("dim")
#
#
# # same here as egypt
# zeros_morocco <- morocco2015_individual %>%
#   dplyr::select(term, E, P, A) %>%
#   tidyr::pivot_longer(cols = c(E, P, A), names_to = "dim", values_to = "rating") %>%
#   dplyr::mutate(rating = as.numeric(rating),
#                 truezero = rating == 0)
#
# ggplot2::ggplot(zeros_morocco, ggplot2::aes(x = rating)) +
#   ggplot2::geom_histogram() +
#   ggplot2::facet_wrap("dim")
#
#
#
#
#
# # NOW LOOK AT TRUE ZEROS
# # The US samples are around 10% true zeros
# # The Arabic samples are closer to 5%
# # Doesn't look like much difference between the surveyor sample and the mturk sample.
# prop.table(table(zeros_fsurv$truezero))
# prop.table(table(zeros_dcomm$truezero))
# prop.table(table(zeros_usstudent$truezero))
# prop.table(table(zeros_mturk$truezero))
# prop.table(table(zeros_egypt$truezero))
# prop.table(table(zeros_morocco$truezero))
#





#################### LULHAM INDIVIDUAL DATA: COMPARE AGAINST MEANS ###########


#### ARTIFACTMODS

artifactmeans <- readxl::read_excel("data-raw/dicts/lulhamshank/means/ABS Lulham Shank artifact modiferdata.xlsx") %>%
  dplyr::rename(term = "...1") %>%
  dplyr::select(-...6) %>%
  tidyr::pivot_longer(cols = c(dplyr::starts_with("Women"), dplyr::starts_with("Men")),
                      names_to = c("gender", ".value"), names_sep = "_") %>%
  standardize_terms(key = "artifactmeans2022")

artifactmeans_gendav <- artifactmeans %>%
  dplyr::group_by(term) %>%
  dplyr::summarize(total_n = sum(n),
                   E_means = round(sum(E*n)/total_n, digits = 2),
                   P_means = round(sum(P*n)/total_n, digits = 2),
                   A_means = round(sum(A*n)/total_n, digits = 2)) %>%
  dplyr::rename(n_means = total_n)

indiv_means <- epa_subset(dataset = "artifactmods2022", instcodes = FALSE) %>%
  dplyr::select(term, dplyr::starts_with("n"), E, P, A) %>% # there is one discrepancy between n_E, n_A and n_P (n_P has one more respondent than the other two for idiot_with_a_french_maid_costume)
  dplyr::rename(n_indiv = n_E,
                E_indiv = E,
                P_indiv = P,
                A_indiv = A) %>%
  dplyr::select(-n_P, -n_A)

artifacts <- dplyr::full_join(artifactmeans_gendav, indiv_means, by = "term") %>%
  mutate(E_equal = E_means == E_indiv,
         P_equal = P_means == P_indiv,
         A_equal = A_means == A_indiv,
         n_equal = n_means == n_indiv,
         n_indiv_bigger = n_indiv >= n_means,
         E_dif_large = abs(E_means - E_indiv) > .05,
         P_dif_large = abs(P_means - P_indiv) > .05,
         A_dif_large = abs(A_means - A_indiv) > .05)

all(artifacts$n_indiv_bigger)
all(!artifacts$E_dif_large)
all(!artifacts$P_dif_large)
all(!artifacts$A_dif_large)

# It looks like there were some additional people screened out of the individual data before Rohan and Daniel calculated means.
# n for the individual data is usually a little bigger than n for the means data

# but it also looks like this doesn't generally make a big difference--all differences between the individual and mean data are less than .05

# Found it--my numbers are consistent with the "valid n" in the spreadsheet. i am counting "SM" responses where I should be making them NA.

# look at individual data itself
indiv <- epa_subset(dataset = "artifactmods2022", datatype = "individual") %>%
  dplyr::select(userid, term, E, P, A) %>%
  dplyr::filter(term == "pal")

# from the excel sheet--see if I can figure out the number discrepancy
pal <- readxl::read_excel("/Users/aidan/Desktop/School/Grad_school/ACT/ACT_data_nonpub/ShankLulhamObjects/for_data_check/pal_forcheck.xlsx") %>%
  dplyr::filter(!is.na(rating))

# GOT IT. In the means data, the n comes from excel's COUNT function minus the number of SM responses.
# BUT, this actually double-subtracts the SM responses, because COUNT only considers cells that are numeric, not text values.
# So the "total N" in the excel sheet is actually the valid n, and my numbers should match that. CONFIRMED with spot checks.
# The means in the sheet should be correct. This appears to be okay within rounding error.


### HUMAN VALUES

# I don't have overall averages here and n is not reported with the gendered means so I can't calculate gender averaged values from the means data.
# But I can calculate gendered values from the individual data. This isn't a test of whether the mean calculations to create the summary data works;
# instead it is a test of whether the provided individual data is consistent with the provided mean data.
# But I test whether the calculation of means works with the other datasets--so I think this is okay.

valuesmeans_gendered <- read.csv("data-raw/dicts/lulhamshank/means/Human Values file 21.12.csv") %>%
  dplyr::rename(term = X) %>%
  dplyr::select(-X.1) %>%
  dplyr::filter(term != "") %>%
  tidyr::pivot_longer(cols = -term, names_to = c(".value", "gender"), names_sep = "\\.") %>%
  # there is one term (friendly) where there's some accidental excel junk in a cell--remove
  dplyr::mutate(E = str_replace(E, "\\+.*$", ""),
                P = str_replace(P, "\\+.*$", ""),
                A = str_replace(A, "\\+.*$", "")) %>%
  dplyr::mutate(dplyr::across(c(E, P, A), ~round(as.numeric(.), digits = 2))) %>%
  dplyr::mutate(gender = ifelse(gender == "m", "Male", "Female")) %>%
  dplyr::rename(E_means = E,
                P_means = P,
                A_means = A) %>%
  standardize_terms(key = "humanvalues2022")

valuesindiv_gendered <- epa_subset(dataset = "humanvalues2022", datatype = "individual") %>%
  dplyr::mutate(E = as.numeric(E),
                P = as.numeric(P),
                A = as.numeric(A)) %>%
  dplyr::group_by(term, gender) %>%
  dplyr::summarize(E_indiv = mean(E),
            P_indiv = mean(P),
            A_indiv = mean(A),
            n = dplyr::n())%>%
  dplyr::mutate(across(c(E_indiv, P_indiv, A_indiv), ~ round(., digits = 2)))

values <- dplyr::full_join(valuesmeans_gendered, valuesindiv_gendered, by = c("term", "gender")) %>%
  dplyr::mutate(E_equal = E_means == E_indiv,
         P_equal = P_means == P_indiv,
         A_equal = A_means == A_indiv)

# two of these are clearly just rounding differences
# self-respect is different--appears to be because two versions of it didn't get collapsed as they should have for calculating the mean data
# looks like self-respect was collected twice by accident (included in two modules) and one version had a dash and the other didn't.
# I think lumping them together is the way to go--my calculated means are fine
values_notequal <- values %>%
  dplyr::filter(!E_equal | !P_equal | !A_equal)



### EVERYDAY PRODUCTS

productsmeans_gendered <- readxl::read_excel("data-raw/dicts/lulhamshank/means/Everyday products data EPA.xlsx") %>%
  dplyr::rename(term = "...1") %>%
  dplyr::filter(!is.na(term)) %>%
  tidyr::pivot_longer(cols = -term, names_to = c(".value", "gender"), names_sep = "-") %>%
  dplyr::mutate(dplyr::across(c(E, P, A), ~round(as.numeric(.), digits = 2))) %>%
  dplyr::mutate(gender = ifelse(gender == "m", "Male", "Female")) %>%
  dplyr::rename(E_means = E,
                P_means = P,
                A_means = A) %>%
  standardize_terms(key = "products2022")

productsindiv_gendered <- epa_subset(dataset = "products2022", datatype = "individual") %>%
  dplyr::mutate(E = as.numeric(E),
                P = as.numeric(P),
                A = as.numeric(A)) %>%
  dplyr::group_by(term, gender) %>%
  dplyr::summarize(E_indiv = mean(E),
                   P_indiv = mean(P),
                   A_indiv = mean(A),
                   n = dplyr::n())%>%
  dplyr::mutate(across(c(E_indiv, P_indiv, A_indiv), ~ round(., digits = 2)))

products <- dplyr::full_join(productsmeans_gendered, productsindiv_gendered, by = c("term", "gender")) %>%
  dplyr::mutate(E_equal = E_means == E_indiv,
                P_equal = P_means == P_indiv,
                A_equal = A_means == A_indiv)

# There are a couple of rounding errors, and there is also "train" and "bus", and it looks like the same thing happened
# there as with "self-respect" in the values set. They were included in two modules though everything else was just in
# one, so they have two sets of values. I think lumping them together is fine.
products_notequal <- products %>%
  dplyr::filter(!E_equal | !P_equal | !A_equal)
