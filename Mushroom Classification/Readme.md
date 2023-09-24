
# Mushroom Classification

This repository contains code and data for classifying mushrooms as edible or poisonous using various machine learning models. The dataset used in this project is the Mushroom dataset.

## Dataset

The Mushroom dataset consists of various features describing different attributes of mushrooms and a target variable indicating whether the mushroom is edible or poisonous.

## Data Exploration and Preprocessing

The data preprocessing and exploration steps include:

- **Data Import**: The dataset was loaded using the `read.csv` function from the `tidyverse` library.

- **Data Overview**: Initial exploration involved checking the dimensions of the dataset, viewing the first few rows, and examining the data structure using `dim()`, `head()`, `str()`, and `summary()`.

- **Missing Data**: Missing data was identified using `colSums()` and visualized using the `vis_miss()` function from the `naniar` library. No missing values were found in this dataset.

- **Data Transformation**: Categorical variables were converted into factors to prepare them for modeling.

- **Variable Recoding**: Levels for each categorical variable were redefined to enhance interpretability. This step included renaming and grouping similar categories.

## Univariate Exploratory Data Analysis (UEDA)

For each categorical variable in the dataset, univariate distribution plots were created to understand the distribution of features. These visualizations help in identifying patterns and potential variables that may be predictive of edibility.

## Multivariate Exploratory Data Analysis (MVEDA)

Multivariate EDA involved analyzing relationships between variables, especially those that showed distinctions between edible and poisonous mushrooms. Visualizations were created to explore these relationships, including scatter plots, bar plots, and box plots.

## Decision Tree Model

The Decision Tree model was created using the following steps:

- **Model Training**: A decision tree model was trained using the "class" variable as the target using the `rpart` library.

- **Model Evaluation**: Model performance was assessed using various metrics, including accuracy, F1 Score, Matthews Correlation Coefficient (MCC), ROC curve, and Area Under Curve (AUC). The results are available in the code.

- **Feature Importance**: The importance of each feature in the decision tree was analyzed using the XGBoost library. The most influential features were identified.

## Logistic Regression Model

The Logistic Regression model was created with the following steps:

- **Model Training**: A logistic regression model was trained and evaluated for its performance on the mushroom dataset.

- **Model Evaluation**: Similar to the Decision Tree model, model performance metrics including accuracy, F1 Score, MCC, ROC curve, and AUC were calculated and available in the code.

## Random Forest Model

The Random Forest model was built and evaluated:

- **Model Training**: A Random Forest model was trained and evaluated for its performance on the dataset.

- **Model Evaluation**: Similar to other models, accuracy, F1 Score, MCC, ROC curve, and AUC were calculated and available in the code.

- **Variable Importance**: The importance of each feature in the Random Forest model was analyzed using the cforest library. Feature importance plots are provided in the code.

## Support Vector Machine (SVM) Model

The SVM model was implemented and assessed:

- **Model Training**: A SVM model was trained and evaluated for its performance.

- **Model Evaluation**: Performance metrics, including accuracy, F1 Score, MCC, ROC curve, and AUC, were calculated.

## Naive Bayes Model

The Naive Bayes model was developed and evaluated:

- **Model Training**: A Naive Bayes model was trained and evaluated for its performance on the dataset.

- **Model Evaluation**: Similar to other models, accuracy, F1 Score, MCC, ROC curve, and AUC were calculated and available in the code.

## XGBoost Model

The XGBoost model implementation involved the following steps:

- **Model Training**: An XGBoost model was trained and evaluated for its performance on the dataset. Hyperparameters were tuned using cross-validation.

- **Model Evaluation**: Similar to other models, performance metrics including accuracy, F1 Score, MCC, ROC curve, and AUC were calculated and available in the code.

- **Hyperparameter Tuning**: Hyperparameters were tuned using cross-validation, and results were reported.

## Repository Structure

The repository structure is organized as follows:

- `data`: Contains the dataset file (`mushrooms.csv`).
- `scripts`: Includes R scripts for data preprocessing and model building.
- `visualizations`: Stores visualizations related to the models.

## Getting Started

To reproduce the results and run the models, follow these steps:

1. Clone this repository to your local machine.

2. Install the necessary R packages if not already installed (listed in the scripts).

3. Execute the R scripts in the `scripts` directory. Each script corresponds to one of the models discussed above.

## Results

For detailed results of each model, including performance metrics and visualizations, refer to the respective sections in the scripts and the `visualizations` directory.

## Conclusion

This project demonstrates the application of various machine learning models for mushroom classification. Each model's performance and visualizations are provided to aid in understanding the data and choosing the most appropriate model for classification.

For any questions or issues, feel free to open an issue or contact [Your Name].


