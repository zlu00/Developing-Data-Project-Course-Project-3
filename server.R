#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(quantmod)

## This function downloads data for a stock
require_symbol <- function(symbol, envir = parent.frame()) {
    if (is.null(envir[[symbol]])) {
        envir[[symbol]] <- getSymbols(symbol, auto.assign = FALSE)
    }
    envir[[symbol]]
}

shinyServer(function(input, output) {
    symbol_env <- new.env()
    
    ## This function will make charts
    make_chart <- function(symbol) {
        symbol_data <- require_symbol(symbol, symbol_env)
        
        chartSeries(symbol_data,
                    name = symbol,
                    type = input$chart_type,
                    subset = paste(input$daterange, collapse = "::"),
                    theme = chartTheme("black", up.col="green", dn.col="red"),
                    TA = NULL
        )
    }
    
    ## Return the outputs
    output$plot_aapl <- renderPlot({ make_chart("AAPL") })
    output$plot_googl <- renderPlot({ make_chart("GOOGL") })
    output$plot_fb  <- renderPlot({ make_chart("FB")  })
    output$plot_baba <- renderPlot({ make_chart("BABA") })
    output$plot_nflx <- renderPlot({ make_chart("TSLA") })
    output$plot_gs <- renderPlot({ make_chart("GS") })
})
