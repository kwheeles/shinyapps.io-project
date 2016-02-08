library(shiny)
shinyUI(fluidPage(   
        titlePanel("European Stock Markets Data: Code on kwheeles github repository"),
        fluidRow(
                column(3, wellPanel(
                        checkboxGroupInput("exch","Exchange Choice:",c("Germany"="DAX","Switzerland"="SMI",
                                         "France"="CAC","United Kingdom"="FTSE"),selected="DAX"),
                        selectInput("dataset","Raw or Indexed to Base Period", c("Raw", "Indexed"),
                                        selected ="Raw"),
                        submitButton("Draw New Graph")
                )),
                column(6,
                       plotOutput("newSeries")
                       
                )
)))
                
