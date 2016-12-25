#########################################################################################################
#
# Title :  Googly - An interactive app to analyze IPL Players, teams and matches 
# Designed and developed by: Tinniam V Ganesh
# Date : 25 Dec 2016
# File: analyzeIPLBatsmen.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
#Analyze an IPL match
analyzeIPLMatches <- function(match,matchFunc,team,opposition) {

    # Check and get the team indices of IPL teams in which the bowler has played
    IPLmatch <- paste("./IPLmatches/", match,".RData",sep="")
    load(IPLmatch)
    matchDF <- overs
    
    print(matchFunc)
    print(dim(matchDF))
    print(team)
    # Call necessary function
    if(matchFunc == "Match Batting Scorecard"){
        teamBattingScorecardMatch(matchDF,team)
    } else if (matchFunc == "Batting Partnerships"){
        teamBatsmenPartnershipMatch(matchDF,team,opposition)
    } else if (matchFunc == "Batsmen vs Bowlers"){
        teamBatsmenVsBowlersMatch(matchDF,team,opposition)
    }  else if (matchFunc == "Bowling Scorecard"){
        teamBowlingScorecardMatch(matchDF,team)    
    } else if (matchFunc == "Bowling Wicket Kind"){
        teamBowlingWicketKindMatch(matchDF,team,opposition)
    } else if (matchFunc == "Bowling Wicket Runs"){
        teamBowlingWicketRunsMatch(matchDF,team,opposition)
    } else if (matchFunc == "Bowling Wicket Match"){
        teamBowlingWicketMatch(matchDF,team,opposition)
    } else if (matchFunc == "Bowler vs Batsmen"){
        teamBowlersVsBatsmenMatch(matchDF,team,opposition)
    } else if (matchFunc == "Match Worm Graph"){
        matchWormGraph(matchDF,team,opposition)
    }

    
}

