library(haven)
library(RMariaDB)
# SPSS (.sav, .zsav, .por)
spss_data <- read_sav("survey.sav")

# Stata (.dta)
stata_data <- read_dta("survey.dta")

# SAS (.sas7bdat, .xpt)

head(stata_data)

con <- dbConnect(
  RPostgres::Postgres(),
  host = "localhost", dbname = "loadfleat",
  user = "postgres", password = "1234", port = 5432
)

dbListTables(con)                # list all tables
dbListFields(con, "user")  


users <-dbReadTable(con,"user")

active_users <- dbGetQuery(con, 'SELECT * FROM "user" WHERE "isActive" = true')

summary(stata_data$income)

data()


data_class<-airquality
# for displaying the columns
variable.names(airquality)

str(airquality)

head(data_class)

?airquality

# assigning a variable from a dataset column

var1<- airquality$Wind
?apply

apply(data_class,1,mean)


?sd

data_iris <- iris

?iris

# for categorical data , summing up the frequency use table(function)

table(iris$Species)

head(data_iris)

mean (iris$Petal.Length[iris$Species=='setosa'])

by (iris$Petal.Length,iris$Species,mean)

#boxplot(outlies finder) for continous vs categorical

?boxplot

boxplot(iris)

# relationship btn two categorical variables

data_admission <-UCBAdmissions

head(data_admission)


#Is there gender bias in UCB graduate admission process ?

cross <- xtabs(Freq~Gender+Admit,data=data_admission)
cross
(cross <- xtabs(Freq~Gender+Admit,data=data_admission))
prop.table(cross,1)

###simpson's paradox
###phenomenon , where a trend that appears in combined 
##groups of data disppears or reverses whenr broken down into group

cross2 <- xtabs(data_admission)


#barchart
# types of barchart

#chi square test of independence 

# how to apply hi square test of independence 


# assumptions for linear model


?attach
?plot


# dates in R
today <- Sys.Date()
dob=as.Date("2001-09-03")

difftime(today,dob,units="days")


# data management with dyplr
          
?dplyr

library(dplyr)

library(nycflights13)


str(flights)

jan <- filter(flights,month==1)
jan

?filter
?select
?arrange
?mutate
?group_by

str((BOD))

head(Seatbelts)
BOD_data<-Seatbelts
variable.names(BOD_data)
BOD_data

filter(BOD_data,kms=='300')
?ggplot2


group_by(BOD_data,.add=True)

