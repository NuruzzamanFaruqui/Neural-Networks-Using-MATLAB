# Project 1: Breast-cancer classification

A network learns to tell benign tumours from malignant ones using 30 measurements per tumour. The data are split 398 / 85 / 86 into training, validation and test sets, and training stops early when the validation loss stops improving.

## How to run

Set the MATLAB working directory to this folder and run:

```matlab
>> Evaluate_Cancer
```



## What is in this folder

| File | What it does |
|---|---|
| `Split_Cancer.m` | Splits the data into training, validation and test sets. |
| `Training_Cancer.m` | Trains with early stopping and keeps the best weights. |
| `Evaluate_Cancer.m` | Runs training, then reports accuracy, the confusion matrix, precision, recall, specificity, F1, AUC and a threshold table. |
| `BackPropagation_Project.m` | Back-propagation with a cross-entropy cost. |
| `Cross_Entropy.m` | The loss used for early stopping. |
| `Confusion_Matrix.m` | Counts TP, FP, FN and TN at a threshold. |
| `ReLU.m, Sigmoid.m` | Activation functions. |
| `cancer.csv` | The data. |

## What you should see

Training stops at epoch 91 and the best weights come from epoch 71. Accuracy is 98.99% (training), 97.65% (validation) and 97.67% (test). On the test set: TP 30, FN 0, FP 2, TN 54, precision 0.9375, recall 1.000, specificity 0.9643, F1 0.9677. The majority-class baseline is 65.12%. No malignant tumour is missed on the test set.

## Figures made from these results

![Training and validation loss](../../Figures/Fig_10_Loss.png)

![Test confusion matrix](../../Figures/Fig_10_Confusion.png)

![ROC curve](../../Figures/Fig_10_ROC.png)

---
[Back to the main page](../../README.md) · [Chapter list](../../README.md#chapter-guide)
