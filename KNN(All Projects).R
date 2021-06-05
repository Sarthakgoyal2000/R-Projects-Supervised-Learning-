str(adult)
table(adult$gender)
round(prop.table(table(adult$gender)) * 100, digits = 1)
prc <- adult
prc <- adult[-2]
prc <- prc[-3]
prc <- prc[-4:-7]
prc <- prc[-8:-9]
View(prc)
#Normalizing numeric data
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }
prc_n <- as.data.frame(lapply(prc[1:3], normalize))
View(prc_n)
summary(prc_n$age)
#Creating training and test data set
prc_train <- prc_n[1:65,]
prc_test <- prc_n[66:100,]
prc_train_labels <- prc[1:65, 1]
prc_test_labels <- prc[66:100, 1]
#Training a model on data
library(class)
prc_test_pred <- knn(train = prc_train, test = prc_test,cl = prc_train_labels, k=10)
#Evaluate the model performance
library(crosstable)
crosstable(x=prc_test_labels,y=prc_test_pred,prop.chisq=FALSE)


