Sys.setlocale("LC_CTYPE", "en_GB.UTF-8")
library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  
  # Governemt Budget Title
  titlePanel("Government Budget Type and Department"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("budgetType", "Choose Department, Budget Type, or Both",
                  choices=c("department","budget_type", "dep_plus_type"))
      ),
    mainPanel(
      plotOutput("histPlot"))
    )
  )
  
)