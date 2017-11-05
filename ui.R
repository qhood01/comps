shooting <- readRDS("data/shooting.16.18.rds")
players <- levels(factor(shooting$Player.x))

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
               plotOutput("graph",width="85%"))
    )
)
