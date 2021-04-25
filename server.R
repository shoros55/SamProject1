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
        dataset <- read.csv("data/md1.csv", skip = 2)
        dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]
        
        if(input$region==2){
            dataset <- read.csv("data/md1.csv", skip = 2)
            dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]
        }else{
            dataset <- read.csv("data/pbc1.csv", skip = 2)
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
    
    
    output$hist <-  renderPlot({
        dataset <- read.csv("data/md1.csv", skip = 2)
        dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]

        ##radio button
        if(input$region2==2){
            dataset <- read.csv("data/md1.csv", skip = 2)
            dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]

            Berneckers_proportion <- mean(!is.na(dataset$Berneckers))
            Butlers_proportion <- mean(!is.na(dataset$Butlers))
            Capri_proportion <- mean(!is.na(dataset$Capri))
            Consolidated_proportion <- mean(!is.na(dataset$Consolidated))
            Sturon_proportion <- mean(!is.na(dataset$Sturon))
            Sunshine_proportion <- mean(!is.na(dataset$Sunshine))
            Vine_Culture_proportion <- mean(!is.na(dataset$Vine.Culture))
            Tim_Griffin_proportion <- mean(!is.na(dataset$Tim.Griffin))
            FL.Indoor_proportion <- mean(!is.na(dataset$FL.Indoor))

            availability_table <- data.frame(Nursery=c("Berneckers", "Butlers",
                                                       "Capri", "Consolidated",
                                                       "Sturon", "Sunshine",
                                                       "Vine & Culture", "Tim Griffin",
                                                       "FL Indoor"),
                                             Proportion=c(Berneckers_proportion,
                                                          Butlers_proportion,
                                                          Capri_proportion, Consolidated_proportion,
                                                          Sturon_proportion, Sunshine_proportion,
                                                          Vine_Culture_proportion,
                                                          Tim_Griffin_proportion, FL.Indoor_proportion))

        }else{
            dataset <- read.csv("data/pbc1.csv", skip = 2)
            dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]

            Boyd_proportion <- mean(!is.na(dataset$Boyd))
            Carter_Road_proportion <- mean(!is.na(dataset$Carter.Road))
            Michaels_proportion <- mean(!is.na(dataset$Michaels))
            Mcdougald_proportion <- mean(!is.na(dataset$Mcdougald))
            Mulvehill_proportion <- mean(!is.na(dataset$Mulvehill))

            availability_table <- data.frame(Nursery=c("Boyd", "Carter Road",
                                                       "Michaels", "Mcdougald",
                                                       "Mulvehill"),
                                             Proportion=c(Boyd_proportion,
                                                          Carter_Road_proportion,
                                                          Michaels_proportion,
                                                          Mcdougald_proportion,
                                                          Mulvehill_proportion)
                                             )
            }


        availability_table$Percent <- round(availability_table$Proportion,2)*100
        #availability_table$Percent <- paste0(availability_table$Percent, "%")

        library(ggplot2)
        ggplot(availability_table, aes(x=Nursery, y=Percent, fill=Nursery)) +
            geom_bar(stat="identity") +
            ggtitle("Percent of plants available at each Nursery")+
            theme_bw() + theme(legend.position = "none")
        # plot(availability_table)
    })

    
    
    #calculate price per inch
    output$price_per_inch <- renderTable({
        dataset <- read.csv("data/md.csv", skip = 2)
        dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]
        
        # ##Use md data set, as there is greater num of values
        # if(input$region==2){
        #     dataset <- read.csv("data/md.csv", skip = 2)
        #     dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]
        # }else{
        #     dataset <- read.csv("data/pbc.csv", skip = 2)
        #     dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]
        # }
        # 
        library(tidyr)
        long <- gather(dataset, "Nursery", "Price", Berneckers:FL.Indoor)

        #fix quotes in size to make numeric
        long$Size <- as.numeric(gsub("\"", "", long$Size))


        item <- input$plant
        sub <- long[long$Item==item,]
        
        model <- lm(Price ~ Size, sub)
        # print(summary(model))
        coef <- as.data.frame(coef(summary(model)))
        coef$Term <- c("Intercept", "Size")
        coef <- cbind(coef$Term, coef[,1:4])
        colnames(coef) <- c("Term", "Estimate", "SE", "T value", "P value")
        coef
        
    })
    output$ppiplot <- renderPlot({
        dataset <- read.csv("data/md1.csv", skip = 2)
        dataset <- dataset[!is.na(dataset$Item) & !is.na(dataset$Size),]
        
        library(tidyr)
        long <- gather(dataset, "Nursery", "Price", Berneckers:FL.Indoor)
        
        #fix quotes in size to make numeric
        long$Size <- as.numeric(gsub("\"", "", long$Size))
        
        
        item <- input$plant
        sub <- long[long$Item==item,]
        
        library(ggplot2)
        ggplot(sub, aes(Size, Price)) + 
            geom_jitter() + 
            geom_smooth(method="lm") +
            theme_bw()
    })
}
