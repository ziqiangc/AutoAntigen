library(shiny)
library(AutoAntigen)
library(datasets)



shinyServer(function(input, output){

    rawS1g=read.table("data/Slide1_532.gpr",sep="\t",skip=32,header=T)
    rawS1r=read.table("data/Slide1_635.gpr",sep="\t",skip=32,header=T)
    rawS2g=read.table("data/Slide2_532.gpr",sep="\t",skip=32,header=T)
    rawS2r=read.table("data/Slide2_635.gpr",sep="\t",skip=32,header=T)

    datasetInput <- reactive({
        switch(input$dataset,
               "Slide1_IgG"=rawS1g,
               "Slide1_IgM"=rawS1r,
               "Slide2_IgG"=rawS2g,
               "Slide2_IgM"=rawS2r
               )
    })
    output$plot1 <- renderPlot({
        QuickPlot(dataset=datasetInput(),
                   coltype=input$coltype,
                   col=input$col
                  )
    })
    output$plot2 <- renderPlot({
        quickPlot(dataset=datasetInput(),
                  coltype=input$coltype,
                  col=input$col,
                  block = input$block
                  )
    })

})
