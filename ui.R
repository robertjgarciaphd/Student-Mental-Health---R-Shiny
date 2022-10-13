library(ggplot2)


# Define UI for application that draws a graph
shinyUI(fluidPage(

    # Application title
    titlePanel("Student Mental Health Data"),
    #The Data were collected from International Islamic University of Malaysia
    
    sidebarLayout(
      sidebarPanel(
        selectizeInput(inputId = "gender",
                      label = "Gender",
                      choices = c("All",unique(Student_MH[, "Gender"]))),
        selectizeInput(inputId = "major",
                      label = "Major",
                      choices = c("All",unique(Student_MH[, "Major"]))),
        selectizeInput(inputId = "married",
                       label = "Marital Status",
                       choices = c("All",unique(Student_MH[, "Married"]))),
        sliderInput("year", "Current Year in College", 1, 4, value = c(1, 4),
                   sep = "")
        ),

        # Show a plot of the generated distribution
      mainPanel(
        
        tabPanel("num_students", "Number of students selected:",
                 textOutput("n_students")
          ),
          
          plotOutput("deprPlot"),
          
          plotOutput("anxPlot"),
          
          plotOutput("panicPlot"),
        
          plotOutput("TxPlot")
      )
    )
))



#################
