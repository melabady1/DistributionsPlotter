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
library(plotly)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  output$distPlot <- renderPlotly({
    set.seed(123)
    n <- 10000
    mean <- input$mean
    sd <- input$sd
    ncp <- input$ncp
    x <- data.frame(x = rnorm(n, mean = mean, sd = sd), 
                    type = "normal dist.")
    df <- input$df
    y <- data.frame(x = rt(n, df = df, ncp = ncp), 
                    type = "t dist.")
    p <- ggplot(data = rbind(x,y), aes(x = x, group = type)) +
      geom_density(aes(color = type))
  })
  
})
