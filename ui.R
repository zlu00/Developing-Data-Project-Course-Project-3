#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


shinyUI(pageWithSidebar(
  
    titlePanel("My Mock Trading Stock Portfolio"),
  
    sidebarPanel(
        ## Stock Symbol Selections
        wellPanel(
            h4("Stock Symbols"),
            checkboxInput(inputId = "stock_aapl", label = "Apple (AAPL)", value = TRUE),
            checkboxInput(inputId = "stock_googl", label = "Google (GOOGL)", value = FALSE),
            checkboxInput(inputId = "stock_fb",  label = "Facebook (FB)", value = FALSE),
            checkboxInput(inputId = "stock_baba", label = "Alibaba (BABA)", value = FALSE),
            checkboxInput(inputId = "stock_tsla", label = "Tesla (TSLA)", value = FALSE),
            checkboxInput(inputId = "stock_gs", label = "Goldman Sachs (GS)", value = FALSE)
        ),
        
        ## Chart Type Selection
        selectInput(inputId = "chart_type", label = "Chart type", choices = c("Line" = "line",
                                                                              "Candlestick" = "candlesticks",
                                                                              "Bar" = "bars")
        ),
        
        ## Date Range Selection
        dateRangeInput(inputId = "daterange", label = "Date range", start = Sys.Date() - 30, end = Sys.Date()),
        
        ## Submit
        submitButton("Submit")
    ),
    
    mainPanel(
        h4("Stock Analysis Chart"),
        
        ## Plots
        conditionalPanel(condition = "input.stock_aapl", br(), div(plotOutput(outputId = "plot_aapl"))),
        conditionalPanel(condition = "input.stock_googl", br(), div(plotOutput(outputId = "plot_googl"))),
        conditionalPanel(condition = "input.stock_fb", br(), div(plotOutput(outputId = "plot_fb"))),
        conditionalPanel(condition = "input.stock_baba", br(), div(plotOutput(outputId = "plot_baba"))),
        conditionalPanel(condition = "input.stock_tsla", br(), div(plotOutput(outputId = "plot_tsla"))),
        conditionalPanel(condition = "input.stock_gs", br(), div(plotOutput(outputId = "plot_gs")))
    )
))
