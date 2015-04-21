Sys.setlocale("LC_CTYPE", "en_GB.UTF-8")
library(shiny)
# 데이터 출처: https://raw.githubusercontent.com/codenamu/2015-korea-budget/gh-pages/data/2015-budget-by-dep.csv")
#library(RCurl)
library(ggplot2)

par(family="NanumBrush", cex.lab=0.3)
gov.dat <- read.csv("gov.csv")
head(gov.dat)
shinyServer(function(input, output) {
  
  output$histPlot <- renderPlot({

    if(input$budgetType=="department"){      
      boxplot(log10(gov.dat$budget+1)~gov.dat$department, las=2, ylab ="log10(Budget+1)")
    }
    else if(input$budgetType=="budget_type"){
      boxplot(log10(gov.dat$budget+1)~gov.dat$budget_type, las=2, ylab ="log10(Budget+1)")
    }
    else{
      qplot(x=gov.dat$department, y=gov.dat$budget_type, data=gov.dat[,c(1,2,4)],  xlab="Department", ylab="Budget Type", fill=log10(gov.dat[,4]+1), geom="tile") +
        scale_fill_gradient2(limits=c(0, 10)) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) + scale_fill_gradient2("log10(Budget)") 
    }
  })
})