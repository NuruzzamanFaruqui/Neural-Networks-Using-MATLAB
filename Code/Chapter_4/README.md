# Chapter 4: Classification of Iris flowers with softmax

A neural network with a softmax output layer sorts 150 iris flowers into three species. This folder also measures how the accuracy drops when noise is added to the measurements, and plots the learning curve.

## How to run

```matlab
>> Training_Iris
>> Testing_Iris
>> Learning_Curve_Iris
>> Noisy_Iris
```

Set the MATLAB working directory to this folder, then run the training script first and the testing script second, in the same MATLAB session. `Learning_Curve_Iris` and `Noisy_Iris` train the network themselves where needed.

## What is in this folder

| File | What it does |
|---|---|
| `Training_Iris.m` | Standardises the measurements and trains the network (softmax output). |
| `Testing_Iris.m` | Shows the output of six sample flowers and the accuracy. |
| `BackPropagation_Multiclass.m` | Back-propagation for a softmax output with cross-entropy. |
| `Learning_Curve_Iris.m` | Records error and accuracy at every epoch. |
| `Noisy_Iris.m` | Adds increasing noise to the measurements and reports the accuracy. |
| `Softmax.m, Sigmoid.m` | Activation functions. |
| `iris.csv` | The data. |

## What you should see

The six sample flowers in `Testing_Iris` are all classified correctly (accuracy 1). In the learning curve, the accuracy first passes 97% at epoch 6 and 98% at epoch 19, then wobbles between 97.3% and 99.3%. With noise added, the accuracy falls step by step from 100% to 70.2%.

## Figures made from these results

![Iris learning curve](../Figures/Fig_4_Learning_Curve.png)

---
[Back to the main page](../README.md) · [Chapter list](../README.md#chapter-guide)
