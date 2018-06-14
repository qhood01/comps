source("helpers.R")

shinyServer(function(input, output) {

    output$graph1 <- renderPlot({
        reference = "self"
        if (input$var2 == "League Average") {
            reference = "league"
        } else if (input$var2 == "Positional Median")  {
            reference = "position"
        }
        player_yoy(player=input$var1,ref=reference)
    })
    output$graph2 <- renderPlot({
        plot_plays(input$var1)
    })
    output$table <- renderDataTable({
        display()
    })
})

