# Final
# Author: Krissy McHugh
# Date: 12/7/2021
# Directory: /Users/krissymchugh/Desktop/STA308/Take-Home-Final
#
###############################################################
#
library(tidyverse)
death_numbers <- read_csv("state_Opioid_Deaths2019.csv")
us_states_mapping <- read_csv("state_abb_codes.csv")
census_mapping <- read_csv("censusRegions.csv")

view(death_numbers)
view(us_states_mapping)
view(census_mapping)

colnames(census_mapping)[2] <- ("Code")
view(census_mapping)

colnames(death_numbers)[1] <- ("State")
view(death_numbers)

states <- merge(census_mapping, us_states_mapping, by="Code")
view(states)
states_data <- merge(states, death_numbers, by="State")
view(states_data)

states_data <- states_data %>%
  filter(State != "District of Columbia") 
view(states_data)


states_data <- states_data %>%
  select(-c(State))
view(states_data)
states_data <- states_data %>%
  select(-c(Code, Abbrev))
states_data <- states_data %>%
  select(-c('Range Category', 'Number of Deaths'))
  
view(states_data)



as.numeric(states_data$`Age adjusted Rate`)
states_data$Region <- as.factor(states_data$Region)

str(states_data)


states_data %>%
  group_by(Region) %>%
  summarize(mean_age_adjusted_rate = mean(`Age adjusted Rate`))





