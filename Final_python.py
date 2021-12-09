# -*- coding: utf-8 -*-
"""
Final
Author: Krissy McHugh
File Name: Final_python.py
Directory: /Users/krissymchugh/Desktop/STA308/Python/Final
Date: 12/7/2021
"""
############################################################
# For each of the census regions, compute the mean state (that is, remove Washington, D.C.) 
#age-adjusted death rate, along with the corresponding standard deviation and coefficient of 
# variation (Links to an external site.). The result of your program should be a table of 
# numbers with 4 rows (corresponding to the four census regions) and 3 columns (the mean, 
# standard deviation and coefficient of variation).

import pandas as pd

death_numbers = pd.read_csv("state_Opioid_Deaths2019.csv")
us_states_mapping = pd.read_csv("state_abb_codes.csv")
census_mapping = pd.read_csv("censusRegions.csv")


print(death_numbers)
print(census_mapping)

# Firstly, I am going to change the names of certain variables so that they are the same under
# the data frames so that I will be able to merge them.
census_mapping = census_mapping.rename(columns={'State':'Code'})
death_numbers = death_numbers.rename(columns={'Location':'State'})

# Now I am merging 2 data sets together by the same column "Code".
states = pd.merge(census_mapping, us_states_mapping, on='Code')
print(states)
# Now I am merging the data set I just created in the first merge with the 3rd merge so that I 
# have one concise data set with every value.
states_data = pd.merge(states, death_numbers, on='State')
print(states_data)
# reference: https://stackoverflow.com/questions/37697195/how-to-merge-two-data-frames-based-on-particular-column-in-pandas-python

# Removing District of Columbia from the data set since we are only concerned with US states.
states_data = states_data[states_data.State !='District of Columbia']

# Removing unecessary columns.
states_data = states_data.drop(["State", "Code", "Abbrev", "Range Category", "Number of Deaths"], axis=1)
print(states_data)
# reference: https://www.geeksforgeeks.org/how-to-drop-one-or-multiple-columns-in-pandas-dataframe/

# Creating data frame with the mean age adjusted death rate and standard deviation.
states_data_analysis = states_data.groupby(["Region"]).agg({"Age adjusted Rate": ["mean", "std"]})













