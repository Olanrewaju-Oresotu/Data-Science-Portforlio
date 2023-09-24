# ... (Previous code remains unchanged)

# Decision Tree Model
# Data Transformation
# Split the data into training and test sets
set.seed(42)
mushroom[,"train"] <- ifelse(runif(nrow(mushroom)) < 0.7, 1, 0)
trainset <- mushroom[mushroom$train == 1,]
testset <- mushroom[mushroom$train == 0,]

# Remove the train column
trainset <- trainset[-23]
testset <- testset[-23]

# Model Training
# Decision tree using "class" as the variable to predict and all other variables as predictors
library(rpart)
mush_tree <- rpart(class ~ ., data = trainset, method = "class")

# Print a summary of the decision tree model
print(mush_tree)

# Data Visualization (Decision Tree)
library(rpart.plot)
rpart.plot(mush_tree, extra = 106)

# Model Evaluation
# Predict the class labels for the test set
test_data <- testset[-22]
tree_pred <- predict(mush_tree, newdata = testset, type = "class")

# Convert predicted class labels to binary (edible = 1, poisonous = 0)
tree_prob <- ifelse(tree_pred == "edible", 1, 0)
testset$class <- ifelse(testset$class == "edible", 1, 0)

# Model Accuracy Evaluation
confusion_matrix <- table(predicted = tree_pred, actual = test_data$class)
print("Confusion Matrix:")
print(confusion_matrix)

# Calculate ROC curve and AUC
library(pROC)
par(pty = "s")
roc(testset$class, tree_prob, plot = TRUE, col = "red", legacy.axes = TRUE, 
    xlab = "False Positive Rate", ylab = "True Positive Rate", main="ROC CURVE"
    lwd = 2, print.auc = TRUE)

# F1 Score
f1_score <- f1Score(actual = test_data$class, predicted = tree_prob, cutoff = 0.5)
f1_score

# MCC (Matthews Correlation Coefficient)
mcc_score <- mcc(actual = test_data$class, predicted = tree_prob, cutoff = 0.5)
mcc_score

# ... (Continue with other relevant model evaluation metrics)

# Save decision tree-related plots and visualizations in a separate folder
# Create a "decision_tree_plots" folder if it doesn't exist
if (!dir.exists("decision_tree_plots")) {
  dir.create("decision_tree_plots")
}

# Save the decision tree plot
png("decision_tree_plots/decision_tree_plot.png")
rpart.plot(mush_tree, extra = 106)
dev.off()


# ... (Remaining code for other modeling approaches)
