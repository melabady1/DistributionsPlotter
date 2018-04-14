#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("t distribution vs normal distribution"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      helpText("Choose degree of fredoom  and Non-centrality Parameter of
               t distributions curve"),
       sliderInput("df",
                   "Degree of freedom:",
                   min = 1,
                   max = 100,
                   value = 5),
       sliderInput("ncp",
                   "Non-centrality Parameter:",
                   min = -100,
                   max = 100,
                   value = 0),
      helpText("Choose mean and Standard Deviation of
               Normal distributions curve"),
      sliderInput("mean", "mean", min = -100, max = 100, value = 0),
       sliderInput("sd", "Standard Deviation", min = 1, max = 10, value = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("distPlot"),
      helpText("Hover on the curve to get the denisty value.")
    )
  )
))
