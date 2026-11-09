# Chapter 9: Measuring performance honestly

Accuracy alone can mislead. This folder builds the confusion matrix, precision, recall, F1 score and the regression measures MAE, RMSE and R² from scratch, and measures a Q-learner by its success rate.

## How to run

```matlab
>> Evaluate_Iris          % classification measures
>> Evaluate_Regression    % regression measures
>> Evaluate_QLearning     % success rate against training budget
```

Each script is self-contained.

## What is in this folder

| File | What it does |
|---|---|
| `Evaluate_Iris.m` | Trains on 120 flowers, tests on 30, prints the confusion matrix, precision, recall, F1. |
| `Multiclass_Confusion.m` | Builds the confusion matrix for any number of classes. |
| `Evaluate_Regression.m` | Predicts diabetes progression and reports MAE, MSE, RMSE and R². |
| `Evaluate_QLearning.m` | Success rate and average steps for six training budgets. |
| `BackPropagation_Multiclass.m, GridWorld.m, QLearning.m` | Training and environment functions. |
| `Sigmoid.m, Softmax.m` | Activation functions. |
| `iris.csv, diabetes.csv` | The data. |

## What you should see

Iris, 30 unseen flowers: confusion matrix `[8 0 0; 0 7 1; 0 1 13]`, accuracy 93.33%, macro F1 0.9345.

Diabetes regression, 88 unseen patients: MAE 45.09, RMSE 56.10, R² 0.510. Guessing the average gives an MAE of 68.44.

Q-learning success rate for training budgets of 10, 20, 40, 80, 160 and 300 episodes: 0, 0.02, 0.74, 1, 1 and 1. The average steps fall from 50.0 to 8.0.

## Figures made from these results

![Iris confusion matrix](../Figures/Fig_9_Iris_Confusion.png)

![Predicted against actual progression](../Figures/Fig_9_Regression.png)

![Q-learning success rate](../Figures/Fig_9_RL.png)

---
[Back to the main page](../README.md) · [Chapter list](../README.md#chapter-guide)
