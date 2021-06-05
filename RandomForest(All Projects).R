install.packages("caret", dependencies = TRUE)
install.packages("randomForest")
library(caret)
library(randomForest)
#data splicing
set.seed(12345)
train1 <- sample(1:nrow(train),size = ceiling(0.80*nrow(train)),replace = FALSE)
# training set
train_train <- train[train1,]
# test set
train_test <- train[-train1,]
head(train_test)

# Converting &lsquo;Survived&rsquo; to a factor
train$price_range <- factor(train$price_range)
# Set a random seed
set.seed(51)
# Training using &lsquo;random forest&rsquo; algorithm
model <- train(price_range ~ battery_power + clock_speed + dual_sim +
                 fc + int_memory + n_cores, # Survived is a function of the variables we decided to include
               data = train, # Use the train data frame as the training data
               method = 'rf',# Use the 'random forest' algorithm
               trControl = trainControl(method = 'cv', # Use cross-validation
                                        number = 5)) # Use 5 folds for cross-validation
train_test$price_range <- predict(model, newdata = train_test)
train_test$price_range

