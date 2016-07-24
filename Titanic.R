# Titanic.R
# Script for Kaggle, Titanic project
# Created by Aja Manu 13/06/2016

rm(list = ls())
HOME <- Sys.getenv("HOME")
source(file.path(HOME, "Dropbox", "titanic_env.R"))
source(file.path(WORKING_HOME, "importData.R"))
source(file.path(WORKING_HOME, "loadPackages.R"))

titanic_test <- readData(WORKING_HOME, "test")
titanic_train <- readData(WORKING_HOME, "train")

#
source(file.path(WORKING_HOME, "plotData.R"))

# Various analyses
source(file.path(WORKING_HOME, "main.R"))
source(file.path(WORKING_HOME, "logit_results.R"))
source(file.path(WORKING_HOME, "decisionTree_results.R"))
source(file.path(WORKING_HOME, "randomForest_results.R"))
