library(tidyverse)
library(scales)
df<-read_csv("Most Popular Twitch Streamers.csv")
df$Date<-as.Date(df$Date, "%m/%d/%Y")
str(df)

p<-ggplot(data=df,
          mapping=aes(x=Date,
                      y=Viewers,
                      color=Streamer))

p+geom_line(mapping=aes(group=Streamer))+
  scale_y_continuous(labels=unit_format(unit="M",scale=1e-6))+
  labs(x="Date",
       y="Viewers",
       title="Most Popular Twitch Streamers")

p+geom_line(mapping=aes(group=Streamer))+
  scale_y_continuous(labels=unit_format(unit="M",scale=1e-6))+
  labs(x="Date",
       y="Viewers",
       title="Most Popular Twitch Streamers")+
  facet_wrap(~Streamer)