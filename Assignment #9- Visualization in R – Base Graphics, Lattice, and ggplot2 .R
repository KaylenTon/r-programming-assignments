# Assignment #9: Visualization in R – Base Graphics, Lattice, and ggplot2
Guns <- read_csv("Guns.csv")
head(Guns)

# Base R
FL_Guns_1980s <- Guns %>% 
  filter(year > 1979 & year < 1990) %>% 
  filter(state == "Florida")

plot(FL_Guns_1980s$year, FL_Guns_1980s$robbery,
     main = "Florida Robberies\n Across the 1980s",
     xlab = "Year",
     ylab = "Robberies (per 100,000)")
hist(FL_Guns_1980s$murder,
     main = "Murders in Florida \nAcross the 1980s",
     xlab = "Number of Murders",
     ylab = "Frequency")

# Lattice
library(lattice)
Guns_1980s <- Guns %>% 
  filter(year > 1979 & year < 1990)

xyplot(murder ~ year | factor(law),
       data = Guns,
       main = "Murders in the US throughout years \nby 'Shall Carry' Law")

someStates_1980s <- Guns_1980s %>% 
  filter(state %in% c("Alaska", "Florida", "Nevada", "Utah", "California"))

bwplot(income ~ factor(state),
       data = someStates_1980s)

# ggplot2
library(ggplot2)
ggplot(FL_Guns_1980s, aes(year, violent, color = law, size = density)) + geom_point() + labs(
  title = "Violent Crime Rate (per 100k pop.) in the 1980s",
  x = "Year",
  y = "Violence Rate",
  color = "Does the state \nhave a shall carry \nlaw in effect?",
  size = "Population Density"
) + theme_classic()

Colorado_Guns <- Guns %>% 
  filter(state == "Colorado")

ggplot(Colorado_Guns, aes(year, robbery, size = male)) + geom_line(color = "navy") + theme_light() + labs(
  title = "Colorado Robberies Through the Years",
  subtitle = "Exploring the percent of males (aged 10-29) in the population's effect on robbery rates",
  x = "Robbery Rate (incidents per 100,000",
  y = "Year",
  size = "Thicker -> Denser Male Population \nThinner -> Less Dense Male Population"
)