data<-read.csv("./data/Percentage_teen_birth.csv",header = T)
head(data)
summary(data)
M<-mean(data$value)
S<-sd(data$value)
range(data$value)
index<-(which(data$value>(M-3*S) & 
                data$value<M+3*S))
length(index)
50/50
shapiro.test(data$value)
library(dplyr)
plot_graph<-data%>%
  group_by(State.group)%>%
  summarise(mean=mean(value),sd=sd(value),count=n())
library(ggplot2)
plot <- ggplot(data = plot_graph,
               aes(x=State.group,y=mean))
pos<-position_dodge(0.8)
plot+geom_bar(stat = "identity",position = pos,aes(fill="red"))+
  geom_errorbar(aes(ymax=mean+sd/sqrt(count),ymin=mean-sd/sqrt(count)),
                stat = "identity")+labs(x="state cluster",
                                        y="Mean percentage of teenage pregnancy")
  
avo_model<-aov(value~State.group,data = data)
summary(avo_model)
TukeyHSD(aov(value~State.group,data = data))
