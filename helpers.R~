stats.df.16.18 <- readRDS("data/shooting.16.18.rds")
league.average.17.18 <- readRDS("data/league.average.17.18.rds")
adv.average.17.18 <- readRDS("data/adv.average.17.18.rds")
cols <- c(22,8,28,4,24,5,25,43,44)
names <- c("Name", "Minutes 16-17", "Minutes 17-18", "TS 16-17", "TS 17-18",
           "USG 16-17", "USG 17-18", "TS Change", "USG Change")
all.plays.2016 <- readRDS("data/plays.2016.rds")
all.plays.2017 <- readRDS("data/plays.2017.rds")
play.types <- c("transition", "isolation", "prhandler", "prroll", "postup", "spotup",
                "handoff", "cut", "offscreen", "putback", "misc")
stats.min <- stats.df.16.18[which(stats.df.16.18$MP.y >= quantile(stats.df.16.18$MP.y,
                                                                  c(.1))),]
med.0.3.perc <- aggregate(stats.min[,'0.3.perc.y'],by=list(stats.min$Pos.y),median,
                     na.rm=TRUE)
med.3.10.perc <- aggregate(stats.min[,'3.10.perc.y'],by=list(stats.min$Pos.y),median,
                     na.rm=TRUE)
med.10.16.perc <- aggregate(stats.min[,'10.16.perc.y'],by=list(stats.min$Pos.y),median,
                     na.rm=TRUE)
med.16.3.perc <- aggregate(stats.min[,'16.3.perc.y'],by=list(stats.min$Pos.y),median,
                     na.rm=TRUE)
med.3.perc <- aggregate(stats.min[,'3.perc.y'],by=list(stats.min$Pos.y),median,
                        na.rm=TRUE)
med.perc <- cbind(med.0.3.perc,med.3.10.perc[,-1],med.10.16.perc[,-1],
                  med.16.3.perc[,-1],med.3.perc[,-1])
names(med.perc) <- c("Pos","0.3","3.10","10.16","16.3","3")

perc.med.0.3 <- aggregate(stats.min[,'perc.0.3.y'],by=list(stats.min$Pos.y),median,
                     na.rm=TRUE)
perc.med.3.10 <- aggregate(stats.min[,'perc.3.10.y'],by=list(stats.min$Pos.y),median,
                     na.rm=TRUE)
perc.med.10.16 <- aggregate(stats.min[,'perc.10.16.y'],by=list(stats.min$Pos.y),median,
                     na.rm=TRUE)
perc.med.16.3 <- aggregate(stats.min[,'perc.16.3.y'],by=list(stats.min$Pos.y),median,
                     na.rm=TRUE)
perc.med.3 <- aggregate(stats.min[,'perc.3.y'],by=list(stats.min$Pos.y),median,
                     na.rm=TRUE)
perc.med <- cbind(perc.med.0.3,perc.med.3.10[,-1],perc.med.10.16[,-1],
                  perc.med.16.3[,-1],perc.med.3[,-1])
names(perc.med) <- c("Pos","0.3","3.10","10.16","16.3","3")

player_yoy <- function(player,ref="self") {
    layout(matrix(c(1,2,3,4,4,4), ncol=3, byrow=TRUE), heights=c(6, 1))
    par(mai=c(0.5,0.5,1.0,0.25))
    cols.16.17 <- c(4,5,10,9)
    cols.17.18 <- c(24,25,30,29)
    pos <- stats.df.16.18[stats.df.16.18$Player.y == player,"Pos.y"]
    if (ref == "self") {
        adv.1 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.y == player,cols.16.17])
        s.perc.1 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.y == player,16:20])
        perc.s.1 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.y == player,11:15])
        leg <- c("2016-17", "2017-18")
    } else if (ref == "league") {
        adv.1 <- adv.average.17.18
        s.perc.1 <- as.numeric(league.average.17.18[1,])
        perc.s.1 <- as.numeric(league.average.17.18[2,])
        leg <- c("2017-18 League Avg.", paste0("2017-18 ", player))
    } else {
        adv.1 <- adv.average.17.18
        s.perc.1 <- as.numeric(med.perc[med.perc$Pos == pos,2:6])
        perc.s.1 <- as.numeric(perc.med[perc.med$Pos == pos,2:6])
        leg <- c(paste0("2017-18 ", pos, " Median"), paste0("2017-18 ", player))
    }
    adv.2 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.y == player,cols.17.18])
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
    s.perc.2 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.y == player,36:40])
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
    mtext(player,side=3,line=4,cex=2,font=2)
    #abline(h=1.028,col='Black',lty=2,lwd=2)
    box()
    perc.s.2 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.y == player,31:35])
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
    legend(x="center", ncol=2, legend=leg,
           col=c('#e41a1c','#377eb8'), lty=c(1,1), lwd=c(7,7), cex=2)
}

display <- function() {
    df <- stats.df.16.18[,cols]
    names(df) <- names
    df[,4] <- as.numeric(df[,4])
    df[,5] <- as.numeric(df[,5])
    df[,8] <- as.numeric(df[,8])
    df[,c(4,5,8)] <- 100*df[,c(4,5,8)]
    return(df)
}

plot_plays <- function(name) {
    layout(matrix(c(1,2,3,3), ncol=2, byrow=TRUE), heights=c(6, 1))
    par(mai=c(0.5,0.5,1.0,0.25))
    stats.16 <- all.plays.2016[all.plays.2016$fullName == name,]
    stats.17 <- all.plays.2017[all.plays.2017$fullName == name,]
    perc <- rbind("2016"=as.numeric(stats.16[,grepl("Time",names(stats.16))]),
                  "2017"=as.numeric(stats.17[,grepl("Time",names(stats.17))]))
    colnames(perc) <- play.types
    order <- names(sort(perc[2,],decreasing=TRUE))
    perc <- perc[,order]
    perc[1,] <- as.numeric(perc[1,])
    perc[2,] <- as.numeric(perc[2,])
    barplot(perc[,perc[2,]>5],beside=TRUE,las=2,col=c('#e41a1c','#377eb8'),
            main="Percentage of Possessions by Play Type")
    box()
    ppp <- rbind("2016"=as.numeric(stats.16[,grepl("PPP",names(stats.16))]),
                  "2017"=as.numeric(stats.17[,grepl("PPP",names(stats.17))]))
    colnames(ppp) <- play.types
    ppp <- ppp[,order]
    ppp[1,] <- as.numeric(ppp[1,])
    ppp[2,] <- as.numeric(ppp[2,])
    barplot(ppp[,perc[2,]>5],beside=TRUE,las=2,col=c('#e41a1c','#377eb8'),
            main="Points per Possession by Play Type")
    box()
    par(mai=c(0,0,0,0))
    plot.new()
    legend(x="center", ncol=2, legend=c("2016-17","2017-18"),
           col=c('#e41a1c','#377eb8'), lty=c(1,1), lwd=c(4,4), cex=1)
}
