library(tidyverse)
library(lubridate)
library(ggplot2)
library(readxl)

EvPointsTimeSeries <- read_xlsx("1. RawData/eurovision_song_contest_1975_2019v5.xlsx", sheet = "Data")
write.csv("3. CleanData//EvPointsTimeSeries1975-2019.csv")


unique(str_sort(EvPointsTimeSeries$ToCountry))
unique(EvPointsTimeSeries$Year)
unique(EvPointsTimeSeries$JuryOrTelevoting)

EvPointsTimeSeries %>%
  filter(ToCountry  == "Iceland", 
         FinalOrSemiFinal == "Final") %>%
  group_by(Year) %>%
  summarise(Points = sum(Points)) %>%
  ggplot() + 
  aes(y = Points, x = Year) + 
  geom_col() + 
  theme_minimal()
  

EvPointsTimeSeries %>%
  filter(FinalOrSemiFinal == "Final") %>%
  group_by(Year, ToCountry) %>%
  summarise(Points = sum(Points)) %>%
  ggplot() + 
  aes(y = Points, x = Year) + 
  geom_col() +
  facet_wrap(~ToCountry)
  theme_minimal()
  




