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
