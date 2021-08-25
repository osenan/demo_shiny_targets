write_pipeline <- function(removed_indexes) {
  tar_helper("./_targets.R", 
             code = {
               library(targets)
               library(tarchetypes)
               tar_option_set(packages = c("dplyr"))
               source("functions.R")
               list(
                 tar_target(data_file, "data/AirQualityUCI.csv", format = "file"),
                 tar_target(raw_data, read_data(data_file)),
                 tar_target(processed_data, clean_data(raw_data, !!removed_indexes))
               )
             }
  )
}

clean_data <- function(data, removed_indexes = NULL) {
  if(is.null(removed_indexes)) out <- data
  removed_columns <- colnames(data)[removed_indexes]
  out <- data %>% select(-all_of(removed_columns))
}

read_data <- function(path) {
  read.csv(path)
}

plot_hist <- function(data, var) {
  data %>% plot_ly(x = as.formula(glue("~{var}")), type = "histogram", 
                   name = var) %>%
    layout(title = glue("Histogram of {var}"))
}