library(rlist)
plays <- readRDS("./data/plays.2017.18.rds")[-229,]

playerPlayComps <- list()
timeCols <- names(plays)[grepl("Time",names(plays))]
for (p1 in plays$fullName) {
    print(p1)
    compDF <- data.frame("Name"=rep(NA,nrow(plays)-1),"Score"=rep(NA,nrow(plays)-1))
    index <- 1
    for (p2 in plays$fullName[which(plays$fullName != p1)]) {
        p1Cols <- plays[plays$fullName == p1,timeCols]
        p2Cols <- plays[plays$fullName == p2,timeCols]
        sumDiff <- sum(abs(p1Cols-p2Cols))
        index <- which(is.na(compDF$Name))[1]
        compDF[index,"Name"] <- p2
        compDF[index,"Score"] <- sumDiff
        index <- index+1
    }
    compDF <- compDF[order(compDF$Score),]
    playerPlayComps[[p1]] <- compDF
}
list.save(playerPlayComps,"./data/comparison.rds")

## shootingCols <- c("Player.y","perc.0.3.y","perc.3.10.y","perc.10.16.y","perc.16.3.y","perc.3.y")
## shooting18 <- shooting[,shootingCols]
## names(shooting18) <- gsub("[.]y","",names(shooting18))
## playerShootingComps <- list()
## for (p1 in shooting18$Player) {
##     print(p1)
##     compDF <- data.frame("Name"=rep(NA,5),"Score"=rep(NA,5))
##     for (p2 in shooting18$Player[which(shooting18$Player != p1)]) {
##         sumDiff <- sum(abs(shooting18[shooting18$Player == p1,-1] - shooting18[shooting18$Player == p2,-1]))
##         if (length(which(is.na(compDF$Name))) == 0) {
##             ## comparisons are full, check minimum
##             max <- max(compDF$Score)
##             ## if minimum is greater than new difference, add new difference
##             ## else, do nothing
##             if (max > sumDiff) {
##                 compDF$Name[which(compDF$Score == max)] <- p2
##                 compDF$Score[which(compDF$Score == max)] <- sumDiff
##             }
##         } else {
##             ## comparisons are not full, enter at next available spot
##             ## index is first empty row
##             index <- which(is.na(compDF$Name))[1]
##             compDF[index,"Name"] <- p2
##             compDF[index,"Score"] <- sumDiff
##         }
##     }
##     compDF <- compDF[order(compDF$Score),]
##     playerShootingComps[[p1]] <- compDF
## }

