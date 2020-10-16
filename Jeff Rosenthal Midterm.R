### Jeff Rosenthal Midterm
df <- read_csv("data.csv")
view(df)

df_G7 <- df%>%filter(countriesAndTerritories %in% c("Canada", "France", "Germany", "Italy", "Japan", "United_States_of_America", "United_Kingdom"))
view(df_G7)

library(tidyverse)
library(scales)

p<-ggplot(data=df_G7,
          mapping=aes(x=month,
                        y=cases,
                        color=countriesAndTerritories))

p+geom_line(aes(group=countriesAndTerritories))

p+geom_line() + scale_x_continuous(breaks=c(1.0,4.0,7.0,10.0), labels=c("Jan", "Apr", "Jul", "Oct"))+
  labs(title = "G7 COVID-19 Case Count", x = "", y = " New Cases per Day" , 
       subtitle = "by Jeff Rosenthal as of 2020-16-10",
       caption = "Source: NY ECDC Times")

