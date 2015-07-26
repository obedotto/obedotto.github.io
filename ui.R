library(shiny)
library(ISLR);
library(ggplot2);
library(caret);
library(kernlab)
library(gbm)

shinyUI(
  pageWithSidebar(
    headerPanel("Wage Prediction Algorithm"),
    sidebarPanel(
      h3('Enter Your Profile Here'),
      textInput(inputId="pre_name",label="Candidate Name",value = "Raja"),
      numericInput(inputId="pre_age",label = "Age",min = 1,max = 80,step = 1,value = 20),
      sliderInput(inputId="pre_year",min = 2003,max = 2009,value = 2005,label = "Year"),
      selectInput(inputId="pre_maritl",choices = list("Never Married"="1. Never Married","Married"="2. Married","Widowed"="3. Widowed","Divorced"="4. Divorced","Separated"="5. Separated"),selected = "1. Never Married",multiple = FALSE,label = "Marital Status"),
      selectInput(inputId="pre_race",choices = list("White"="1. White","Black"="2. Black","Asian"="3. Asian","Other"="4. Other"),selected = "2. Black",multiple = FALSE,label = "Race"),
      selectInput(inputId="pre_education",choices = list("Less than HS Grade"="1. < HS Grad","HS Grade"="2. HS Grad","Some College"="3. Some College","College Grade"="4. College Grad","Advanced Degree"="5. Advanced Degree"),selected = "3. Some College",multiple = FALSE,label = "Education"),
      radioButtons(inputId="pre_jobclass",label = "Job Class",choices =list("Industrial" = "1. Industrial", "Information" = "2. Information"),selected = "1. Industrial" ),
      radioButtons(inputId="pre_health",label = "Health Status",choices =list("Good" = "1. <=Good", "Very Good" = "2. >=Very Good"),selected = "2. >=Very Good" ),
      radioButtons(inputId="pre_healthins",label = "Health Insurance",choices =list("Yes" = "1. Yes", "No" = "2. No"),selected = "1. Yes" )
    ),
    mainPanel(
      h3('Introduction'),
      helpText('We can predict our wage(salary) using this application.ISLR package wage data base is taken for training the model.',
               'To predict the wage, We need to fillup all the required data in the left side of this web page, immediately data will be send to the server for prediction.',
               'Output of the prediction will be displayed in the right side of the web page, whenever any change in the input data.'),
      helpText('The very first time, output generation may take 20 to 30 seconds because of time required to build the model.'),
      h3('Wage distribution vs Age'),
      plotOutput('wagedistribution'),
      h3('Wage Prediction Output'),
      h4(textOutput("weltext")),
      h4(textOutput("predictedWage"))
    )
  )
)