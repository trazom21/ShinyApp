library(shiny)

shinyUI(fluidPage(
  titlePanel("Simulations of probability distributions"),
  fluidRow(
    column(4, wellPanel(
      sliderInput("n", "N:", min = 10, max = 1000, value = 500, step = 10),
      selectInput("inDistribution", "Select distribution:", c("Normal", "Exponential", "Poisson", "Uniform")),
      submitButton("Submit")
    )),
    column(4, wellPanel(
      uiOutput("ui_input"),
      submitButton("Submit")
    )),
    column(6,
      plotOutput("ui_graph", width = 400, height = 300)
    )
  )
))
