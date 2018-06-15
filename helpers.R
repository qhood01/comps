plays <- readRDS("./data/plays.2017.rds")
playerComps <- readRDS("./data/comparison.rds")
stats <- readRDS("./data/shooting.16.18.rds")

statsCols <- c("Player.y","TS..y","USG..y","FT%.y","ftr.17.18","perc.0.3.y","perc.3.10.y","perc.10.16.y","perc.16.3.y","perc.3.y","0.3.perc.y","3.10.perc.y","10.16.perc.y","16.3.perc.y","3.perc.y")
stats18 <- stats[,statsCols]
names(stats18) <- gsub("[.]y","",names(stats18))

## Remove double spaces
plays$fullName <- gsub("  "," ",plays$fullName)

plays$fullName <- gsub("CJ","C.J.",plays$fullName)
plays$fullName <- gsub("PJ","P.J.",plays$fullName)
plays$fullName <- gsub("JJ","J.J.",plays$fullName)
plays$fullName <- gsub("TJ","T.J.",plays$fullName)
plays$fullName <- gsub("JR","J.R.",plays$fullName)
plays$fullName <- gsub("DJ","D.J.",plays$fullName)
plays$fullName <- gsub("Al Farouq","Al-Farouq",plays$fullName)

jrs <- c("Dennis Smith", "Derrick Jones", "Kelly Oubre", "Otto Porter", "Tim Hardaway")
stats18$Player[which(stats18$Player %in% jrs)] <- paste0(jrs, " Jr.")

IIIs <- c("Glenn Robinson", "James Webb", "Johnny O'Bryant", "Terry Rozier")
stats18$Player[which(stats18$Player %in% IIIs)] <- paste0(IIIs, " III")

play.types <- c("transition", "isolation", "prhandler", "prroll", "postup", "spotup",
                "handoff", "cut", "offscreen", "putback", "misc")

compare_stats <- function(name1,name2) {
    layout(matrix(c(1,2,3,4,4,4), ncol=3, byrow=TRUE), heights=c(6, 1))
    par(mai=c(0.5,0.5,1.0,0.25))

    advCols <- c(2,3,5,4)
    ppsCols <- 11:15
    percCols <- 6:10

    adv.1 <- as.numeric(stats18[tolower(stats18$Player) == tolower(name1),advCols])
    s.perc.1 <- as.numeric(stats18[tolower(stats18$Player) == tolower(name1),ppsCols])
    perc.s.1 <- as.numeric(stats18[tolower(stats18$Player) == tolower(name1),percCols])

    adv.2 <- as.numeric(stats18[tolower(stats18$Player) == tolower(name2),advCols])
    adv <- t(data.frame(adv.1,adv.2))
    adv[,c(1,3,4)] <- 100*adv[,c(1,3,4)]
    adv[is.na(adv)] <- 0
    colnames(adv) <- c("TS%","USG%","FTR","FT%")
    ylim <- max(adv)*1.1
    bp <- barplot(adv, col=c('#e41a1c','#377eb8'), beside=TRUE,
                  ylab="", ylim=c(0,ylim), cex.axis=1.5, cex.names=1.5, font=2)
    text(x=bp,y=adv,labels=adv,pos=3,cex=1.5)
    mtext("Advanced Stats",side=3,line=1,cex=1.5)
    box()
    league.pps <- 1.028
    s.perc.2 <- as.numeric(stats18[tolower(stats18$Player) == tolower(name2),ppsCols])
    s.perc <- t(data.frame(s.perc.1,s.perc.2))
    pps <- cbind(2*s.perc[,1:4],3*s.perc[,5])
    pps <- pps
    pps[is.na(pps)] <- 0
    ylim <- max(pps)*1.1
    colnames(pps) <- c("0-3","3-10","10-16","16<3","3")
    bp <- barplot(pps, col=c('#e41a1c','#377eb8'), beside=TRUE,
                  cex.axis=1.5, cex.names=1.5, font=2, ylim=c(0,ylim))
    text(x=bp,y=pps,labels=round(s.perc*100,1),pos=3,cex=1.4)
    mtext("Shot Distance",side=1,line=3)
    mtext("Points Per Shot",side=2,line=3)
    mtext("Points Per Shot by Location",side=3,line=1,cex=1.5)
    #abline(h=1.028,col='Black',lty=2,lwd=2)
    box()
    perc.s.2 <- as.numeric(stats18[tolower(stats18$Player) == tolower(name2),percCols])
    perc.s <- t(data.frame(perc.s.1,perc.s.2))*100
    perc.s[is.na(perc.s)] <- 0
    ylim <- max(perc.s)*1.1
    colnames(perc.s) <- c("0-3","3-10","10-16","16<3","3")
    bp <- barplot(perc.s, col=c('#e41a1c','#377eb8'), beside=TRUE,
                  cex.axis=1.5, cex.names=1.5, font=2, ylim=c(0,ylim))
    text(x=bp,y=perc.s,labels=perc.s,pos=3,cex=1.4)
    mtext("Shot Distance",side=1,line=3)
    mtext("Percent of Shots",side=2,line=3)
    mtext("Percent of Shots by Location",side=3,line=1,cex=1.5)
    box()
    par(mai=c(0,0,0,0))
    plot.new()
    legend(x="center", ncol=2, legend=c(name1,name2),
           col=c('#e41a1c','#377eb8'), lty=c(1,1), lwd=c(7,7), cex=2)
}

compare_plays <- function(name1,name2) {
    layout(matrix(c(1,2,3,3), ncol=2, byrow=TRUE), heights=c(5, 1))
    par(mai=c(0.5,0.5,1.0,0.25))
    stats.1 <- plays[tolower(plays$fullName) == tolower(name1),]
    stats.2 <- plays[tolower(plays$fullName) == tolower(name2),]
    perc <- rbind(as.numeric(stats.1[,grepl("Time",names(stats.1))]),
                  as.numeric(stats.2[,grepl("Time",names(stats.2))]))
    colnames(perc) <- play.types
    print(perc)
    ##rownames(perc) <- c(name1,name2)
    colOrder <- order(perc[1,],decreasing=TRUE)
    perc <- perc[,colOrder]
    perc[1,] <- as.numeric(perc[1,])
    perc[2,] <- as.numeric(perc[2,])
    barplot(perc[,perc[1,]>5|perc[2,]>5],
            beside=TRUE,las=2,col=c('#e41a1c','#377eb8'),
            main="Percentage of Possessions by Play Type")
    box()
    ppp <- rbind(as.numeric(stats.1[,grepl("PPP",names(stats.1))]),
                 as.numeric(stats.2[,grepl("PPP",names(stats.2))]))
    colnames(ppp) <- play.types
    ##rownames(ppp) <- c(name1,name2)
    ppp <- ppp[,colOrder]
    ppp[1,] <- as.numeric(ppp[1,])
    ppp[2,] <- as.numeric(ppp[2,])
    barplot(ppp[,perc[1,]>5|perc[2,]>5],
            beside=TRUE,las=2,col=c('#e41a1c','#377eb8'),
            main="Points per Possession by Play Type")
    box()
    par(mai=c(0,0,0,0))
    plot.new()
    legend(x="center", ncol=2, legend=c(name1,name2),
           col=c('#e41a1c','#377eb8'), lty=c(1,1), lwd=c(4,4), cex=1)
}
