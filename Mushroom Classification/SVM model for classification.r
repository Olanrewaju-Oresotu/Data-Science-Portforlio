# ... (Previous code remains unchanged)

# SVM Model
# Data Transformation
# Split the data into training and test sets (if not already done)
set.seed(42)
mushroom[,"train"] <- ifelse(runif(nrow(mushroom)) < 0.7, 1, 0)
trainset <- mushroom[mushroom$train == 1,]
testset <- mushroom[mushroom$train == 0,]

# Remove the train column (if not already done)
trainset <- trainset[-23]
testset <- testset[-23]

# Model Training (SVM)
# Load the required library
library(e1071)

# Define the model formula
model_formula <- as.formula("class ~ .")

# Train the SVM model
svm_model <- svm(model_formula, data = trainset, kernel = "linear", probability = TRUE)

# Model Evaluation
# Predictions
svm_pred <- predict(svm_model, newdata = testset, type = "response")
svm_prob <- ifelse(svm_pred=="edible", 1, 0)

# Model Accuracy Evaluation
confusion_matrix <- table(predicted = svm_pred, actual = testset$class)
print("Confusion Matrix:")
print(confusion_matrix)

# Calculate and visualize the ROC Curve and AUC
roc(testset$class, svm_prob, plot = TRUE, col = "red", legacy.axes = TRUE, 
    xlab = "False Positive Rate", ylab = "True Positive Rate", main ="ROC CURVE",
    lwd = 2, print.auc = TRUE)

# F1 Score
library(ModelMetrics)
f1_score <- f1Score(data.table(svm_prob = svm_prob, class = testset$class))
f1_score

# MCC (Matthews Correlation Coefficient)
mcc_score <- mcc(actual=testset$class, predicted = svm_prob, cutoff = 0.5)
mcc_score


# ... (Remaining code for other modeling approaches)
