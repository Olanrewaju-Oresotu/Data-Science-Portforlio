# XGBoosting
# Prepare the training and test matrices
train_matrix <- model.matrix(class ~ ., trainset)
test_matrix <- model.matrix(class ~ ., testset)

# Prepare labels for training (1 for "edible", 0 for "poisonous")
train_labels <- ifelse(trainset$class == "edible", 1, 0)

# Create data and label variables
x <- train_matrix
y <- train_labels

# Train the XGBoost model
library(xgboost)

# Define XGBoost parameters
xgb_params <- list(
  booster = "gbtree",
  objective = "binary:logistic",
  eta = 0.1,            # Learning rate
  nrounds = 50,         # Number of boosting rounds (trees)
  max_depth = 2,        # Maximum tree depth
  verbose = 0           # Silent mode (no output)
)

xgbmodel <- xgboost(data = train_matrix, label = train_labels, params = xgb_params)

# Make predictions on the test set
xgb_pred <- predict(xgbmodel, test_matrix, type = "response")

# Convert predicted probabilities to binary predictions
xgb_prob <- ifelse(xgb_pred > 0.5, 1, 0)

# Model Evaluation
# Confusion matrix
xgb_confab <- table(predicted = xgb_prob, actual = testset$class)
print("Confusion Matrix:")
print(xgb_confab)

# Confusion Matrix with additional metrics
library(caret)
confusionMatrix(actual = testset$class, predicted = xgb_prob, cutoff = 0.5)

# F1 Score
library(ModelMetrics)
f1Score(actual = testset$class, predicted = xgb_prob)

# MCC (Matthews Correlation Coefficient)
mcc(actual = testset$class, predicted = xgb_prob, cutoff = 0.5)

# ROC Curve and AUC
library(pROC)
par(pty = "s")
roc_result <- roc(testset$class, xgb_prob, plot = TRUE, col = "red",
                  legacy.axes = TRUE, xlab = "False Positive Rate",
                  ylab = "True Positive Rate", main = "Area Under Curve",
                  lwd = 2, print.auc = TRUE)

# Feature Importance - Variable Importance (Decreasing Order)
importance_matrix <- xgb.importance(feature_names = colnames(test_matrix), model = xgbmodel)
print(importance_matrix[order(importance_matrix, decreasing = TRUE),])

# Cross-Validation
# Create a DMatrix for XGBoost cross-validation
dtrain <- with(trainset, xgb.DMatrix(train_matrix, label = train_labels))

# Cross-validation
cv <- xgb.cv(data = dtrain, nrounds = 31, nthread = 2, nfold = 5,
             metrics = list("error", "auc"), max_depth = 3, eta = 0.2,
             objective = "binary:logistic")

# Display cross-validation results
print(cv)

# Hyperparameter Tuning
params <- list(
  booster = "gbtree",
  objective = "binary:logistic",
  eta = 0.1,
  gamma = 0,
  max_depth = 5,
  min_child_weight = 1,
  subsample = 1,
  colsample_bytree = 1
)

# Hyperparameter tuning with cross-validation
xgbcv <- xgb.cv(params = params, data = dtrain, nrounds = 100, nfold = 5,
                 showsd = TRUE, stratified = TRUE, metrics = list("error", "auc"),
                 print.every.n = 10, early.stop.round = 20, maximize = FALSE)

# Display hyperparameter tuning results
print(xgbcv)
