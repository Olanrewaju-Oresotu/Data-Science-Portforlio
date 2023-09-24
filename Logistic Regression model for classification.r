# Logistic Regression Model
# Data Transformation
# Split the data into training and test sets (if not already done)
set.seed(42)
mushroom[,"train"] <- ifelse(runif(nrow(mushroom)) < 0.7, 1, 0)
trainset <- mushroom[mushroom$train == 1,]
testset <- mushroom[mushroom$train == 0,]

# Remove the train column (if not already done)
trainset <- trainset[-23]
testset <- testset[-23]

# Model Training (Logistic Regression)
# Load the required library
library(glmnet)

# Define the model formula
model_formula <- as.formula("class ~ .")

# Create design matrices
X_train <- model.matrix(model_formula, data = trainset)
Y_train <- ifelse(trainset$class == "edible", 1, 0)

X_test <- model.matrix(model_formula, data = testset)

# Train the Logistic Regression model
logistic_model <- glmnet(X_train, Y_train, family = "binomial")

# Model Evaluation
# Predict probabilities for the test set
logistic_prob <- predict(logistic_model, s = 0.01, newx = X_test, type = "response")

# Convert probabilities to binary predictions (1 for edible, 0 for poisonous)
logistic_pred <- ifelse(logistic_prob > 0.5, 1, 0)

# Model Accuracy Evaluation
confusion_matrix <- table(predicted = logistic_pred, actual = testset$class)
print("Confusion Matrix:")
print(confusion_matrix)

# Calculate and visualize the ROC curve and AUC
library(pROC)
# Convert logistic_prob to a numeric vector
logistic_prob_numeric <- as.numeric(logistic_prob)

roc_result <- roc(testset$class, logistic_prob_numeric)
par(pty = "s")
roc(testset$class, logistic_prob_numeric, plot = TRUE, col = "red", legacy.axes = TRUE, 
    xlab = "False Positive Rate", ylab = "True Positive Rate", 
    main = "ROC Curve", lwd = 2, print.auc = TRUE)

# F1 Score
library(ModelMetrics)
f1_score <- f1Score(actual=testset$class, predicted = logistic_prob, cutoff = 0.5)
f1_score

# MCC (Matthews Correlation Coefficient)
mcc_score <- MCC(data.table(logistic_prob = logistic_prob, class = testset$class))
mcc_score

# Save Logistic Regression-related plots and visualizations in a separate folder
# Create a "logistic_regression_plots" folder if it doesn't exist
if (!dir.exists("logistic_regression_plots")) {
  dir.create("logistic_regression_plots")
}

# Save the ROC curve plot
png("logistic_regression_plots/roc_curve.png")
roc(testset$class, logistic_prob, plot = TRUE, col = "red", legacy.axes = TRUE, 
    xlab = "False Positive Rate", ylab = "True Positive Rate", 
    main = "ROC Curve", lwd = 2, print.auc = TRUE)
dev.off()
