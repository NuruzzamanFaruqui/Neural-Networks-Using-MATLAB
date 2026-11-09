# Chapter 5 (bonus): Deep ReLU and dropout networks on digits

A bonus folder that applies the Chapter 5 deep networks to the small digit set of the Chapter 4 bonus folder.

## How to run

```matlab
>> Training_DeepReLU
>> Testing_DeepReLU
>> Training_Dropout
>> Testing_Dropout
>> Compare_Activations
```

Set the MATLAB working directory to this folder, then run the training script first and the testing script second, in the same MATLAB session.

## What is in this folder

| File | What it does |
|---|---|
| `Training_DeepReLU.m / Testing_DeepReLU.m` | Deep ReLU network on digits, and its test. |
| `Training_Dropout.m / Testing_Dropout.m` | Dropout network on digits, and its test. |
| `Compare_Activations.m` | ReLU against sigmoid on digits. |
| `BackPropagation_*.m, Dropout.m` | Training functions. |
| `ReLU.m, Sigmoid.m, Softmax.m` | Activation functions. |

---
[Back to the main page](../README.md) · [Chapter list](../README.md#chapter-guide)
