#ui.R
#Jonathan Labin

shinyUI(pageWithSidebar(
    headerPanel("Fixed Mortgage Payment Calculator"),
    sidebarPanel(
        h3("Instructions:"),
        h4("Enter the attributes of the loan below to compute the monthly payment amount and the balance remaining after the specified elapsed time"),
        numericInput('princ', 'Principal ($)', 100000, min = 0, max = 99999999, step = 0.01),
        p("The original loan amount in dollars."),
        numericInput('rate', 'Interest Rate (%)', 5.0, min = 0, max = 100, step = 0.125),
        p("The interest rate of the loan as a percentage."),
        numericInput('term', 'Term (years)', 30, min = 0, max = 200, step = 5),
        p("The length of the loan in years"),
        #TODO make term a radio button or drop-down selection
        numericInput('elap', 'Elapsed (months)', 0, min = 0, max = 9999, step = 1),
        p("The amount of time in months since the loan was established")
    ),
    mainPanel(
        h3('Monthly Mortgage Payment'),
        verbatimTextOutput("pmt"),
        h3('Remaining Balance after elapsed months'),
        verbatimTextOutput("bal")
    )
    
    #TODO make a pretty balance graph
))