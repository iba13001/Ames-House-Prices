### Motivation
We want to know how a house buyer describes their dream house. Do they start with describing the neighborhood, the number of rooms, the number of cars in the garage, etc?! What are their preferences?! We also want to develop a model to predict the house prices based on the available preferences.

We will use a dataset of homes in Ames, Iowa to explores 79 variables and to build a prediction model using the train dataset. Then, the model will be used to predict the house prices in the test dataset.

This work was done as part of the Kaggle competition (House Prices - Advanced Regression Techniques)

### Model Description
Gradient Boosting Regressor trees were used to train and to build the model. The predicted prices got a Root Mean Squared Logarithmic Error of 0.13426
as calculated by Kaggle.
[a link](https://www.kaggle.com/ibrahimemadeldin/competitions)

### Reference

The Ames Housing dataset was compiled by Dean De Cock for use in data science education.

### File Description

data_description.txt: A description of the features in the datasets.

HousePrices_train.ipynb: The Python notebook used to explore the data and to build and train the model.
imputation_train_setcsv: The imputation test data imported in the imputation.R code.
imputed_train_data.csv: The imputed test data exported from the imputation.R code.

HousePrices_test.ipynb: The Python notebook used to process the test data set and to predict the house prices.
imputation_test_set.csv: The imputation test data imported in the imputation.R code.
imputed_test_data.csv: The imputed test data exported from the imputation.R code.

imputation.R: The R code used to impute missing LotFrontage data using KNN Gower distance.

predictions_ia.csv: The predicted house prices from the test data.
