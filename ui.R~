shooting <- readRDS("data/shooting.16.18.rds")
players <- levels(factor(shooting$Player.y))
time <- format(file.mtime("data/shooting.16.18.rds"),"%b %d, %Y %H:%M",tz="EST")

bootstrapPage(
    fluidRow(
        column(12, align="center",
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
    ),
    fluidRow(
        column(12, align="center",
               plotOutput("graph1",width="85%"))
    ),
    fluidRow(
        column(12, align="center",
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

)
