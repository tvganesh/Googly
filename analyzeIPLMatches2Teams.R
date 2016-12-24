analyzeIPLMatches2Teams <- function(match2,matchFunc,team,opposition) {
    
    # Check and get the team indices of IPL teams in which the bowler has played
    getwd()
    IPLmatch <- paste("./IPLMatches2Teams/", match2,".RData",sep="")
    print(IPLmatch)
    load(IPLmatch)
    matchesDF <- matches
    
    print(matchFunc)
    print(dim(matchesDF))
    print(team)
    print(opposition)
    
    if(matchFunc == "Team Batting Scorecard All Matches"){
        teamBattingScorecardOppnAllMatches(matchesDF,team)
    } else if (matchFunc == "Team Batsmen Batting Partnerships All Matches"){
        teamBatsmenPartnershipOppnAllMatchesChart(matchesDF,team,opposition)
    } else if (matchFunc == "Team Batsmen vs Bowlers all Matches"){
        teamBatsmenVsBowlersOppnAllMatches(matchesDF,team,opposition)
    }  else if (matchFunc == "Team Bowling Performance All Matches"){
        teamBowlingPerfOppnAllMatches(matchesDF,team)    
    } else if (matchFunc == "Team Wickets Opposition All Matches"){
        teamBowlersWicketsOppnAllMatches(matchesDF,team,opposition)
    } else if (matchFunc == "Team Bowler vs Batsmen All Matches"){
        teamBowlersVsBatsmenOppnAllMatches(matchesDF,team,opposition)
    } else if (matchFunc == "Team Bowlers Wicket Kind All Matches"){
        teamBowlersWicketKindOppnAllMatches(matchesDF,team,opposition)
    } else if (matchFunc == "Team Bowler Wicket Runs All Matches"){
        teamBowlersWicketRunsOppnAllMatches(matchesDF,team,opposition)
    } else if (matchFunc == "Win Loss All Matches"){
        plotWinLossBetweenTeams(team,opposition,"./IPLmatches")
    }
   
    
}

