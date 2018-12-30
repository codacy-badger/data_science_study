# Created in RStudio
# templates can be found at http://shiny.rstudio.com/gallery/

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

  #fluidPage has three sections, title, sidebar and main
  #HTML: h1, h2, h3, p, a, br, strong, em, div, code, img
  # names(tags)
  #h1 or Tags$h1()

  titlePanel("Hello Shiny"),

  sidebarLayout(
    position = "right",
    sidebarPanel(
      sliderInput(inputId = "num", label = "Select a number", value = 20, min = 1,
                  max = 50)
    ),

    mainPanel(
      #two ways to use html - some require `tags$`
      h1("Distribution plot"),
      tags$h4("Big Data University"),
      plotOutput(outputId = "hist")
    )
  )

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
