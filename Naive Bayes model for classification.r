#naivebayes
mush_train <- trainset[,-22]
naive_model <- naiveBayes(x = mush_train, y = trainset$class,laplace = 1)
naive_model
naive_pred <- predict(naive_model, newdata = testset, type = "class")
naive_prob <- ifelse(naive_pred=="edible", 1, 0)

#Model Evaluation........................................
table(predicted = naive_prob, actual = testset$class)
mean(naive_prob==testset$class)
confusionMatrix(actual=testset$class, predicted = naive_prob, cutoff = 0.5)


f1Score(actual=testset$class, predicted = naive_prob, cutoff = 0.5)



# ... (Previous code remains unchanged)

# Naive Bayes Model
# Data Transformation
# Split the data into training and test sets (if not already done)
set.seed(42)
mush_train <- trainset[,-22]

# Model Training (Naive Bayes)
# Load the required library
library(e1071)

# Train the Naive Bayes model
naive_model <- naiveBayes(x = mush_train, y = trainset$class,laplace = 1)

# Model Evaluation
# Predictions
naive_pred <- predict(naive_model, newdata = testset, type = "class")
naive_prob <- ifelse(naive_pred=="edible", 1, 0) #convert the predictions to binary numbers

# Model Accuracy Evaluation
confusionMatrix -> table(predicted = naive_prob, actual = testset$class)
print("Confusion Matrix:")
print(confusion_matrix)

# Accuracy
accuracy <- mean(naive_prob==testset$class)
accuracy

# F1 Score
f1_score <- f1Score(actual=testset$class, predicted = naive_prob, cutoff = 0.5)
f1_score

# MCC (Matthews Correlation Coefficient)
mcc_score <- mcc(actual=testset$class, predicted = naive_prob, cutoff = 0.5)
mcc_score

#Calculate and visualize the ROC and AUC curve 
roc(testset$class, naive_prob, plot = TRUE, col = "red", legacy.axes = TRUE, 
    xlab = "False Positive Rate", ylab = "True Positive Rate", main="ROC CURVE"
    lwd = 2, print.auc = TRUE)

# Visualize Confusion Matrix
library(caret)
confusionMatrix(naive_pred, testset$class)


# ... (Remaining code for other modeling approaches)