analyzeIPLTeamPerfOverall <- function(matches,matchFunc,team,rankV) {
    
    # Check and get the team indices of IPL teams in which the bowler has played
    IPLmatch <- paste("./allMatchesallOppn/", matches,".RData",sep="")
    load(IPLmatch)
    matchesDF <- matches
    
    print(matchFunc)
    print(dim(matchesDF))
    print(team)
    print(rankV)
    
    if(matchFunc == "Team Batting Scorecard Overall"){
        teamBattingScorecardAllOppnAllMatches(matchesDF,team)
    } else if (matchFunc == "Team Batsmen Partnerships Overall"){
        teamBatsmenPartnershipAllOppnAllMatchesPlot(matchesDF,team,main=team)
        
    } else if (matchFunc == "Team Batsmen vs Bowlers Overall"){
        df <- teamBatsmenVsBowlersAllOppnAllMatchesRept(matchesDF,team,rank=as.integer(rankV),dispRows = 20)
        teamBatsmenVsBowlersAllOppnAllMatchesPlot(df)
        
    }  else if (matchFunc == "Team Bowler vs Batsmen Overall"){
        df <- teamBowlersVsBatsmenAllOppnAllMatchesRept(matchesDF,team,rank=as.integer(rankV))  
        teamBowlersVsBatsmenAllOppnAllMatchesPlot(df,team,team)
        
  
    } else if (matchFunc == "Team Bowler Wicket Kind Overall"){
        teamBowlingWicketKindAllOppnAllMatches(matchesDF,team,"All")

    }
    
}
