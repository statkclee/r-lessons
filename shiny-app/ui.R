Sys.setlocale("LC_CTYPE", "en_GB.UTF-8")
library(shiny)

shinyUI(fluidPage(
  
  # Governemt Budget Title
  titlePanel("정부 예산 유형과 부처를 확인해보세요 !!!"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("budgetType", "예산 유형 혹은 부처를 선택하세요.",
                  choices=c("department","budget_type", "dep_plus_type"))
      ),
    mainPanel(
      plotOutput("histPlot"))
    )
  )
  
)