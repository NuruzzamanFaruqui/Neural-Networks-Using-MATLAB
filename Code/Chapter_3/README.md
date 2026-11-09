# Chapter 3: Multi-layer network, back-propagation, momentum and cross-entropy

A hidden layer lets the network solve a problem that a single layer cannot (the XOR pattern). This folder holds three versions of back-propagation: the plain one, one with momentum, and one with a cross-entropy cost function. Two comparison scripts test the claims behind them over many random starts.

## How to run

```matlab
>> Training_Multilayer      % then
>> Testing_Multilayer

>> Training_with_Momentum   % then
>> Test_Momentum

>> Training_CE              % then
>> Testing_CE

>> rng(1); Compare_Momentum        % self-contained
>> rng(1); Compare_CostFunctions   % self-contained
```

Training scripts first, testing scripts second, in the same session. The two `Compare_` scripts are self-contained.

## What is in this folder

| File | What it does |
|---|---|
| `Training_Multilayer.m / Testing_Multilayer.m` | Plain back-propagation on the XOR problem, and its test. |
| `BackPropagation.m` | One epoch of back-propagation with the squared-error delta rule. |
| `Training_with_Momentum.m / Test_Momentum.m` | Training with momentum, and its test. |
| `BackPropagation_Momentum.m` | Back-propagation with a momentum term for each weight matrix. |
| `Training_CE.m / Testing_CE.m` | Training with cross-entropy, and its test. |
| `BackPropagation_CE.m` | Back-propagation where the output delta comes from the cross-entropy cost. |
| `Compare_Momentum.m` | Trains with and without momentum from the same starting weights and plots both error curves. |
| `Compare_CostFunctions.m` | Trains with squared error and with cross-entropy and plots both error curves. |
| `Sigmoid.m` | The sigmoid activation function. |

## What you should see

The correct XOR outputs are `0 1 1 0`.

| Script | Output 1 | Output 2 | Output 3 | Output 4 |
|---|---|---|---|---|
| `Testing_Multilayer` | 0.0053 | 0.9890 | 0.9882 | 0.0142 |
| `Test_Momentum` | 0.0014 | 0.9970 | 0.9965 | 0.0041 |
| `Testing_CE` | 0.0000 | 0.9999 | 0.9997 | 0.0004 |

The book also repeats both comparisons over 20 random starting points. Momentum reached an error below 0.01 in 20 of 20 runs (median 87 epochs) against 18 of 20 without it (median 662). Cross-entropy reached the target in 17 of 20 runs (median 374 epochs) against 18 of 20 for squared error (median 662). Three cross-entropy runs and two squared-error runs stalled. Your numbers will differ if your random seed differs.

## Figures made from these results

![Effect of momentum on the training error](../Figures/Fig_3_Momentum.png)

![Cross-entropy against squared error](../Figures/Fig_3_29.png)

---
[Back to the main page](../README.md) · [Chapter list](../README.md#chapter-guide)
