library(rvest)
library(magrittr)
library(XML)
library(jsonlite)

# 2017-18
url.17.18 <- "https://www.basketball-reference.com/leagues/NBA_2018_advanced.html"
webpage.17.18 <- read_html(url.17.18)
players.advanced.17.18 <- webpage.17.18 %>% html_nodes("table") %>% html_table %>% as.data.frame()

players.advanced.17.18 <- players.advanced.17.18[players.advanced.17.18$Player != "Player",]
players.advanced.17.18 <- players.advanced.17.18[!duplicated(players.advanced.17.18$Player),]
players.advanced.17.18$Pos[which(players.advanced.17.18$Pos == "PF-C")] <- "C"

player.html.17.18 <- webpage.17.18 %>% html_nodes("table") %>% html_nodes("tr") %>% html_nodes("td") %>% html_nodes("a")
player.html.unique.17.18 <- unique(player.html.17.18)
player.dictionary.17.18 <- as.character(player.html.17.18)
player.dictionary.17.18 <- unique(player.dictionary.17.18[grepl("players",player.dictionary.17.18)])
player.names.17.18 <- unlist(lapply(player.dictionary.17.18, function(x) unlist(strsplit(x,">"))[2]))
player.names.17.18 <- unlist(lapply(player.names.17.18, function(x) substr(x,1,nchar(x)-3)))

player.ids.17.18 <- unlist(lapply(player.dictionary.17.18, function(x) unlist(strsplit(x,"/"))[4]))
player.ids.17.18 <- unlist(lapply(player.ids.17.18, function(x) unlist(strsplit(x,"[.]"))[1]))

players.17.18 <- data.frame(player.names.17.18, player.ids.17.18)
players.17.18$player.ids <- as.character(players.17.18$player.ids)

player.urls.17.18 <- paste0("https://www.basketball-reference.com/players/",
                     substr(player.ids.17.18,1,1), "/",
                     player.ids.17.18,
                     ".html")


# 2017-18
for (url in player.urls.17.18) {
    print(url)
    h <- read_html(url)
    totals <- h %>% html_nodes(xpath = '//comment()') %>%    # select comment nodes
        html_text() %>%    # extract comment text
        paste(collapse = '') %>%    # collapse to a single string
        read_html() %>%    # reparse to HTML
        html_node('table#totals') %>%    # select the desired table
        html_table()
    shots <- totals[totals$Season == "2017-18",c("FGA")][1]
    if (shots > 10 | is.na(shots)) {
        advanced <- h %>% html_nodes(xpath = '//comment()') %>%    # select comment nodes
            html_text() %>%    # extract comment text
            paste(collapse = '') %>%    # collapse to a single string
            read_html() %>%    # reparse to HTML
            html_node('table#advanced') %>%    # select the desired table
             html_table()
        shooting <- h %>% html_nodes(xpath = '//comment()') %>%    # select comment nodes
            html_text() %>%    # extract comment text
            paste(collapse = '') %>%    # collapse to a single string
            read_html() %>%    # reparse to HTML
            html_node('table#shooting') %>%    # select the desired table
            html_table()
        ftp.17.18.games.minutes <- totals[totals$Season == "2017-18",c("G","MP","FT%")][1,]
        ftr.17.18 <- advanced[advanced$Season == "2017-18",c("FTr")][1]
        shooting.17.18 <- shooting[shooting[,1] == "2017-18",c(11:15,17:21)][1,]
        colnames(shooting.17.18) <- c("perc.0.3","perc.3.10","perc.10.16","perc.16.3","perc.3",
                                      "0.3.perc","3.10.perc","10.16.perc","16.3.perc","3.perc")
        stats <- cbind(url,ftp.17.18.games.minutes,ftr.17.18,shooting.17.18)
        if(!exists("locations.df.17.18")) {
            locations.df.17.18 <- stats
        } else {
            locations.df.17.18 <- rbind(locations.df.17.18,stats)
        }
    } else {
        next
    }
}

# 2017-18
locations.df.17.18$url <- as.character(locations.df.17.18$url)
locations.df.17.18$player.id <- substr(locations.df.17.18$url,48,nchar(locations.df.17.18$url)-5)
locations.df.17.18 <- merge(locations.df.17.18, players.17.18, by.x="player.id", by.y="player.ids")

stats.df.17.18 <- merge(players.advanced.17.18[,c("Player","Pos","TS.","USG.")],locations.df.17.18,by.x="Player",by.y="player.names.17.18")

for (i in c(3:4,7:20)) {
    stats.df.17.18[,i] <- as.numeric(stats.df.17.18[,i])
}


# Save Data-Frame
saveRDS(stats.df.17.18, "./data/stats.2017.18.rds")
