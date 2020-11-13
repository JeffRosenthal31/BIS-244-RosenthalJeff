### Jeff Rosenthal
### Assignment 5

library("tidyverse")
library("ggplot2")
library("scales")

og<-read_csv("LT History.csv")
view(og)

tier <- og %>% group_by(Tier, Wins) %>% summarize(N=n()) %>% mutate(freq = N/sum(N), pct=round((freq*100),0))
tier2 <- og %>% group_by(Tier, Wins, `Games Played`) %>% mutate(winratio = Wins/`Games Played`)
AverageWinRatio <- aggregate(tier2$winratio, by=list(Tier=tier2$Tier), FUN=mean)

nationality <- og %>% group_by(Nationality, Wins) %>% summarize (N=n()) %>% mutate (freq = N/sum(N), pct=round((freq*100),0))
nationality2 <- og %>% group_by(Nationality, Wins, `Games Played`) %>% mutate(AverageWinRatio = Wins/`Games Played`)
BestNationality <- aggregate(nationality2$AverageWinRatio, by=list(Nationality=nationality2$Nationality), FUN=mean)

tank <-og %>% group_by(Tank, Wins) %>% summarize (N=n()) %>% mutate (freq = N/sum(N), pct=round((freq*100),0))
tank2 <- og %>% group_by(Tank, Wins, `Games Played`) %>% mutate(AverageWinRatio = Wins/`Games Played`)
BestTank <- aggregate(tank2$AverageWinRatio, by=list(Tank=tank2$Tank), FUN=mean)

### 3 separate graphs
ggplot(AverageWinRatio, aes(x=Tier, y=x))+
  geom_point(position="dodge2")+labs(title="Best Tier", y="Average Win Ratio", x="Tier")

ggplot(BestNationality, aes(x=Nationality, y=x))+
  geom_point(position="dodge2")+labs(title="Best Nationality", y="Average Win Ratio", x="Nationality")

ggplot(BestTank, aes(x=Tank, y=x))+
  geom_point(position="dodge2")+labs(title="Best Tank", y="Average Win Ratio", x="Nationality")+
  theme(axis.text.x = element_text(angle=90))


