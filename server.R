library(shiny)
library(plotly)
library(tseries)
library(forecast)
library(graphics)
load("ws.RData")

shinyServer(function(input, output) {
      
      
      output$average_pol <- renderText(
            {
                  county <- input$county
                  print(pull(subset(air_pollution6, Station == county, Average)))
            }
      )
      output$plot <- renderPlotly({
            county <- input$county
            pollution_county <- subset(air_pollution_yearly, Station == county)
            p <- plot_ly(pollution_county, x = ~year, y = ~Average, type = 'scatter', 
                         mode = 'lines') %>%
                         layout(title = "Yearly Pollution",
                                xaxis = list(title = "Year"),
                                yaxis = list (title = "Average pollution (pm 2.5)"))
            })
      
      output$plot1 <- renderPlotly({
      p <- industry_pollution %>%
            plot_ly(labels = ~Source, values = ~Pm2.5) %>%
            add_pie(hole = 0.6) %>%
            layout(title = "Pollution by Industry",  showlegend = F,
                   xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                   yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
      })
      
      output$month1 <- renderText({
            month <- input$month
            if(month == 1)
            {
                  print("January")
            }
            else if(month == 2)
            {
                  print("Feburary")
            }
            else if(month == 3)
            {
                  print("March")
            }
            else if(month == 4)
            {
                  print("April")
            }
            else if(month == 5)
            {
                  print("May")
            }
            else if(month == 6)
            {
                  print("June")
            }
            else if(month == 7)
            {
                  print("July")
            }
            else if(month == 8)
            {
                  print("August")
            }
            else if(month == 9)
            {
                  print("September")
            }
            else if(month == 10)
            {
                  print("October")
            }
            else if(month == 11)
            {
                  print("November")
            }
            else if(month == 12)
            {
                  str<- "December"
            }
      })
      
      output$plot2 <- renderPlot({
            county1 <- input$county1
            month <- input$month
            if(county1 == "Halifax")
            {
                  halifaxForecast <- forecast(halifaxModel,h =month,level = c(99.5))
                  plot(halifaxForecast,ylim = c(5,6.5))
                  output$text1 <- renderText({
                        month <- input$month
                        y <- halifaxForecast$mean
                        tex<- y[as.numeric(month)]
                  })
            }
            else if(county1 == "Sydney")
            {
                  halifaxForecast <- forecast(sydneyModel,h =month,level = c(99.5))
                  plot(halifaxForecast,ylim = c(1,11),xaxt='n')
                  output$text1 <- renderText({
                        month <- input$month
                        y <- halifaxForecast$mean
                        tex<- y[as.numeric(month)]
                  })
            }
            else if(county1 == "Pictou")
            {
                  halifaxForecast <- forecast(pictouModel,h =month,level = c(99.5))
                  plot(halifaxForecast,ylim = c(2,7.5),xaxt='n')
                  output$text1 <- renderText({
                        month <- input$month
                        y <- halifaxForecast$mean
                        tex<- y[as.numeric(month)]
                  })
            }
            else if(county1 == "Lake Major")
            {
                  halifaxForecast <- forecast(lakeMajorModel,h =month,level = c(99.5))
                  plot(halifaxForecast,ylim = c(2,7),xaxt='n')
                  output$text1 <- renderText({
                        month <- input$month
                        y <- halifaxForecast$mean
                        tex<- y[as.numeric(month)]
                  })
            }
            else if(county1 == "Sable Island")
            {
                  halifaxForecast <- forecast(islandModel,h =month,level = c(99.5))
                  plot(halifaxForecast,ylim = c(7.2,9.5),xaxt='n')
                  output$text1 <- renderText({
                        month <- input$month
                        y <- halifaxForecast$mean
                        tex<- y[as.numeric(month)]
                  })
            }
            else if(county1 == "Aylesford")
            {
                  halifaxForecast <- forecast(aylesfordModel,h =month,level = c(99.5))
                  plot(halifaxForecast,ylim = c(4,7),xaxt='n')
                  output$text1 <- renderText({
                        month <- input$month
                        y <- halifaxForecast$mean
                        tex<- y[as.numeric(month)]
                  })
            }
            else
            {
                  halifaxForecast <- forecast(portModel,h =month,level = c(99.5))
                  plot(halifaxForecast,ylim = c(3,7.5),xaxt='n')
                  output$text1 <- renderText({
                        month <- input$month
                        y <- halifaxForecast$mean
                        tex<- y[as.numeric(month)]
                  })
            }
            
            
       
      })
   
  
})
