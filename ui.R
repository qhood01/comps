<<<<<<< HEAD
plays <- readRDS("./data/plays.2017.18.rds")
players <- sort(plays$fullName)
=======
shooting <- readRDS("data/shooting.16.18.rds")
players <- levels(factor(shooting$Player.y))
time <- format(file.mtime("data/shooting.16.18.rds"),"%b %d, %Y %H:%M",tz="EST")
>>>>>>> 65e58e87eefa8b378e737b59b425b4d91a35ce19

bootstrapPage(
    fluidRow(
        column(12, align="center",
<<<<<<< HEAD
               titlePanel("Player Play Type Comparison"))
    ),
    fluidRow(
        column(12, align="center",
               selectizeInput("p1",
                              label="Choose a player",
                              choices = players,
                              selected = "Kristaps Porzingis")),
        column(12, align="center",
               uiOutput("player"))
=======
               titlePanel("Player Shot Profile"))
    ),
    fluidRow(
        column(12, align="center",
               selectizeInput("var1",
                              label="Choose a player",
                              choices = players,
                              selected = "Kristaps Porzingis"))
    ),
    fluidRow(
        column(12, align="center",
               radioButtons("var2",
                            label="Choose a reference",
                            choices = c("League Average",
                                        "Player's Previous Year",
                                        "Positional Median")))
>>>>>>> 65e58e87eefa8b378e737b59b425b4d91a35ce19
    ),
    fluidRow(
        column(12, align="center",
               plotOutput("graph1",width="85%"))
    ),
    fluidRow(
        column(12, align="center",
<<<<<<< HEAD
               plotOutput("graph2",width="85%"))
    )
=======
               a(href="https://www.basketball-reference.com/",
                 "Data Source: Basketball Reference",target="_blank"))
    ),
    fluidRow(
        column(12, align="center",
               plotOutput("graph2",width="85%"))
    ),
    fluidRow(
        column(12, align="center",
               h5(paste0("Last Updated ",time," EST")))
    ),
    fluidRow(
        column(12, align="center",
               dataTableOutput("table"))
    )

>>>>>>> 65e58e87eefa8b378e737b59b425b4d91a35ce19
)
