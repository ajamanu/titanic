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

# Summary of data
summary(titanic_train)
str(titanic_train)

# Plot data
ggplot(titanic_train, aes(Age)) +
      geom_histogram(binwidth = 10)
