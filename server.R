library(shiny)
library(ISLR);
library(ggplot2);
library(caret);
library(kernlab);
library(gbm);
set.seed(2500)
data(Wage)
WageNew<-Wage[,c("year","age","maritl","race","education","jobclass","health","health_ins","wage")]
inTrain<-createDataPartition(y=WageNew$wage,p=0.7,list=FALSE)
training<-WageNew[inTrain,];
testing<-WageNew[-inTrain,];
wageModel<-train(wage~.,data=training,method="gbm");

shinyServer(
  function(input,output){
    output$wagedistribution<-renderPlot({
      qplot(age,wage,color=jobclass,data=training)
    })
    output$weltext<-reactive({paste('Hi ',input$pre_name,',')})
      
    output$predictedWage<-reactive({paste('Your estimated salary is $',predict(wageModel,data.frame("year"=input$pre_year,"age"=input$pre_age,"maritl"=input$pre_maritl,"race"=input$pre_race,"education"=input$pre_education,"jobclass"=input$pre_jobclass,"health"=input$pre_health,"health_ins"=input$pre_healthins)),' per day.')})    

  }
)