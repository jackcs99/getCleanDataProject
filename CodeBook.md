Introduction
This script takes training and test data, 
combines them into a single data frame, 
then inserts the descriptive names for the features (columns) and activty categorization.
The script then builds a new data frame by selecting 
only those features that contain the substrings "mean" or "std".
Finally, and most impressively, the mean of these features is calulated 
by the groups "subject" and "activity" and
the resultant tidy data frame is saved to a text file.

Variables and Processing
s,y,and x contain the downloaded test data
z is the combined test data.frame

st,yt, and xt contain the downloaded training data
zt is the combined training data.frame

zm is the combined test and training data frames

f and a contain the downloaded feature and activity descriptive data respectively.

zm_mean is the decimated data.frame with only features with "mean" or "std" substrings

aa is a matrix (rows,1) of activity descriptions matching the activity categories in zm_mean
aaa is a vector representation of aa
zm_mean$activity has the aa descrption inserted in place of the original categories

aveData is the tidy data set that has the average of the zm_mean features by subject and acitivity
aveData is stored in a text file named "averages.txt" as a table

the script also conatins the code to read and display the tidy table in "averages.txt"