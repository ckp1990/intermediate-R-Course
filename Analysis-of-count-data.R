##count data analysis.
## Possion distribution

##reding the data

rm(list=ls())
getwd() ##checking for write directory

bicycle <- read.csv("./data/nyc-east-river-bicycle-counts.csv",header = T)
head(bicycle)
names(bicycle)
