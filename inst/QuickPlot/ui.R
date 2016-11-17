library(shiny)

shinyUI(fluidPage(
    # headerPanel("Plot for GenePix"),
    titlePanel(h1("Plot for GenePix")),

    sidebarPanel(
        selectInput("dataset",
                    label = h4("Choose a dataset:"),
                    choices = c("Slide1_IgG",
                                "Slide1_IgM",
                                "Slide2_IgG",
                                "Slide2_IgM"),
                    selected = "Slide1_IgG"
                    ),
        selectInput("coltype",
                    label = h4("Select colors::"),
                    choices = c("green", "red"),
                    selected = "green"),
        numericInput("col",
                     label = h4("Select columns:"),
                     value = 14),

        numericInput("block",
                     label = h4("Block:"),
                     value = 1)

    ),

    mainPanel("Plot",
        tabsetPanel(
            tabPanel("Main plot", plotOutput("plot1")),
            tabPanel("Block plot", plotOutput("plot2"))
        )
    )

    )
)
