#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


ui <- fluidPage(
    titlePanel("Interior Plants Nursery Supply Availability"),
    
    sidebarLayout(
        sidebarPanel(
            
            radioButtons("region", label = h2("First Select Region"), 
                         choices = list("Palm Beach" = 1, "Homestead" = 2),
                         selected = 2),
            
            h2("Specify Plant and Size"),
            
            textInput("plant", "Plant", value = "ie. 'janet craig'"),
            
            selectInput("size", "Size", 
                        choices = list("3in" = 1, "4in" = 2, "6in" = 3, "8in" = 4, "10in" = 5, "12in" = 6, "14in" = 7, "17in" = 8),
                        selected = 5),
            ),
        
        mainPanel(
            h3("Availability", align = "center"),
            dataTableOutput("region_input")
            
            )
    )
)
server <- function(input, output) {
    
    ##pbc <- read.csv(paste("data/", "Palm Beach.csv", sep=""))
    ##output$region_input <- renderDataTable({
    ##    pbc
    ##})


    }

# Run the application 
shinyApp(ui = ui, server = server)

