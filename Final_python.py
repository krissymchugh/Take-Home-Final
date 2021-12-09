# -*- coding: utf-8 -*-
"""
Final
Author: Krissy McHugh
File Name: Final_python.py
Directory: /Users/krissymchugh/Desktop/STA308/Python/Final
Date: 12/7/2021
"""
import pandas as pd

death_numbers = pd.read_csv("state_Opioid_Deaths2019.csv")
us_states_mapping = pd.read_csv("state_abb_codes.csv")
census_mapping = pd.read_csv("censusRegions.csv")


print(death_numbers)
print(census_mapping)


census_mapping = census_mapping.rename(columns={'State':'Code'})
death_numbers = death_numbers.rename(columns={'Location':'State'})

states = pd.merge(census_mapping, us_states_mapping, on='Code')
print(states)
states_data = pd.merge(states, death_numbers, on='State')
print(states_data)
# reference: https://stackoverflow.com/questions/37697195/how-to-merge-two-data-frames-based-on-particular-column-in-pandas-python

states_data = states_data[states_data.State !='District of Columbia']

states_data = states_data.drop(["State", "Code", "Abbrev", "Range Category", "Number of Deaths"], axis=1)
print(states_data)
# reference: https://www.geeksforgeeks.org/how-to-drop-one-or-multiple-columns-in-pandas-dataframe/

states_data_analysis = states_data.groupby(["Region"]).agg({"Age adjusted Rate": "mean"})



states_data_analysis = states_data.groupby(["Region"]).agg({"Age adjusted Rate": ["mean", "std"]})














