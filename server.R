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
    
    #analyzeIPLBatsmen(input$batsman,input$batsmanFunc)
    # Analyze and display batsmen plots
    output$batsmanPlot <- renderPlot({  
        #Load IPL Batsmen
        
        # Load all IPL batsmen
        analyzeIPLBatsmen(input$batsman,input$batsmanFunc)
        
    })
    
    output$bowlerPlot <- renderPlot({  
        #Load IPL Batsmen
        
        # Load all IPL batsmen
        analyzeIPLBowlers(input$bowler,input$bowlerFunc)
        
    })
    output$IPLMatchPlot <- renderPlot({  
        m <- strsplit(as.character(input$match),"-")
        print(m[[1]][1])
        print(m[[1]][2])
        
        teams <- c(m[[1]][1],m[[1]][2])
        print(teams)
        
        # Load all IPL batsmen
        output$selectTeam <- renderUI({ 
            selectInput('team', 'Choose team',choices=teams,selected=input$team)
        })
        print(input$team)
        otherTeam = setdiff(teams,input$team)
        print(otherTeam)
        analyzeIPLMatches(input$match,input$matchFunc,input$team,otherTeam)
        
    })
    
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
    
    output$IPLTeamPerfOverall <- renderPlot({  
        rankValues <- c(1,2,3,4,5,6)
        
        output$Rank = renderUI({
            selectInput('rank', 'Choose the rank',choices=rankValues,selected=input$rank)
        })
        
        print(input$teamMatches)
        n <- strsplit(as.character(input$teamMatches),"-")
        
        print(n[[1]][2])
        analyzeIPLTeamPerfOverall(input$teamMatches,input$overallperfFunc,n[[1]][2],input$rank)
        
    })
    
    
})
