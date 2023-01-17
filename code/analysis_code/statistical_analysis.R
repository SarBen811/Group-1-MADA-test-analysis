###############################
# analysis script
#
#this script loads the processed, cleaned data, does a simple analysis
#and saves the results to the results folder

#load needed packages. make sure they are installed.
library(ggplot2) #for plotting
library(broom) #for cleaning up output from lm()
library(here) #for data loading/saving
#library(tidyverse)

#path to data
#note the use of the here() package and not absolute paths
data_location <- here::here("data","processed_data","processeddata.rds")

#load data. 
mydata <- readRDS(data_location)


######################################
#Data fitting/statistical analysis
######################################

############################
#### First model fit
# fit linear model using height as outcome, weight as predictor

lmfit1 <- lm(Height ~ Weight, mydata)  

# place results from fit into a data frame with the tidy function
lmtable1 <- broom::tidy(lmfit1)

#look at fit results
print(lmtable1)

# save fit results table  
table_file1 = here("results", "resulttable1.rds")
saveRDS(lmtable1, file = table_file1)

############################
#### Second model fit
# fit linear model using height as outcome, weight and sex as predictor

lmfit2 <- lm(Height ~ Weight + Sex, mydata)  

# place results from fit into a data frame with the tidy function
lmtable2 <- broom::tidy(lmfit2)

#look at fit results
print(lmtable2)

# save fit results table  
table_file2 = here("results", "resulttable2.rds")
saveRDS(lmtable2, file = table_file2)

############################
#### Box plot
# create box plot with Pet on x-axis and Height on y-axis
boxplot <- ggplot(mydata, aes(Pet, Height)) +
  geom_boxplot()

#look at box plot
print(boxplot)

#save box plot
boxplot_file = here("results", "boxplot.rds")
saveRDS(boxplot, file = boxplot_file)

############################
#### Scatter plot
# create a scatter plot with weight on x-axis and age on y-axis
scatterplot <- ggplot(mydata, aes(Weight, Age)) +
  geom_point()

#look at scatter plot
print(scatterplot)

#save scatter plot
scatterplot_file = here("results", "scatterplot.rds")
saveRDS(scatterplot, file = scatterplot_file)