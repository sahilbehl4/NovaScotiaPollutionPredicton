#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


load("ws.RData")
library(shiny)
library(plotly)
shinyUI(fluidPage(
      tags$head(
            tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
      ),
  navbarPage("Nova Scotia Polution Data",
             tabPanel("Dashboard",
             sidebarLayout(
                   sidebarPanel(width = 3,
                         selectInput(inputId = "county", label = strong("Select County"),
                                     choices = unique(air_pollution6$Station),
                                     selected = "Halifax")
                   ),
                   mainPanel(
                         fluidRow(
                               column(width = 6, plotlyOutput("plot")),
                               column(width = 6, plotlyOutput("plot1"))
                         )
                   )
                   )
                ),
             tabPanel("Pollution Prediction",
                      titlePanel("Prediction"),
                      sidebarLayout(
                            sidebarPanel(
                                  selectInput(inputId = "county1", label = strong("Select County"),
                                              choices = unique(air_pollution6$Station),
                                              selected = "Halifax"),
                                  selectInput(inputId = "month", label = strong("Select Month"),
                                              choices = c(1,2,3,4,5,6,7,8,9,10,11,12),
                                              selected = "12")
                            ),
                            mainPanel(
                                  h4("Predicted PM2.5 values: ", textOutput("month1"),textOutput("text1")),
                                  plotOutput("plot2")
                            )
                      )
             )
             )
))
     
