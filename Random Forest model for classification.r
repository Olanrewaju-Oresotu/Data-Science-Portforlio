# ... (Previous code remains unchanged)

# Random Forest Model
# Data Transformation
# Split the data into training and test sets (if not already done)
set.seed(42)
mushroom[,"train"] <- ifelse(runif(nrow(mushroom)) < 0.7, 1, 0)
trainset <- mushroom[mushroom$train == 1,]
testset <- mushroom[mushroom$train == 0,]

# Remove the train column (if not already done)
trainset <- trainset[-23]
testset <- testset[-23]

# Model Training (Random Forest)
# Load the required library
library(randomForest)

# Define the model formula
model_formula <- as.formula("class ~ .")

# Train the Random Forest model
rf_model <- randomForest(model_formula, data = trainset, ntree = 100, importance = TRUE)

# Model Evaluation
# Predictions
rf_pred <- predict(rf_model, testset, type = "response")

# Model Accuracy Evaluation
confusion_matrix <- table(predicted = rf_pred, actual = testset$class)
print("Confusion Matrix:")
print(confusion_matrix)

# Feature Importance
importance_matrix <- importance(rf_model)
print(importance_matrix)

# Visualize Feature Importance
png("random_forest_feature_importance.png")
varImpPlot(rf_model, main = "Random Forest - Feature Importance")
dev.off()

# Variable Importance in decreasing order
print(importance_matrix[order(importance_matrix, decreasing = TRUE),])


# ... (Remaining code for other modeling approaches)
