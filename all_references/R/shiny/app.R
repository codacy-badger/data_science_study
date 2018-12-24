# Created in RStudio
# templates can be found at http://shiny.rstudio.com/gallery/

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

  #input functions() - sliderInput, checkboxInput, numericInput, & textInput
  sliderInput(inputId = "num", label = "Select a number", value = 20, min = 1,
    max = 50), plotOutput(outputId = "hist")

  #output functions()


)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  output$hist <- renderPlot({hist(rnorm(input$num))})

  session$onSessionEnded(function() {
    stopApp()
  })
}

#plotOutput and renderPlot
#tableOutput and renderTable
#textOutput and renderText

# Run the application
shinyApp(ui = ui, server = server)
