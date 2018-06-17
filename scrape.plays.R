library("jsonlite")

transition.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Transition&limit=500&names=offensive&q=2518943&season=2016&seasonType=Reg"
transition.data.2016 <- fromJSON(transition.url.2016)[[2]]
transition.data.2016$fullName <- paste(transition.data.2016$PlayerFirstName,
                                  transition.data.2016$PlayerLastName,sep=" ")

isolation.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Isolation&limit=500&names=offensive&q=2518943&season=2016&seasonType=Reg"
isolation.data.2016 <- fromJSON(isolation.url.2016)[[2]]
isolation.data.2016$fullName <- paste(isolation.data.2016$PlayerFirstName,
                                 isolation.data.2016$PlayerLastName,sep=" ")

prhandler.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=PRBallHandler&limit=500&names=offensive&q=2518946&season=2016&seasonType=Reg"
prhandler.data.2016 <- fromJSON(prhandler.url.2016)[[2]]
prhandler.data.2016$fullName <- paste(prhandler.data.2016$PlayerFirstName,
                                 prhandler.data.2016$PlayerLastName,sep=" ")

prroll.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=PRRollman&limit=500&names=offensive&q=2518946&season=2016&seasonType=Reg"
prroll.data.2016 <- fromJSON(prroll.url.2016)[[2]]
prroll.data.2016$fullName <- paste(prroll.data.2016$PlayerFirstName,
                              prroll.data.2016$PlayerLastName,sep=" ")

postup.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Postup&limit=500&names=offensive&q=2518946&season=2016&seasonType=Reg"
postup.data.2016 <- fromJSON(postup.url.2016)[[2]]
postup.data.2016$fullName <- paste(postup.data.2016$PlayerFirstName,
                              postup.data.2016$PlayerLastName,sep=" ")

spotup.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Spotup&limit=500&names=offensive&q=2518946&season=2016&seasonType=Reg"
spotup.data.2016 <- fromJSON(spotup.url.2016)[[2]]
spotup.data.2016$fullName <- paste(spotup.data.2016$PlayerFirstName,
                              spotup.data.2016$PlayerLastName,sep=" ")

handoff.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Handoff&limit=500&names=offensive&q=2518946&season=2016&seasonType=Reg"
handoff.data.2016 <- fromJSON(handoff.url.2016)[[2]]
handoff.data.2016$fullName <- paste(handoff.data.2016$PlayerFirstName,
                               handoff.data.2016$PlayerLastName,sep=" ")

cut.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Cut&limit=500&names=offensive&q=2518946&season=2016&seasonType=Reg"
cut.data.2016 <- fromJSON(cut.url.2016)[[2]]
cut.data.2016$fullName <- paste(cut.data.2016$PlayerFirstName,
                           cut.data.2016$PlayerLastName,sep=" ")

offscreen.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Offscreen&limit=500&names=offensive&q=2518946&season=2016&seasonType=Reg"
offscreen.data.2016 <- fromJSON(offscreen.url.2016)[[2]]
offscreen.data.2016$fullName <- paste(offscreen.data.2016$PlayerFirstName,
                                 offscreen.data.2016$PlayerLastName,sep=" ")

putback.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=OffRebound&limit=500&names=offensive&q=2518947&season=2016&seasonType=Reg"
putback.data.2016 <- fromJSON(putback.url.2016)[[2]]
putback.data.2016$fullName <- paste(putback.data.2016$PlayerFirstName,
                               putback.data.2016$PlayerLastName,sep=" ")

misc.url.2016 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Misc&limit=500&names=offensive&q=2518946&season=2016&seasonType=Reg"
misc.data.2016 <- fromJSON(misc.url.2016)[[2]]
misc.data.2016$fullName <- paste(misc.data.2016$PlayerFirstName,
                            misc.data.2016$PlayerLastName,sep=" ")

transition.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Transition&limit=500&names=offensive&q=2518943&season=2017&seasonType=Reg"
transition.data.2017 <- fromJSON(transition.url.2017)[[2]]
transition.data.2017$fullName <- paste(transition.data.2017$PlayerFirstName,
                                  transition.data.2017$PlayerLastName,sep=" ")

isolation.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Isolation&limit=500&names=offensive&q=2518943&season=2017&seasonType=Reg"
isolation.data.2017 <- fromJSON(isolation.url.2017)[[2]]
isolation.data.2017$fullName <- paste(isolation.data.2017$PlayerFirstName,
                                 isolation.data.2017$PlayerLastName,sep=" ")

prhandler.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=PRBallHandler&limit=500&names=offensive&q=2518946&season=2017&seasonType=Reg"
prhandler.data.2017 <- fromJSON(prhandler.url.2017)[[2]]
prhandler.data.2017$fullName <- paste(prhandler.data.2017$PlayerFirstName,
                                 prhandler.data.2017$PlayerLastName,sep=" ")

prroll.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=PRRollman&limit=500&names=offensive&q=2518946&season=2017&seasonType=Reg"
prroll.data.2017 <- fromJSON(prroll.url.2017)[[2]]
prroll.data.2017$fullName <- paste(prroll.data.2017$PlayerFirstName,
                              prroll.data.2017$PlayerLastName,sep=" ")

postup.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Postup&limit=500&names=offensive&q=2518946&season=2017&seasonType=Reg"
postup.data.2017 <- fromJSON(postup.url.2017)[[2]]
postup.data.2017$fullName <- paste(postup.data.2017$PlayerFirstName,
                              postup.data.2017$PlayerLastName,sep=" ")

spotup.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Spotup&limit=500&names=offensive&q=2518946&season=2017&seasonType=Reg"
spotup.data.2017 <- fromJSON(spotup.url.2017)[[2]]
spotup.data.2017$fullName <- paste(spotup.data.2017$PlayerFirstName,
                              spotup.data.2017$PlayerLastName,sep=" ")

handoff.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Handoff&limit=500&names=offensive&q=2518946&season=2017&seasonType=Reg"
handoff.data.2017 <- fromJSON(handoff.url.2017)[[2]]
handoff.data.2017$fullName <- paste(handoff.data.2017$PlayerFirstName,
                               handoff.data.2017$PlayerLastName,sep=" ")

cut.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Cut&limit=500&names=offensive&q=2518946&season=2017&seasonType=Reg"
cut.data.2017 <- fromJSON(cut.url.2017)[[2]]
cut.data.2017$fullName <- paste(cut.data.2017$PlayerFirstName,
                           cut.data.2017$PlayerLastName,sep=" ")

offscreen.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Offscreen&limit=500&names=offensive&q=2518946&season=2017&seasonType=Reg"
offscreen.data.2017 <- fromJSON(offscreen.url.2017)[[2]]
offscreen.data.2017$fullName <- paste(offscreen.data.2017$PlayerFirstName,
                                 offscreen.data.2017$PlayerLastName,sep=" ")

putback.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=OffRebound&limit=500&names=offensive&q=2518947&season=2017&seasonType=Reg"
putback.data.2017 <- fromJSON(putback.url.2017)[[2]]
putback.data.2017$fullName <- paste(putback.data.2017$PlayerFirstName,
                               putback.data.2017$PlayerLastName,sep=" ")

misc.url.2017 <- "https://stats-prod.nba.com/wp-json/statscms/v1/synergy/player/?category=Misc&limit=500&names=offensive&q=2518946&season=2017&seasonType=Reg"
misc.data.2017 <- fromJSON(misc.url.2017)[[2]]
misc.data.2017$fullName <- paste(misc.data.2017$PlayerFirstName,
                            misc.data.2017$PlayerLastName,sep=" ")

play.types <- c("transition", "isolation", "prhandler", "prroll", "postup", "spotup",
                "handoff", "cut", "offscreen", "putback", "misc")
for (p in play.types) {
    name.2016 <- paste0(p,".data.2016")
    p.df.2016 <- eval(parse(text=name.2016))[,c("fullName", "Poss", "PPP", "Time")]
    names(p.df.2016)[2:4] <- paste0(p,names(p.df.2016[2:4]))
    name.2017 <- paste0(p,".data.2017")
    p.df.2017 <- eval(parse(text=name.2017))[,c("fullName", "Poss", "PPP", "Time")]
    names(p.df.2017)[2:4] <- paste0(p,names(p.df.2017[2:4]))
    if (!exists("all.plays.2016")) {
        all.plays.2016 <- p.df.2016
        all.plays.2017 <- p.df.2017
    } else {
        all.plays.2016 <- merge(all.plays.2016, p.df.2016, all=TRUE, by="fullName")
        all.plays.2017 <- merge(all.plays.2017, p.df.2017, all=TRUE, by="fullName")
    }
}
all.plays.2016[is.na(all.plays.2016)] <- 0
all.plays.2017[is.na(all.plays.2017)] <- 0

saveRDS(all.plays.2016,"./data/plays.2016.17.rds")
saveRDS(all.plays.2017,"./data/plays.2017.18.rds")
