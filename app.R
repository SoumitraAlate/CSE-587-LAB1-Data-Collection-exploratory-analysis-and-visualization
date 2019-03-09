
#install.packages("shiny")
#install.packages("maps")
library(shiny)
library(maps)
#UI Code
ui <- fluidPage(
  
  titlePanel("Lab1-Part3 Hello 587!"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("var", 
                  label = "Choose data",
                  choices = c("CDC Map", 
                              "Tweet Map",
                              "CDC Map vs Tweet Map"),
                  selected = "Tweet Map")
    ),
    
    
    mainPanel(
      plotOutput("map")
    )
  )
) 


#server

server <- function(input, output) 
{
  
  output$map <- renderPlot({ 
    
    switch(input$var, 
           "CDC Map" = readRDS("p1.rds"),
           "Tweet Map" = readRDS("p.rds"),
           "CDC Map vs Tweet Map" = readRDS("p2.rds"))
           
    
  })
  
}

# Create Shiny app 
shinyApp(ui = ui, server = server)