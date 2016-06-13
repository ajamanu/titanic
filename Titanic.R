# Titanic.R
# Script for Kaggle, Titanic project
# Created by Aja Manu 13/06/2016

# Clear working environment
rm(list = ls())

# Set working directory
setwd("C:/Users/amanu/Documents/R/Kaggle/Titanic")

# Load data
titanic_train <- read.csv("train.csv") # training set
titanic_test <- read.csv("test.csv") # test set

# Load libraries
library(ggplot2) # for plotting
library(rpart) # for CART
library(rpart.plot) # for plotting CART

# Explore data------------------------------------------------------------------
# Summary of data
summary(titanic_train)
str(titanic_train)

# We're going to need a strategy to deal wiht missing values and blanks?
# Possibly through imputation using the "MICE" package.

# Plot of age data by Survived
ggplot(titanic_train, aes(Age)) +
      geom_histogram(binwidth = 10) +
      facet_wrap(~ Survived)

# For the moment set NA Ages to median age for both training and test data
titanic_train$Age[which(is.na(titanic_train$Age))] <- median(titanic_train$Age,
                                                             na.rm = TRUE)

titanic_test$Age[which(is.na(titanic_test$Age))] <- median(titanic_train$Age,
                                                             na.rm = TRUE)

# Plot of age data by Survived
ggplot(titanic_train, aes(Age)) +
      geom_histogram(binwidth = 10) +
      facet_wrap(~ Survived)

# Machine Learning Models-------------------------------------------------------
# Inital Logistic Regression
fitLR <- glm(Survived ~ Pclass + Sex + Age, data = titanic_train,
             family = "binomial")
summary(fitLR)
predTrain <- predict(fitLR, type = "response") # Predict LR on training set
table(titanic_train$Survived, predTrain > 0.5) # Confusion matrix based on Threshold level of 0.5
(454+249)/length(predTrain) # Training set Accuracy of 78%

# Inital CART
fitCART <- rpart(Survived ~ Pclass + Sex + Age, data = titanic_train, 
                 method = "class")
prp(fitCART)
predTrain <- predict(fitCART, type = "prob")[,2]
table(titanic_train$Survived, predTrain > 0.5) # Confusion matrix based on Threshold level of 0.5
(479+248)/length(predTrain) # Training Accuracy of 81.6%

# Prediction on Test Set--------------------------------------------------------
# Make predictions on Test Data
# Logistic Regression:
PredTest = predict(fitLR, newdata = titanic_test, type="response")
threshold = 0.5
PredTestLabels = as.factor(ifelse(PredTest<threshold, 0, 1))

# Submission files--------------------------------------------------------------
# Create new submission
MySubmission = data.frame(PassengerId = titanic_test$PassengerId, 
                          Survived = PredTestLabels)

# Out put submission in csv
write.csv(MySubmission, "SubmissionFitLR.csv", row.names=FALSE)
