# Take-Home-Final

| Functionality                               | In R                   | In Python                         |
|---------------------------------------------|------------------------|-----------------------------------|
| Load csv file                               | read_csv()             | pd.read_csv()                     |
| change column names                         | colnames()[] <- ()     | dataframe.rename(columns={'':''}) |
| merge data frames by common variable        | merge(data.frame, data.frame, by="" | A colon (:) and      |
| get rid of value in data frame              | filter(variable != " " | data.frame[data.frame.variable !=""] |
| get rid of certain columns                  | select(-c( ))          | data.frame.drop([])               |
| group by certain variable                   | group_by()             | data.frame.groupby                |
| mean based on group by in data frame        | summarize(x = mean())  | .agg({" ": ["mean"]})             |
| SD based on group by in data frame          | summarize(x = sd())    | .agg({" ": ["std"]})              |

A. The coefficient of variation is found by dividing the standard deviation by the mean. This value measures 
the dispersion of either a frequency distribution or probability distribution, meaning that the higher the
coefficient of variation is, the greater the dispersion around the mean, and the lower the coefficient of
variation, the more precise the estimate is.
B. The coefficient of variation, from highest to lowest for the 4 census regions, is the South, Midwest, West,
Northeast. This means that there is the most dispersion around the mean opioid deaths in the South, so the mean
opioid deaths does not accurate the entire region of the South well. In contrast, the Northeast has the least
variability around the mean opioid deaths.
D. My favorite topic from this course was when we learned about how to link R and Python programs with Github.
I thought this was very intersting because it shows how easily programmers can share and collaborate with their
work all in one place. I never knew that was possible and thought that coding was just restricted to the platforms we code on. I also really like how you can commit changes on Github so you can look back and see the process and changes throught writing a program.

