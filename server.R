#server.R
library(shiny)
shinyServer(
    function(input, output) {
        output$pmt <- renderPrint({
            c <- input$rate / 100 / 12 # monthly interest rate
            n <- input$term * 12 # number of months
            print(
                formatC(input$princ * (c * (1+c)^n) / ((1+c)^n - 1),
                        format="f", big.mark=',', digits = 2),
                quote=FALSE)
            
        })
        
        output$bal <- renderPrint({
            c <- input$rate / 100 / 12 # monthly interest rate
            n <- input$term * 12 # number of months
            p <- input$elap
            print(
                formatC(input$princ * ((1+c)^n - (1+c)^p)/((1+c)^n - 1), 
                        format="f", big.mark=',', digits = 2),
                quote=FALSE)
        })
    }
)