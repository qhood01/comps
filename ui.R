shooting <- readRDS("data/shooting.16.17.rds")
players <- levels(factor(shooting$Player))

shinyUI(fluidPage(
    titlePanel("Player Shot Profile"),

    sidebarLayout(
        sidebarPanel(
            helpText("Select a Player"),

            selectizeInput("var1",
                           label="Choose a player",
                           choices = players,
                           selected = NULL)

        ),

        mainPanel(plotOutput("graph"))
    )
))
