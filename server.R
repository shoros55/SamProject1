#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("global.R")


server <- function(input, output) {
    
    
    output$region_input <-  renderTable({
        dataset <- read.csv("data/md.csv", skip = 2)
        dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]
        
        if(input$region==2){
            dataset <- read.csv("data/md.csv", skip = 2)
            dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]
        }else{
            dataset <- read.csv("data/pbc.csv", skip = 2)
            dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]
        }
        
        
        get_nurseries <- function(size, item){
            size <- gsub(" ", "", size)
            sub <- dataset[dataset$Size==size & dataset$Item==item,]
            if(nrow(sub)>0){
                sub <- sub[,5:14]#only keep columns that are nurseries
                
                
                sub <- as.data.frame(t(sub))
                colnames(sub) <- c("Price")
                sub$Nursery <- row.names(sub)
                sub <- sub[!is.na(sub$Price),]
                sub$Price <- paste0("$", sub$Price)
                row.names(sub) <- 1:nrow(sub)
                return(sub)
            }else{return(data.frame(Availability="Not Available :("))}
        }
        
        
        size <- input$size
        item <- input$plant
        get_nurseries(size, item)
        
    })
    
}
