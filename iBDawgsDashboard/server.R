#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)
library(tidyverse)
library(lubridate)
library(scales)
library(leaflet)

top_20 <- read.csv("top-20.csv")
geo_data <- read.csv("geo_data.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  # top 20 features
  top_20_hist_plot <- reactive({
    c20 <- c(
      "dodgerblue2", "#E31A1C", "green4", "#6A3D9A", "gold1",
                   "skyblue2", "#FB9A99", "palegreen2", "#CAB2D6", "#FDBF6F", 
                   "khaki2", "maroon", "orchid1", "deeppink1", "blue1", 
                   "steelblue4", "darkturquoise", "green1", "yellow4", "yellow3"
    )
    
    top_20 %>% 
      mutate(medianImpSimplified = ((medianImp * 4) / 100.0)) %>% 
      select(X, medianImpSimplified) %>% 
      arrange(-medianImpSimplified) %>% 
      ggplot(aes(medianImpSimplified, reorder(X, medianImpSimplified))) +
      geom_col(aes(fill = c20)) +
      labs(x = "Median Importance", 
           y = "Features",
           title = "Median Importance of Top 20 Features") + 
      theme(legend.position="none")
  })
  
  geo_data_map <- reactive({
    region_counts <- geo_data %>%
      group_by(Country, City, Region, Latitude, Longitude) %>%
      summarize(count = n())
    
    leaflet(region_counts) %>%
      addTiles() %>%
      addCircleMarkers(
        ~Longitude, ~Latitude,
        radius = ~sqrt(count) * 3,
        popup = ~paste(City, ", ", Region, ", ", Country, ": ", "<br>", "The total number of IP addresses in this area: ", count),
        color = "green",
        fillOpacity = 0.3,
        stroke = TRUE,
        options = markerOptions(riseOnHover = TRUE)
      )
  })
  
  model_score <- reactive({
    if (input$model_selection == "Decision Tree") {
      return(paste("                         Accuracy: 1.000",
                    "\tPrecision: 1.000",
                    "\tRecall: 1.000",
                    "\tF1 score: 1.000",
                    "\tRunning time: 1.207 seconds",
                   sep="\n"))
    } else if (input$model_selection == "K-Nearest Neighbors") {
      return(paste("                         Accuracy: 0.989",
                    "\tPrecision: 0.989",
                    "\tRecall: 0.992",
                    "\tF1 score: 0.991",
                    "\tRunning time: 401.435 seconds",
                    sep="\n"))
      
    } else if (input$model_selection == "Gaussian Naive Bayes") {
      return(paste("                         Accuracy: 0.796",
                    "\tPrecision: 0.736",
                    "\tRecall: 1.000",
                    "\tF1 score: 0.848",
                    "\tRunning time: 0.229 seconds",
                    sep="\n"))
      
    } else if (input$model_selection == "Random Forest") {
      return(paste("                         Accuracy: 1.000",
                    "\tPrecision: 1.000",
                    "\tRecall: 1.000",
                    "\tF1 score: 1.000",
                    "\tRunning time: 30.397 seconds",
                    sep="\n"))
      
    }
  })
  
  output$modelScoreText <- renderText({
    model_score()
  })
  
  output$modelChartImg <- renderImage({
    if (input$model_selection == "Decision Tree") {
      return(list(src = "decision_tree.png"))
      
    } else if (input$model_selection == "K-Nearest Neighbors") {
      return(list(src = "k_nearest_neighbors.png"))
      
    } else if (input$model_selection == "Gaussian Naive Bayes") {
      return(list(src = "gaussian_naive_bayes.png"))
      
    } else if (input$model_selection == "Random Forest") {
      return(list(src = "random_forest.png"))
      
    }
  })
  
  output$selectModel1 <- renderUI({
    selectInput(width = 300,
                inputId = "model_selection",
                label = "",
                choices = c("Decision Tree", "K-Nearest Neighbors", "Gaussian Naive Bayes", "Random Forest"))
  })
  
  output$selectModel2 <- renderUI({
    selectInput(width = 300,
                inputId = "model_selection",
                label = "",
                choices = c("Decision Tree", "K-Nearest Neighbors", "Gaussian Naive Bayes", "Random Forest"))
  })
  
  output$top20BarChart <- renderPlotly(
    top_20_hist_plot()
  )
  
  output$benignMap <- renderLeaflet(
    geo_data_map()
  )
  
})
