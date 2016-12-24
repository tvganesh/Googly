load("./data/batsmen.RData")
IPLBatsmen <-b

load("./data/bowlers.RData")
IPLBowlers <-b

a <-list.files("IPLmatches/")
IPLMatches <- gsub(".RData","",a)

a <-list.files("IPLMatches2teams/")
IPLMatches2Teams <- gsub(".RData","",a)

a <-list.files("allMatchesallOppn/")
IPLTeamsAll <- gsub(".RData","",a)