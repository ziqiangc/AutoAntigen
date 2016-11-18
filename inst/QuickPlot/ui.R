library(shiny)

shinyUI(fluidPage(
    # headerPanel("Plot for GenePix"),
    titlePanel(h1("Plot for GenePix")),

    sidebarPanel(
        # selectInput("dataset",
        #             label = h4("Choose a dataset:"),
        #             choices = c("Slide1_IgG",
        #                         "Slide1_IgM",
        #                         "Slide2_IgG",
        #                         "Slide2_IgM"),
        #             selected = "Slide1_IgG"
        #             ),

        uiOutput("choose_dataset"),

        uiOutput("choose_columns"),

        uiOutput("choose_coltype"),

        # selectInput("coltype",
        #             label = h4("Select colors::"),
        #             choices = c("green", "red"),
        #             selected = "green"),

        # uiOutput("colSelector"),

        # numericInput("col",
        #              label = h4("Select columns:"),
        #              value = 14),

        numericInput("block",
                     label = h4("Block:"),
                     value = 1),

        plotOutput("plot2")

    ),

    mainPanel(
              fluidRow(
                  column(12,
                         fluidRow(
                             column(12, h2("Main plot"), plotOutput("plot1", height = "600px"))
                             # column(12, h2("Block plot"), plotOutput("plot2"))
                         )
                  )
              )

    )

    )
)
