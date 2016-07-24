myPackages <- c("ggplot2", "rpart", "rpart.plot", "data.table", "RColorBrewer","rattle","randomForest")
notInstalledPackages <- myPackages[!(myPackages %in% rownames(installed.packages()))]

lapply(notInstalledPackages, install.packages, character.only = TRUE)
lapply(myPackages, require, character.only = TRUE)