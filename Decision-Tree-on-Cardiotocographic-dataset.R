# Decision Tree using Party Package 
# Classes = Normal, Suspect, Pathologic  
# NSP variable is representing classes (it's a categorical variable)
# Get the current working directory to check where the script is being run
getwd()
# Load the dataset from the specified file path
data <- read.csv("C:/Users/Hirdesh Kumar Yadav/Downloads/Cardiotocographic.csv")
# Check the structure of the data to see variable types and content
str(data)
# View the dataset in a tabular format
View(data)
# Convert the integer variable 'NSP' into a factor (categorical variable) 'NSPF'
data$NSPF <- factor(data$NSP)
# Check the structure of the data again to verify that the new factor variable is added
str(data)
# Training and Testing Data
# Set a seed to ensure the sampling is reproducible
set.seed(1234)

# Randomly split the dataset into 80% training and 20% testing
pd <- sample(2, nrow(data), replace = TRUE, prob = c(0.8, 0.2))
# 'pd' will have 2 levels (1 for training, 2 for testing). The probabilities set 80% for training and 20% for testing
pd
# Create the training dataset where 'pd' is 1 (80% of the data)
train <- data[pd == 1, ]
# View the training dataset
train
# Create the test dataset where 'pd' is 2 (20% of the data)
test <- data[pd == 2, ]
# Decision Tree using Party Package
# Install the 'party' package for conditional inference trees
install.packages("party")
# Load the 'party' package
library(party)
# Build a conditional inference tree model using 'NSPF' as the target variable and 'LB', 'AC', and 'FM' as predictors
tree <- ctree(NSPF ~ LB + AC + FM, data = train,  
              controls = ctree_control(mincriterion = 0.90, minsplit = 200))
# 'mincriterion = 0.90' sets the confidence level at 90%
# 'minsplit = 200' specifies that a split occurs only if there are at least 200 observations in the node
# Print the tree model summary
tree
# Visualize the decision tree
plot(tree)
# Prediction on the test dataset
# Predict the probabilities of each class
predict(tree, test, type = "prob")
# Predict the class labels
predict(tree, test)
# Decision Tree with rpart package
# Load the 'rpart' package for another decision tree implementation
library(rpart)
# Build a decision tree model using 'rpart' with 'NSPF' as the target and 'LB', 'AC', and 'FM' as predictors
tree1 <- rpart(NSPF ~ LB + AC + FM, train)
# Load 'rpart.plot' package for better visualization of rpart trees
library(rpart.plot)
# Visualize the rpart decision tree
rpart.plot(tree1)

# Predict the class labels for the test dataset using the 'rpart' model
predict(tree1, test)
# Misclassification error for training data
# Create a confusion matrix to compare predicted vs actual labels for the training data
table <- table(predict(tree), train$NSPF)
# View the confusion matrix
table
# Calculate the misclassification error for the training data
1 - sum(diag(table) / sum(table)) # Proportion of incorrectly classified instances
# Misclassification error for testing data
# Predict the class labels for the test dataset using the 'party' package model
predtest <- predict(tree, test)
# Create a confusion matrix to compare predicted vs actual labels for the test data
table <- table(predtest, test$NSPF)
# View the confusion matrix
table
# Calculate the misclassification error for the test data
1 - sum(diag(table) / sum(table)) # Proportion of incorrectly classified instances