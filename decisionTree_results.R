# Build the decision tree
my_tree <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, 
                 data = titanic_train, 
                 method = "class")

# Time to plot your fancy tree
fancyRpartPlot(my_tree)


# Inital CART
#fitCART <- rpart(Survived ~ Pclass + Sex + Age, data = titanic_train, 
#                method = "class")
#prp(fitCART)
#predTrain <- predict(fitCART, type = "prob")[,2]
#table(titanic_train$Survived, predTrain > 0.5) # Confusion matrix based on Threshold level of 0.5
#(479+248)/length(predTrain) # Training Accuracy of 81.6%


