stats.df.16.18 <- readRDS("data/shooting.16.17.rds")
pos.medians <- readRDS("data/medians.16.17.rds")

plot_player <- function(player) {
    layout(matrix(c(1,2,3,3), ncol=2, byrow=TRUE), heights=c(7, 1))
    par(mai=c(0.5,1.0,1.5,0.5))
    league.pps <- 1.028
    position <- df[df$Player == player,"Pos"]
    p.s.perc <- as.numeric(df[df$Player == player,16:20])
    m.s.perc <- as.numeric(pos.medians[pos.medians$Position == position,10:14])
    s.perc <- t(data.frame(p.s.perc,m.s.perc))
    pps <- cbind(2*s.perc[,1:4],3*s.perc[,5])
    colnames(pps) <- c("0-3","3-10","10-16","16<3","3")
    barplot(pps, col=c('#e41a1c','#377eb8'), beside=TRUE, main="Points Per Shot By Location",
            ylab="Points Per Shot")
    abline(h=1.028,col='Black',lty=2,lwd=2)
    box()
    p.perc.s <- as.numeric(df[df$Player == player,11:15])
    m.perc.s <- as.numeric(pos.medians[pos.medians$Position == position,5:9])
    perc.s <- t(data.frame(p.perc.s,m.perc.s))*100
    colnames(perc.s) <- c("0-3","3-10","10-16","16<3","3")
    barplot(perc.s, col=c('#e41a1c','#377eb8'), beside=TRUE,
            main="Proportion Of Shots By Location", ylab="Percent Of All Shots")
    mtext(player, side=3, outer=TRUE, line=-3, cex=2)
    box()
    par(mai=c(0,0,0,0))
    plot.new()
    legend(x="center", ncol=3, legend=c(player, paste0(position, " Median"),
                                        "League Average PPS"),
           col=c('#e41a1c','#377eb8',"Black"), lty=c(1,1,2), lwd=c(4,4,2))
}

player_yoy <- function(player) {
    layout(matrix(c(1,2,3,4,4,4), ncol=3, byrow=TRUE), heights=c(6, 1))
    par(mai=c(0.5,0.5,1.0,0.25))
    cols.16.17 <- c(4,5,10,9)
    cols.17.18 <- c(24,25,30,29)
    adv.16.17 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.x == player,cols.16.17])
    adv.17.18 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.x == player,cols.17.18])
    adv <- t(data.frame(adv.16.17,adv.17.18))
    adv[,c(1,3,4)] <- 100*adv[,c(1,3,4)]
      colnames(adv) <- c("TS%","USG%","FTR","FT%")
    barplot(adv, col=c('#e41a1c','#377eb8'), beside=TRUE,
            ylab="")
    mtext("Advanced Stats",side=3,line=1)
    box()
    league.pps <- 1.028
    s.perc.16.17 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.x == player,16:20])
    s.perc.17.18 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.x == player,36:40])
    s.perc <- t(data.frame(s.perc.16.17,s.perc.17.18))
    pps <- cbind(2*s.perc[,1:4],3*s.perc[,5])
    colnames(pps) <- c("0-3","3-10","10-16","16<3","3")
    barplot(pps, col=c('#e41a1c','#377eb8'), beside=TRUE,
            ylab="Points Per Shot", xlab="Shot Distance")
    mtext("Points Per Shot By Location",side=3,line=1)
    mtext(player,side=3,line=4,cex=2)
    abline(h=1.028,col='Black',lty=2,lwd=2)
    box()
    perc.s.16.17 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.x == player,11:15])
    perc.s.17.18 <- as.numeric(stats.df.16.18[stats.df.16.18$Player.x == player,31:35])
    perc.s <- t(data.frame(perc.s.16.17,perc.s.17.18))*100
    colnames(perc.s) <- c("0-3","3-10","10-16","16<3","3")
    barplot(perc.s, col=c('#e41a1c','#377eb8'), beside=TRUE,
            ylab="Percent Of All Shots",
            xlab="Shot Distance")
    mtext("Proportion Of Shots By Location",side=3,line=1)
    box()
    par(mai=c(0,0,0,0))
    plot.new()
    legend(x="center", ncol=3, legend=c("2016-17", "2017-18",
                                        "League Average PPS"),
           col=c('#e41a1c','#377eb8',"Black"), lty=c(1,1,2), lwd=c(4,4,2))
}
