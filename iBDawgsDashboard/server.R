#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)
library(lubridate)
library(scales)

data <- read.csv("Friday-WorkingHours-Afternoon-DDos.pcap_ISCX.csv")
View(data)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
})
