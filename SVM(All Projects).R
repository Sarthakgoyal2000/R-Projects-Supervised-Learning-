library('caret')
str(bank.additional.full)
head(bank.additional.full)
intrain <- createDataPartition(y = bank.additional.full$V21, p= 0.7, list = FALSE)
training <- bank.additional.full[intrain,]
testing <- bank.additional.full[-intrain,]
dim(training); 
dim(testing);
anyNA(bank.additional.full)
summary(bank.additional.full)
training[["V21"]] = factor(training[["V21"]])
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
svm_Linear <- train(V21 ~., data = training, method = "svmLinear",
                    trControl=trctrl,
                    preProcess = c("center", "scale"),
                    tuneLength = 10)

svm_Linear
