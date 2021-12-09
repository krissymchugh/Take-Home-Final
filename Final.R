# Final
# Author: Krissy McHugh
# Date: 12/7/2021
# Directory: /Users/krissymchugh/Desktop/STA308/Take-Home-Final
#
###############################################################
#

# For each of the census regions, compute the mean state (that is, remove Washington, D.C.) age-adjusted death
# rate, along with the corresponding standard deviation and coefficient of variation (Links to an external 
# site.). The result of your program should be a table of numbers with 4 rows (corresponding to the four census
# regions) and 3 columns (the mean, standard deviation and coefficient of variation).


library(tidyverse)
death_numbers <- read_csv("state_Opioid_Deaths2019.csv")
us_states_mapping <- read_csv("state_abb_codes.csv")
census_mapping <- read_csv("censusRegions.csv")

view(death_numbers)
view(us_states_mapping)
view(census_mapping)

# Firstly, I am going to change the names of certain variables so that they are the same under the data frames
# so that I will be able to merge them.

colnames(census_mapping)[2] <- ("Code") 
view(census_mapping)

colnames(death_numbers)[1] <- ("State")
view(death_numbers)

# Now I am merging 2 data sets together by the same column "Code".
states <- merge(census_mapping, us_states_mapping, by="Code")
view(states)
# Now I am merging the data set I just created in the first merge with the 3rd merge so that I have one concise
# data set with every value.
states_data <- merge(states, death_numbers, by="State")
view(states_data)

# Removing District of Columbia from the data set since we are only concerned with US states.
states_data <- states_data %>%
  filter(State != "District of Columbia") 
view(states_data)

# Removing unecessary columns. I would normally do this in one step, but was just testing it out the first 
# two times and could not redo it in one code chunk since the columns were already removed from the data set.
states_data <- states_data %>%
  select(-c(State))
view(states_data)
states_data <- states_data %>%
  select(-c(Code, Abbrev))
states_data <- states_data %>%
  select(-c('Range Category', 'Number of Deaths'))
  
view(states_data)

# Ensuring that Region is a factor and Age adjusted Rate is numeric
as.numeric(states_data$`Age adjusted Rate`)
states_data$Region <- as.factor(states_data$Region)

# Creating data frame with the mean age adjusted death rate, standard deviation, and coefficient of variation.
states_data %>%
  group_by(Region) %>%
  summarize(mean_age_adjusted_rate = mean(`Age adjusted Rate`),
            sd_age_adjusted_rate = sd(`Age adjusted Rate`),
            coefficient_of_variation = sd_age_adjusted_rate/mean_age_adjusted_rate)






