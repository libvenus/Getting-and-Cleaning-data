---
title: "README"
author: "Varun Juyal"
date: "September 18, 2015"
output: html_document
---

Here is how the script run_analysis.R works:

1. Download the zipped dataset to "getdata" directory(created if doesn't exist). Please note that you must have right to create a sub-directory in the directory from which you run this script.

2. Unzip the downloaded zipped dataset

3. Read and merge the test set, labels and subjects (content gets added as a new column) into a test set(testData).

4. Read and merge the training set, labels and subjects(content gets added as a new column) into a training(trainData).

5. Now we merge the test and training data set (allData) 

6. Identify columns with mean and standard deviation and extract those measurements only into a data table(intData) 

7. Give meaningful names to both the columns/variables names(mean and stdev) and actvities

8. Average columns other than "Activity, Activity_ID and Subject" and group the data by "Actvity and Subject" and store in a variable(tidyData)

9. Write data(tidyData) to disk

Here is how to run the script:

./run_analysis.R