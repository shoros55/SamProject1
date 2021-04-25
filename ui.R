#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
shinythemes::themeSelector()

navbarPage(
    theme = shinytheme("superhero"),
    "Interior Plants Availability",
    #first bar: plant search
    
    tabPanel("Interior Plants Nursery Supply Availability",
        sidebarPanel(
            radioButtons("region", label = h2("First Select Region"), 
                         choices = list("Palm Beach" = 1, "Miami-Dade" = 2),
                         selected = 2),
            h2("Specify Plant and Size"),
            selectInput("plant", "Plant", 
                        choices = list("Aglo (Mary Ann/Maria)",
                                       "Aglo (Siam)",
                                       "Aglo (Silver Bay)",
                                       "Aglo (Spring Snow)",
                                       "Art",
                                       "Art Cane",
                                       "Dorado",
                                       "Dorado Cane",
                                       "Elegance Cane",
                                       "Giganta",
                                       "Green Jewel",
                                       "Green Jewel Cane",
                                       "Hawaiian Sunshine",
                                       "Jade Jewel",
                                       "Janet Craig",
                                       "Janet Craig Cane",
                                       "JC Compacta",
                                       "JC Compacta Cane",
                                       "Lemon Lime",
                                       "Lemon Lime Cane",
                                       "Lemon Surprise",
                                       "Limelight",
                                       "Lind Cane",
                                       "Marginata (Cut-Back)",
                                       "Marginata Character",
                                       "Marginata Open Weave",
                                       "Mass Cane",
                                       "Moonlight Cane",
                                       "Reflexa",
                                       "Riki",
                                       "Riki Cane",
                                       "Song of India",
                                       "Song of Jamaica",
                                       "Tarzan",
                                       "Ulysses",
                                       "Ulysses Cane",
                                       "Adonidia Palm (Multi) 2X 3X",
                                       "Adonidia Palm (Single)",
                                       "Areca Palm",
                                       "Cham Metallica",
                                       "Cham Palm",
                                       "Fishtail Palm",
                                       "Kentia",
                                       "Majesty Palm",
                                       "Rhapis (Florida)",
                                       "Roebelenii (Multi)",
                                       "Roebelenii (Single)",
                                       "Anthurium R W P",
                                       "Aralia (Balfour)",
                                       "Aralia (Ming)",
                                       "Cast Iron",
                                       "Clusia",
                                       "Cordyline",
                                       "Croton",
                                       "Eugenia Topiary Pom Pom",
                                       "Eugenia Topiary",
                                       "Fern",
                                       "Ficus",
                                       "Ficus (Alii-Braid)",
                                       "Ficus (Lyrata Bush)",
                                       "Ficus (Lyrata Standard)",
                                       "Philodendron",
                                       "Philodendron (Congo Rojo)",
                                       "Philodendron (Split Leaf)",
                                       "Ponytail Palm",
                                       "Pothos (Golden)",
                                       "Pothos (Jade)",
                                       "Pothos (Neon)",
                                       "Pothos (Silver Satin)",
                                       "Pothos (Totem)",
                                       "Sansevaria (Black Coral)",
                                       "Sansevaria (Futura Superba)",
                                       "Sansevaria (Laurentii)",
                                       "Sansevaria (Zeylanica)",
                                       "Schefflera (Amate)",
                                       "Schefflera (Arboricola)",
                                       "Schefflera (Gold Capella)",
                                       "Spath",
                                       "Spath Sensation",
                                       "White Bird",
                                       "Yucca Cane",
                                       "ZZ"), 
                        selected = "Aglo (Siam)"),
            
            
            selectInput("size", "Size",
                        choices = list("3\"", "4\"", "6\"", "8\"", "10\"", "12\"", "14\"", "17\""),
                        selected = "10\""),
            
            submitButton("Enter"),
            img(src = "masscane.jpeg", height = 338.0625, width = 225),
        ),
        mainPanel(
            img(src = "Pothoss.jpeg", height = 200, width = 600),
            tableOutput("region_input"),
            tableOutput("price_per_inch"),
            plotOutput("ppiplot")
        )
    ),
    
    #Second bar: plot of stats comparing overall availability by nursery
    tabPanel("Overall Availability by Nursery",
             sidebarPanel(
                 radioButtons("region2", label = h2("First Select Region"), 
                              choices = list("Palm Beach" = 1, "Miami-Dade" = 2),
                              selected = 2),
                 submitButton("GO!")
             ),
             mainPanel(
                 plotOutput("hist")
                 )
             )
    )
