# Chapter 4 (bonus): Multi-class classification of digits

A bonus folder that applies the Chapter 4 softmax network to a small set of handwritten-style digits, to show that the same code scales beyond Iris.

## How to run

```matlab
>> Training_Multiclass
>> Testing_Multiclass
>> Real_Multiclass
```

Set the MATLAB working directory to this folder, then run the training script first and the testing script second, in the same MATLAB session.

## What is in this folder

| File | What it does |
|---|---|
| `Training_Multiclass.m` | Trains the digit classifier. |
| `Testing_Multiclass.m` | Tests it on the training digits. |
| `Real_Multiclass.m` | Feeds the network a digit it has not seen. |
| `BackPropagation_Multiclass.m` | Back-propagation for a softmax output. |
| `Softmax.m, Sigmoid.m` | Activation functions. |

---
[Back to the main page](../../README.md) · [Chapter list](../../README.md#chapter-guide)
