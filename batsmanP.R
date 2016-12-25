batsmanP <- function(matches,main,opposition,plot=TRUE){
    team=batsman=nonStriker=runs=partnershipRuns=totalRuns=NULL
    print("Hi")
    print(dim(matches))
    a <-filter(matches,team==main)
    #Get partnerships
    df <- data.frame(summarise(group_by(a,batsman,nonStriker),sum(runs)))
    names(df) <- c("batsman","nonStriker","runs")
    
    df <- arrange(df,desc(runs))
    
    plot.title = paste(main," Batting partnership ","(against ",opposition," all matches)",sep="")
    if(plot==TRUE){
        # Plot the data
        ggplot(data=df,aes(x=batsman,y=runs,fill=nonStriker))+
            geom_bar(data=df,stat="identity") +
            xlab("Batsman") + ylab("Partnership runs") +
            ggtitle(bquote(atop(.(plot.title),
                                atop(italic("Data source:http://cricsheet.org/"),"")))) +
            theme(axis.text.x = element_text(angle = 90, hjust = 1))
    } else{
        df
    }
    
    
}
