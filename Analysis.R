#An investigation of how trade effects the GDP of the Netherlands
#this will only examine the early to middle 19th century
#first, let's import our data
Netherlands.Trade.1815.1854 <- read.csv("~/R Stuff/Netherlands Trade/Netherlands Trade 1815-1854.csv")
#now, let's visualize the data
plot(Netherlands.Trade.1815.1854$GDP.Per.Capita.Change ~ Netherlands.Trade.1815.1854$Total.Trade.Volume.Change)
plot(Netherlands.Trade.1815.1854$GDP.Per.Capita.Change ~ Netherlands.Trade.1815.1854$Asian.Trade.Change)
#seems like a basic downward linear trend
#let's take a look at the regression equation
OLSmodel <- lm(GDP.Per.Capita.Change ~ Total.Trade.Volume.Change + Asian.Trade.Change, data=Netherlands.Trade.1815.1854)
summary(OLSmodel)
#seems that Asian Trade definitely isn't related
#however, Total Trade Volume might be
#let's remove Asian Trade and see what happens
OLSmodel2 <- lm(GDP.Per.Capita.Change ~ Total.Trade.Volume.Change, data=Netherlands.Trade.1815.1854)
summary(OLSmodel2)
#seems like, bizzarely, more trade makes the Netherlands' GDP go down
#let's test for causality
library(lmtest)
grangertest(Netherlands.Trade.1815.1854$GDP.Per.Capita.Change ~ Netherlands.Trade.1815.1854$Total.Trade.Volume.Change, order=4)
#does not seem to be causal