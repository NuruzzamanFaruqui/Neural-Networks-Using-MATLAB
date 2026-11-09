# Chapter 2: Single-layer network trained with the batch method

The same neuron and the same four examples as in `Chapter_2_SGD`, but the weight update is calculated from the **average** of all four errors, once per epoch. Compare the two folders to see how SGD and batch training behave differently.

## How to run

```matlab
>> training_Batch
>> testing_Batch
```

Set the MATLAB working directory to this folder, then run the training script first and the testing script second, in the same MATLAB session.

## What is in this folder

| File | What it does |
|---|---|
| `training_Batch.m` | Initialises random weights and trains for 10,000 epochs with `function_Batch`. |
| `function_Batch.m` | One epoch of batch training: average the four weight updates, then update once. |
| `testing_Batch.m` | Prints the trained outputs for the four inputs. |
| `Sigmoid.m` | The sigmoid activation function. |

## What you should see

With `rng default`, the outputs are `0.0102  0.0083  0.9932  0.9917` against the correct `0 0 1 1`.

---
[Back to the main page](../../README.md) · [Chapter list](../../README.md#chapter-guide)
