load("./data/batsmen.RData")
IPLBatsmen <-b

load("./data/bowlers.RData")
IPLBowlers <-b

a <-list.files("IPLmatches/")
IPLMatches <- gsub(".RData","",a)

a1 <-list.files("IPLMatches2Teams/")
IPLMatches2Teams <- gsub(".RData","",a1)

a2 <-list.files("allMatchesallOppn/")
IPLTeamsAll <- gsub(".RData","",a2)
