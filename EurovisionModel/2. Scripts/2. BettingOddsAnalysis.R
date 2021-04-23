# ESC odds: "https://eurovisionworld.com/odds/eurovision"

EvBettingData <- read.csv("1. RawData/EscOddsData2015_2021_Clean.csv")

EvBettingData %>%
  group_by(Year) %>%
  mutate(OddsRank = dense_rank(AverageOdds)) %>%
  ggplot() + 
  aes(y = Place, x = OddsRank) + 
  geom_point(color = "#073b4c", size = 2) +
  facet_wrap(~Year) + 
  geom_abline(intercept = 0, slope = 1) 

