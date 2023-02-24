#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(plotly)

# Define UI for application that draws a histogram
dashboardPage( skin = "blue",
               dashboardHeader(title = "iBDawgs"),
               
               dashboardSidebar(
                 tags$head(tags$style(HTML('
                  .logo {
                    background-color: #2F4858 !important;
                  }
                  .navbar {
                    background-color: #2F4858 !important;
                  }
                  .main-header .logo {
                    background-color: #336699 !important;
                  }
                  .main-header .logo:hover {
                    background-color: #336699 !important;
                  }
                  .main-header .navbar {
                    background-color: #336699 !important;
                  }
                  .sidebar-menu .active a {
                    border-left-color: #336699 !important;
                  }
                  .skin-blue .sidebar-menu>li>a:focus {
                    border-left-color: #336699 !important;
                  }
                '))),
                 sidebarMenu(
                   menuItem("Home", 
                            tabName = "introduction", 
                            icon = icon("home")),
                   
                   menuItem("Dataset Overview",
                            tabName = "table",
                            icon = icon("table")
                   ),
                   menuItem("Feature Visualization",
                            tabName = "category",
                            icon = icon("chart-simple")
                   ),
                   menuItem("ML Model",
                            tabName = "month",
                            icon = icon("python")
                   ),
                   menuItem("Metric Comparison",
                            tabName = "range",
                            icon = icon("clock")
                   )
                )
               ),
               
               
               dashboardBody(
                 tags$h1(tags$style(HTML("
                  .main-header .logo {
                      font-family: 'Gill Sans', sans-serif;
                      font-weight: bold;
                      font-size: 16px;
                  }
                    
                  body {
                    font-family: 'Gill Sans', sans-serif;
                    font-size: 16px;
                  }
                  
                  h1 {
                    font-family: 'Gill Sans', sans-serif;
                    font-weight: bold;
                    font-size: 32px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 16px;
                    margin-bottom: 8x;
                  }
                  
                  h2 {
                    font-family: 'Gill Sans', sans-serif;
                    font-weight: 600;
                    font-size: 26px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 16px;
                    margin-bottom: 8x;
                  }
                  
                  p {
                    font-family: 'Gill Sans', sans-serif;
                    font-style: normal;
                    font-size: 16px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 8px;
                    margin-bottom: 16px;
                  }
                  
                  h5 {
                    font-family: 'Gill Sans', sans-serif;
                    font-weight: bold;
                    font-style: normal;
                    font-size: 16px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 8px;
                    margin-bottom: 16px;
                  }
                  
                  h6 {
                    font-family: 'Gill Sans', sans-serif;
                    font-style: italic;
                    font-size: 16px;
                    margin-right: 16px;
                    margin-left: 16px;
                    margin-top: 8px;
                    margin-bottom: 16px;
                  }
                  
                  .box{
                    border-top-color:#ffffff;
                  }
                  
                  .selectize-input {
                    margin-left: 16px !important;
                  }
                  
                  .selectize-dropdown {
                    margin-left: 16px !important;
                  }
                  
                  .input-daterange {
                    margin-left: 16px !important;
                  }
                  
                  label {
                    margin-left: 16px !important;
                  }
                  
                  img {
                    display: block; 
                    margin-left: auto; 
                    margin-right: auto;
                  }
                  
                 "))),
                 tabItems(
                   tabItem("introduction",
                           fluidPage(
                             fluidRow(
                               box(
                                 width = 12,
                                 h1("iBDawgs Visualization Dashboard"),
                                 br()
                               )
                             ),
                             fluidRow(
                               box(
                               ),
                               box(
                                
                                 
                               )
                             )
                           )),
                   tabItem("table",
                           fluidPage(
                             fluidRow(
                               box(width = 12
                               )
                             ),
                             fluidRow(
                               box(width = 12)
                             )
                           )),
                   tabItem("category",
                           fluidPage(
                             fluidRow(
                               box(width = 12
                               )
                             ),
                             fluidRow(
                               box(
                               ),
                               box(
                               )
                             ),
                             fluidRow(
                               box(
                               ), 
                               box(
                               )
                             )
                           )),
                   tabItem("month",
                           fluidPage(
                             fluidRow(
                               box(width = 12
                               )
                             ),
                             fluidRow(
                               box(
                               ),
                               box(
                               )
                             )
                           )),
                   tabItem("range",
                           fluidPage(
                             fluidRow(
                               box(width = 12
                               )
                             ),
                             fluidRow(
                               box(width = 12
                               )
                             )
                           ))
                 )
               )
)
