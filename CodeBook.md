---
title: "CodeBook"
author: "Varun Juyal"
date: "September 18, 2015"
output: 
  html_document: 
    number_sections: yes
---
Variable        Description

actLabelsF      Relative path to a file containing mapping b/w activity and labels

fileUrl         Url to DataSet file

featuresF       Relative path to a file containing all features

testDataF       Relative path to a file containing test data

testLabelsF     Relative path to a file containing test labels

subTestF        Relative path to a file containing subject on which tests were carried on

trainDataF      Relative path to a file containing training data

trainLabelsF    Relative path to a file containing training labels

subTrainF       Relative path to a file containing subject on which trainings were carried on

actLabels       Factor variable holding all activity labels

features        Factor Variable holding all features

extractFeatures Integer vector holding features we are interested in 

subTest         Data frame containing data of subjects on whch tests were carried on

testLabels      Data frame containing all test labels

testData        Data frame containing test data

subTrain        Data frame containing data of subjects who did trainings

trainLabels     Data frame containing training labels

trainData       Data frame containing training data

allData         Data table holding data from both training and test datasets

tidyData        Data table holding final tided dataset after average of variables and grouped by Activty and Subject

