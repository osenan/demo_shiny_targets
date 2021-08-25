library("shiny")
library("plotly")
library("DT")
library("glue")
library("targets")

suppressWarnings({
  data <- tryCatch({
    tar_read(raw_data)
  }, 
  error = function(err) {
    message("Please run pipeline to use target data")
    read.csv("data/AirQualityUCI.csv")
  }
  )
})

source("functions.R")
