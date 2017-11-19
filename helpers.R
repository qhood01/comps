print("test1")
stats.df.16.18 <- readRDS("data/shooting.16.18.rds")
league.average.17.18 <- readRDS("data/league.average.17.18.rds")
adv.average.17.18 <- readRDS("data/adv.average.17.18.rds")
cols <- c(22,8,28,4,24,5,25,43,44)
names <- c("Name", "Minutes 16-17", "Minutes 17-18", "TS 16-17", "TS 17-18",
           "USG 16-17", "USG 17-18", "TS Change", "USG Change")

player_yoy <- function(player,ref="self") {
    layout(matrix(c(1,2,3,4,4,4), ncol=3, byrow=TRUE), heights=c(6, 1))
    par(mai=c(0.5,0.5,1.0,0.25))
    cols.16.17 <- c(4,5,10,9)
    cols.17.18 <- c(24,25,30,29)
    if (ref == "self") {
        adv.1 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.y == player,cols.16.17])
        s.perc.1 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.y == player,16:20])
        perc.s.1 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.y == player,11:15])
        leg <- c("2016-17", "2017-18")
    } else {
        adv.1 <- adv.average.17.18
        s.perc.1 <- as.numeric(league.average.17.18[1,])
        perc.s.1 <- as.numeric(league.average.17.18[2,])
        leg <- c("2017-18 League Avg.", paste0("2017-18 ", player))
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
    mtext("Points Per Shot by Location",side=3,line=1)
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

