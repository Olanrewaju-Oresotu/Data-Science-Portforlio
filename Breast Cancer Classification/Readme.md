
# Breast Cancer Histology Image Classification

This repository contains a comprehensive analysis of breast cancer histology images for classification purposes. The goal is to classify breast histology images into two classes: Invasive Ductal Carcinoma (IDC) positive and IDC negative. The analysis includes data preprocessing, model building, evaluation, and comparison of multiple machine learning models.

## Dataset

The dataset used for this analysis contains histology images of breast tissue. The dataset comprises two classes: IDC positive and IDC negative, representing the presence or absence of Invasive Ductal Carcinoma in the breast tissue.

### Data Description

- Total Images: 5547
- Image Dimensions: 50 x 50 pixels with RGB color channels
- Classes: IDC(-) and IDC(+)
- Class Distribution: Approximately balanced classes

## Data Preprocessing

### Data Splitting

The dataset was split into training and testing sets with an 80/20 ratio, ensuring an independent evaluation dataset.

### Data Augmentation

To prevent overfitting, data augmentation techniques such as horizontal flipping, random rotation, and zooming were applied to the images.

### Normalization

Images were normalized by rescaling pixel values to the range [0, 1] for faster model convergence.

## Models

### Model 1: Convolutional Neural Network (CNN)

- A deep CNN model with three convolutional layers followed by max-pooling layers and fully connected layers.
- The model was trained using categorical cross-entropy loss and achieved an accuracy of approximately 75%.

### Model 2: Transfer Learning (VGG16)

- Utilized the VGG16 pre-trained model with fine-tuning for breast cancer histology classification.
- Achieved an accuracy of approximately 71%, indicating that transfer learning did not significantly improve performance.

### Model 3: Multi-Layer Perceptron (MLP)

- An MLP model with several dense layers was trained.
- The model achieved an accuracy of approximately 74% on the test data.


## Model Comparison and Performance Analysis

In this section, we provide a comprehensive analysis of the performance of the three machine learning models: Convolutional Neural Network (CNN), Transfer Learning using VGG16, and a Multi-Layer Perceptron (MLP). We evaluate their performance based on various metrics, including accuracy, loss, classification reports, and ROC curves.

### 1. Convolutional Neural Network (CNN)

The CNN model is a deep neural network designed specifically for image classification tasks. It demonstrated the following performance:

- **Accuracy**: The CNN achieved the highest accuracy among the models, with approximately 75% accuracy on the test data. This indicates that it was the most effective in distinguishing between IDC positive and IDC negative images.

- **Loss**: The CNN's training and validation loss curves indicated that the model was slightly overfitting, as the training loss continued to decrease while the validation loss stagnated.

- **Classification Report**: The classification report showed reasonable precision, recall, and F1-score for both IDC(+) and IDC(-) classes. However, there was room for improvement in terms of model generalization.

- **ROC Curve**: The Receiver Operating Characteristic (ROC) curve demonstrated that the CNN had a relatively good ability to discriminate between the two classes, with an area under the curve (AUC) indicating better-than-random performance.

### 2. Transfer Learning (VGG16)

Transfer learning involves using a pre-trained model, in this case, VGG16, as a feature extractor and fine-tuning it for the specific task. The performance of this approach was as follows:

- **Accuracy**: The VGG16-based model achieved an accuracy of approximately 71% on the test data. While this is a respectable accuracy, it was slightly lower than that of the CNN model, suggesting that transfer learning did not provide a significant advantage in this case.

- **Loss**: Similar to the CNN, the VGG16-based model showed signs of overfitting, with the training loss decreasing while the validation loss plateaued.

- **Classification Report**: The classification report indicated reasonable precision, recall, and F1-score for both classes but did not outperform the CNN model.

- **ROC Curve**: The ROC curve showed a moderate ability to discriminate between classes, with an AUC that was lower than that of the CNN.

### 3. Multi-Layer Perceptron (MLP)

The MLP model employed a different architecture, consisting of fully connected layers. Its performance was as follows:

- **Accuracy**: The MLP model achieved an accuracy of approximately 74% on the test data, which was competitive with the other models.

- **Loss**: The training and validation loss curves showed similar signs of overfitting, with the training loss decreasing more rapidly than the validation loss.

- **Classification Report**: The MLP's classification report indicated good precision, recall, and F1-score for both classes, demonstrating its effectiveness in distinguishing between IDC(+) and IDC(-) images.

- **ROC Curve**: The ROC curve of the MLP model also exhibited moderate discriminative power, with an AUC comparable to that of the VGG16 model.

### Discussion

- **Model Comparison**: Among the models tested, the CNN outperformed the others in terms of accuracy and generalization. However, it also displayed the most significant overfitting. The VGG16-based transfer learning approach did not yield a substantial improvement, while the MLP model achieved competitive results.

- **Overfitting**: All three models exhibited signs of overfitting, suggesting that further regularization techniques, such as dropout or early stopping, could be beneficial to improve generalization.

- **Complexity vs. Performance**: The CNN, with its convolutional layers, was well-suited for image classification tasks and demonstrated the highest accuracy. The VGG16-based model, being a more complex architecture, did not significantly outperform the simpler models.

- **Room for Improvement**: Hyperparameter tuning, architecture modifications, and larger datasets may further enhance model performance.

In conclusion, while the CNN model demonstrated the highest accuracy, each model had its strengths and weaknesses. The choice of the best model depends on factors like computational resources, training time, and the desired balance between model complexity and performance. Further experimentation and fine-tuning are recommended for achieving even better results in breast cancer histology image classification.

### Observations

- The CNN model outperformed other models with an accuracy of 75%.
- All models demonstrated some degree of overfitting, with the CNN model being the most prone.

## Future Work

- Further hyperparameter tuning and regularization techniques could improve model performance.
- More advanced architectures like ResNet or Inception could be explored.
- Additional data augmentation techniques or pre-processing methods may be applied.

## Conclusion

This analysis demonstrated the potential of machine learning models to classify breast cancer histology images. The CNN model achieved the highest accuracy among the models tested, indicating its suitability for this classification task. Further improvements and optimizations can be explored for enhanced model performance.

The results of this analysis contribute to the development of automated breast cancer histology image classification systems, which can aid in early diagnosis and treatment decisions for breast cancer patients.

For detailed code implementations and further exploration, refer to the Jupyter Notebook in this repository.

**Author:** Lanre Oresotu

Feel free to customize this README document with your name, date, and any additional information or insights you want to highlight from your analysis.
