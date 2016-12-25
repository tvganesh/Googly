#########################################################################################################
#
# Title : Sixer - cricketr's Shiny avatar
# Designed and developed by: Tinniam V Ganesh
# Date : 28 Nov 2015
# File: server.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
library(shiny)
library(yorkr)
library(rpart)
library(dplyr)
library(ggplot2)
library(rpart.plot)

# Source files

source("definitions.R")
source("funcs.R")
source("analyzeIPLBatsmen.R")
source("analyzeIPLBowlers.R")
source("analyzeIPLMatches.R")
source("analyzeIPLMatches2Teams.R")
source("analyzeIPLTeamPerfOverall.R")
shinyServer(function(input, output,session) {
    
   
    
    output$IPLMatch2TeamsPlot <- renderPlot({  
        p <- strsplit(as.character(input$match2),"-")
        #print(p[[1]][1])
        #print(p[[1]][2])
        
        teams2 <- c(p[[1]][1],p[[1]][2])
        print(teams2)
     
        #teams2=c("Chennai Super Kings","Deccan Chargers")
        
        # Load all IPL batsmen
        output$selectTeam2 <- renderUI({ 
            selectInput('team2', 'Choose team',choices=teams2,selected=input$team2)
        })
        
        otherTeam = setdiff(teams2,input$team2)
        
        #print("Next")
        print(otherTeam)
        print(input$team2)
        analyzeIPLMatches2Teams(input$match2,input$matches2TeamFunc,input$team2,otherTeam)
        
    })
    
    
})
