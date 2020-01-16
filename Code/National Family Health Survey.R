write.table

install.packages("tidyverse")
install.packages("haven")
library(tidyverse)
library(haven)
library(dplyr)

#2 Retrieve Data
health_survey <- read_dta("Data/IAHR52FL.dta")

#3 Minimize Data
household_level <- select(health_survey, hhid:shstruc)
View(household_level)

#4 Plot Data in Histogram

ggplot(household_level, mapping = aes(hv009)) + geom_histogram(binwidth = 0.75) +
      xlab("Members in the Household") + ylab("Households")


#5 New Data Frame

urban_household <- household_level %>% filter(hv025 == 1)

ggplot(data = urban_household, mapping = aes(x = factor(hv026), y = hv009)) + geom_boxplot() + 
              xlab("Type of Urban Area") + 
              ylab("Members in the Household") + 
              scale_x_discrete(labels = c("Capital / Large City", "Small City", "Town"))

#6 group_by for means and medians

urban_household %>% group_by(hv026) %>% summarise(mean = mean(hv009), median = median(hv009))



                          