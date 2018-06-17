source("helpers.R")

shinyServer(function(input, output) {

    output$graph1 <- renderPlot({
<<<<<<< HEAD
        compare_plays(input$p1,input$p2)
    })
    output$graph2 <- renderPlot({
        compare_stats(input$p1,input$p2)
    })
    output$player <- renderUI({
        players <- playerComps[[input$p1]][["Name"]]
        selectizeInput("p2",
                       label="Choose a comparison player",
                       choices=players,
                       selected=NULL)
    })
})
=======
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

>>>>>>> 65e58e87eefa8b378e737b59b425b4d91a35ce19
