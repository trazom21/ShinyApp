library(shiny)

shinyServer(function(input, output) {
  
  output$ui_input <- renderUI({
    if (is.null(input$inDistribution))
      return()
    
    switch(input$inDistribution,
           "Normal" = list(numericInput("m", "Mean", value = input$m),
                      numericInput("s", "Standard Deviation", value = input$s)),
           "Exponential" = numericInput("rate", "Rate", value = input$rate, min=0.1, max=10),
           "Poisson" = numericInput("lambda", "Lambda", value = input$lambda, min=0.1, max=10),
           "Uniform" = list(numericInput("m1", "Min", value = input$m1),
                           numericInput("m2", "Max", value = input$m2))
    )
  })
  
  output$ui_graph <- renderPlot({  
    if(input$inDistribution == "Normal" && !is.null(input$m))
      hist(rnorm(input$n, mean=input$m, sd=input$s))
    else if(input$inDistribution == "Exponential" && !is.null(input$rate))
      hist(rexp(input$n, rate=input$rate))
    else if(input$inDistribution == "Poisson" && !is.null(input$lambda))
      hist(rpois(input$n, lambda=input$lambda))
    else if(input$inDistribution == "Uniform" && !is.null(input$m1))
      hist(runif(input$n, min=input$m1, max=input$m2))
    else return()
  })
})
