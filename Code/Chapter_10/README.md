# Chapter 10: Seven real-world projects

Seven complete projects, each in its own self-contained folder with its own data, helper functions and scripts. Every project follows the same recipe: split the data, train with early stopping, evaluate honestly.

## How to run

Open a project folder, set it as the MATLAB working directory, then run its `Evaluate_` script (it calls the training script itself):

```matlab
>> Evaluate_Cancer
```

## What is in this folder

| File | What it does |
|---|---|
| `P1_Classification` | Breast-cancer detection with a neural network, with threshold analysis and ROC curve. |
| `P2_Regression` | Predicting car fuel economy (mpg) and beating a linear model. |
| `P3_Clustering` | Grouping 178 wines with K-means, and again after an autoencoder compresses them. |
| `P4_Recommender` | A film recommender built on an autoencoder. |
| `P5_Forecasting` | Forecasting tomorrow's temperature from the weather so far. |
| `P6_Anomaly` | Detecting malignant tumours that the network never saw in training. |
| `P7_Warehouse` | A warehouse robot trained with Q-learning. |

---
[Back to the main page](../README.md) · [Chapter list](../README.md#chapter-guide)
