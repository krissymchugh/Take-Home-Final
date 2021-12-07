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
