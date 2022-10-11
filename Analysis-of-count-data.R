##count data analysis.
## Possion distribution

##reding the data

rm(list=ls())
getwd() ##checking for write directory

bicycle <- read.csv( "./data/nyc-east-river-bicycle-counts.csv", header = T )
head(bicycle)
names(bicycle)
range(bicycle$Total)
library(ggplot2)

ggplot(bicycle,aes(x=Total))+geom_histogram(bins=10)
mod1 <- glm(bicycle$Total~bicycle$Low.Temp...F.  ,  family = "poisson")
summary(mod1)

