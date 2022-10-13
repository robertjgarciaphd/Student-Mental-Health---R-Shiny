library(ggvis)
library(dplyr)
if (FALSE) {
  library(RSQLite)
  library(dbplyr)
}

# Define server logic required to draw a graph
shinyServer(function(input, output) {
  mental_health <- reactive({
    
    # Apply filters
   Student_MH %>%
           filter(
              if (input$married != "All"){
                Married==input$married} else {
                  TRUE},
              
              if (input$major != "All"){
                Major==input$major} else {
                  TRUE},

              if (input$gender != "All"){
                Gender==input$gender} else {
                  TRUE},
              Year >= as.numeric(input$year[1]),
              Year <= as.numeric(input$year[2])
            ) 
    
  })
  
  output$n_students <- renderText({ nrow(mental_health()) 
    })
  
  output$deprPlot <- renderPlot({
    
    ggplot(data = mental_health()) + geom_bar(mapping = aes(x = CGPA, y = ..count../sum(..count..), fill = Depression), position = "dodge") + labs(x = "Cumulative GPA", y = "Proportion", title = "Depression by Cumulative GPA") 
  })
  
  output$anxPlot <- renderPlot({
    
    ggplot(data = mental_health()) + geom_bar(mapping = aes(x = CGPA, y = ..count../sum(..count..), fill = Anxiety), position = "dodge") + labs(x = "Cumulative GPA", y = "Proportion", title = "Anxiety by Cumulative GPA") 
  })  
  
  output$panicPlot <- renderPlot({
    ggplot(data = mental_health()) + geom_bar(mapping = aes(x = CGPA, y = ..count../sum(..count..), fill = Panic_Attack), position = "dodge") + labs(x = "Cumulative GPA", y = "Proportion", title = "Panic Attacks by Cumulative GPA") 
  })  
    
  output$TxPlot <- renderPlot({
    ggplot(data = mental_health()) + geom_bar(mapping = aes(x = CGPA, y = ..count../sum(..count..), fill = Treatment), position = "dodge") + labs(x = "Cumulative GPA", y = "Proportion", title = "Treatment by Cumulative GPA") 
  })
  
  
  
}  
  
)  
  