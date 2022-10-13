library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)

setwd("~/Desktop/Student-Mental-Health-R-Shiny")

Student_MH <- read.csv(file = "./Student_Mental_Health.csv")



#Data cleaning: 
names(Student_MH) <- c('Timestamp', 'Gender', 'Age', 'Major', 'Year', 'CGPA', 'Married', 'Depression', 'Anxiety', 'Panic_Attack', 'Treatment')



#Setting margin = 2 applies function to each column
missing_vals <- apply(Student_MH, 2, function(x) any(is.na(x)))

#Imputing the missing age with the median age - No other missing values present
Student_MH[44,'Age'] <- median(Student_MH$Age, na.rm =T)

#Note that the year of study data is typed and irregular - we need to truncate the text and convert it to a factor
Student_MH$Year <- as.factor(substring(Student_MH$Year, nchar(Student_MH$Year), nchar(Student_MH$Year)))

#Making Year numeric
Student_MH$Year <- as.numeric(Student_MH$Year)

#Cleaning variant strings for Major
Student_MH[2,'Major'] = 'Islamic Education'
Student_MH[7,'Major'] = 'Islamic Education'
Student_MH[10,'Major'] = 'Islamic Education'
Student_MH[39,'Major'] = 'Islamic Education'
Student_MH[43,'Major'] = 'Islamic Education'
Student_MH[57,'Major'] = 'Islamic Education'
Student_MH[84,'Major'] = 'Islamic Education'
Student_MH[87,'Major'] = 'Islamic Education'
Student_MH[95,'Major'] = 'Islamic Education'
Student_MH[100,'Major'] = 'Islamic Education'

Student_MH[22,'Major'] = 'Engineering'
Student_MH[48,'Major'] = 'Engineering'
Student_MH[54,'Major'] = 'Engineering'
Student_MH[64,'Major'] = 'Engineering'
Student_MH[65,'Major'] = 'Engineering'
Student_MH[67,'Major'] = 'Engineering'
Student_MH[76,'Major'] = 'Engineering'
Student_MH[92,'Major'] = 'Engineering'
Student_MH[93,'Major'] = 'Engineering'

Student_MH[70,'Major'] = 'Pharmacy'

Student_MH[82,'Major'] = 'Nursing'

Student_MH[58,'Major'] = 'English Language'
Student_MH[60,'Major'] = 'English Language'
Student_MH[94,'Major'] = 'English Language'

Student_MH[86,'Major'] = 'Psychology'
Student_MH[88,'Major'] = 'Psychology'

Student_MH[4,'Major'] = 'Law'

Student_MH[61,'Major'] = 'BIT'

Student_MH[91,'Major'] = 'TESL'

#####################

#This shows that there is one student whose GPA is coded wrong
table(Student_MH$CGPA)

for (i in 1:101) {
  if (str_detect(Student_MH[i,'CGPA'], '3.50 - 4.00')){
    Student_MH[i,'CGPA'] = '3.50 - 4.00'
  }
}

Student_MH$CGPA <- as.factor(Student_MH$CGPA)

#########


