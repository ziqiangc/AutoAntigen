library(shiny)

shinyUI(fluidPage(
    # headerPanel("Plot for GenePix"),
    titlePanel(h1("Plot for GenePix")),

    fluidRow(
        column(
            4,

            wellPanel(
                uiOutput("choose_dataset"),

                fileInput('uploadfile', 'Or choose your own file',
                          accept="gpr"),


                uiOutput("choose_columns"),

                uiOutput("choose_coltype")
            ),
            # br(),
            wellPanel(
                numericInput("block",
                             label = h4("Block:"),
                             value = 1),

                plotOutput("plot2")
            )
        ),
        column(8,
            h2("Main plot"), plotOutput("plot1", height = "780px")

        )
    )

))

# option 2
# shinyUI(fluidPage(
#     fluidRow(
#         titlePanel(h1("Plot for GenePix")),
#         column(12,
#                fluidRow(
#                    column(4,
#                        fluidRow(
#                            column(12,
#                                   wellPanel(
#                                       uiOutput("choose_dataset"),
#
#                                       uiOutput("choose_columns"),
#
#                                       uiOutput("choose_coltype")
#                                   )
#
#                            ),
#                            column(12,
#                                   wellPanel(
#                                       numericInput("block",
#                                                    label = h4("Block:"),
#                                                    value = 1),
#
#                                       plotOutput("plot2")
#                                   )
#                            )
#                        )
#                    ),
#                    column(8,
#                           h2("Main plot"), plotOutput("plot1", height = "780px")
#                    )
#                ))
#              )
# ))


# option 3 (sidebar + mainpage)
# shinyUI(fluidPage(
#     # headerPanel("Plot for GenePix"),
#     titlePanel(h1("Plot for GenePix")),
#
#     sidebarPanel(
#
#         uiOutput("choose_dataset"),
#
#         uiOutput("choose_columns"),
#
#         uiOutput("choose_coltype"),
#
#         numericInput("block",
#                      label = h4("Block:"),
#                      value = 1),
#
#         plotOutput("plot2")
#
#     ),
#
#     mainPanel(
#         fluidRow(
#             column(12,
#                    fluidRow(
#                        column(12, h2("Main plot"), plotOutput("plot1", height = "600px"))
#
#                    )
#             )
#         )
#
#     )
#
# ))
