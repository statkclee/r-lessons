Sys.setlocale("LC_CTYPE", "en_GB.UTF-8")
library(shiny)
# 데이터 출처: https://raw.githubusercontent.com/codenamu/2015-korea-budget/gh-pages/data/2015-budget-by-dep.csv")
library("RCurl")
library(ggplot2)
par(family="NanumBrush", cex.lab=0.3)
urlData <- getURL("https://raw.githubusercontent.com/codenamu/2015-korea-budget/gh-pages/data/2015-budget-by-dep.csv")
gov.dat <- read.csv(textConnection(urlData))

shinyServer(function(input, output) {
  
  output$histPlot <- renderPlot({

    if(input$budgetType=="department"){      
      boxplot(log10(gov.dat$budget+1)~gov.dat$department, las=2, ylab ="상용로그(예산)")
    }
    else if(input$budgetType=="budget_type"){
      boxplot(log10(gov.dat$budget+1)~gov.dat$budget_type, las=2, ylab ="상용로그(예산)")
    }
    else{
      qplot(x=gov.dat$department, y=gov.dat$budget_type, data=gov.dat[,c(1,2,4)],  xlab="부처", ylab="예산유형", fill=log10(gov.dat[,4]+1), geom="tile") +
        scale_fill_gradient2(limits=c(0, 10)) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_fill_gradient2("상용로그(예산)") 
    }
  })
})