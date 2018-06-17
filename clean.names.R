plays <- readRDS("./data/plays.2017.18.rds")
stats <- readRDS("./data/stats.2017.18.rds")

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
stats$Player[which(stats$Player %in% jrs)] <- paste0(jrs, " Jr.")

IIIs <- c("Glenn Robinson", "James Webb", "Johnny O'Bryant", "Terry Rozier")
stats$Player[which(stats$Player %in% IIIs)] <- paste0(IIIs, " III")

plays$fullName[which(plays$fullName == "De Aaron Fox")] <- "De'Aaron Fox"
plays$fullName[which(plays$fullName == "DAngelo Russell")] <- "D'Angelo Russell"

plays$fullName[which(plays$fullName == "Larry Nance Jr")] <- "Larry Nance Jr."
stats$Player[which(stats$Player == "Larry Nance")] <- "Larry Nance Jr."

plays$fullName <- gsub("Malcom","Malcolm",plays$fullName)

plays$fullName[which(plays$fullName == "Taurean Prince")] <- "Taurean Waller-Prince"

plays$fullName <- gsub("Beverly","Beverley",plays$fullName)

plays$fullName <- gsub("ONeale","O'Neale",plays$fullName)

stats$Player[which(stats$Player == "Timothe Luwawu-Cabarrot")] <- "Timothé Luwawu-Cabarrot"

stats$Player[which(stats$Player == "Skal Labissiere")] <- "Skal Labissière"

saveRDS(plays,"./data/plays.2017.18.rds")
saveRDS(stats,"./data/stats.2017.18.rds")
