library("shiny")
library("plotly")
library("DT")
library("targets")

data <- tryCatch({
  tar_read(raw_data)
  print("read_raw_data")
}, 
error = function(err) {
  read.csv("data/AirQualityUCI.csv")
}
)

source("functions.R")