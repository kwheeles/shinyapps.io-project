library(shiny)
data("EuStockMarkets")

# we will give user choice of raw data or indexed to start of period

wgtEu <- EuStockMarkets
w <- sapply(1:4,function(x) wgtEu[,x]=wgtEu[,x]*100/wgtEu[1,x])
wgtEu[,] <- w[,]

shinyServer(
        function(input,output) {
                datasetInput <- reactive({
                        switch(input$dataset,
                               "Raw" = EuStockMarkets,
                               "Indexed" = wgtEu)
                })
                output$newSeries <-renderPlot({plot(switch(input$dataset,"Raw"=EuStockMarkets,
                                "Indexed"=wgtEu)[,input$exch],main="EU Markets 1991-1999",
                                ylab=input$dataset)})
        }
)



