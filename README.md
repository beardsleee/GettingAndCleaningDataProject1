### Project 1

This project is an attempt to satisfy the requirements of the Getting and Cleaning Data course.  
There is one script which will get the data, merge it into one dataset and write out a tidy dataset
that contains a subset of the data variables measured in the original experiment.  The only variables
that I am interested in are the one which have been labeled to be the mean "mean()" or standard deviation
"std()" of the measurements.

The following high level steps are executed by the script:
1. Download the data into the current R working directory file structure
2. Create a combined file of all the observations by appending the files
3. Select the features that are of interest using a regular expression to find the mean() and std()
4. Fix up the feature names so that they don't have any dashes or parentheses
5. Read the datafile using the selected features in the colClasses list
6. Add the subect and activity columns
6. Write out the data file