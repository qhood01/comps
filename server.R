source("helpers.R")

shinyServer(function(input, output) {
    output$graph <- renderPlot({
        player_yoy(player=input$var1)
    })
    output$table <- renderDataTable({
        display()
    })
})

