# Decision-Tree-Project-on-Cardiotocographic-Dataset
A project that implements Decision Tree models using both the party and rpart packages in R to classify medical data.

## Description
This project demonstrates the implementation of Decision Tree algorithms using R. Two models are built using the `party` and `rpart` packages to classify medical data into three categories: **Normal**, **Suspect**, and **Pathologic**.

## Dataset
The dataset used for this project is based on Cardiotocographic data, with the target variable `NSP` representing the classes. 

## Requirements
- R
- Packages: `party`, `rpart`, `rpart.plot`

## Code Files
- `decision_tree_party.r`: Code to build a decision tree using the `party` package.
- `decision_tree_rpart.r`: Code to build a decision tree using the `rpart` package.

## How to Run
1. Load the dataset.
2. Run the respective script to build and visualize the Decision Tree.
3. Predict the outcomes using the test data and calculate the misclassification error.

## Project Structure
- `Cardiotocographic.csv`: The dataset used for training and testing.
- `decision_tree_party.r`: R script using the `party` package.
- `decision_tree_rpart.r`: R script using the `rpart` package.
- 
