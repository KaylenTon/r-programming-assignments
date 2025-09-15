# Assignment # 3: Assignment #3: Analyzing 2016 data “Poll” Data in R
library(ggplot2)

Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll   <- c(  4,      62,      51,    21,      2,        14,       15)
CBS_poll   <- c( 12,      75,      43,    19,      1,        21,       19)

df_polls <- data.frame(Name, ABC_poll, CBS_poll)

str(df_polls)
head(df_polls)

mean(df_polls$ABC_poll)
median(df_polls$ABC_poll)
range(df_polls$ABC_poll)

mean(df_polls$CBS_poll)
median(df_polls$CBS_poll)
range(df_polls$CBS_poll)

df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_pol

long_polldata <- df_polls %>% 
  pivot_longer(
    cols = c(ABC_poll, CBS_poll),
    names_to = "Poll",
    values_to = "Votes"
  )

ggplot(long_polldata, aes(x = Name, y = Votes, fill = Poll)) + geom_col(position = "dodge")
