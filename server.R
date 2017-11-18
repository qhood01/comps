source("helpers.R")

shinyServer(function(input, output) {

    output$graph <- renderPlot({
        reference = "self"
        if (input$var2 == "League Average") {
            reference = "league"
        }
        player_yoy(player=input$var1,ref=reference)
    })
    output$table <- renderDataTable({
        display()
    })
})

