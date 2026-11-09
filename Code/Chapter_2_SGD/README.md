# Chapter 2: Single-layer network trained with stochastic gradient descent (SGD)

One sigmoid neuron with three inputs learns a four-example problem. The weights are adjusted after **every** training example. This is the first working neural network of the book.

## How to run

```matlab
>> training_SGD
>> testing_SGD
```

Set the MATLAB working directory to this folder, then run the training script first and the testing script second, in the same MATLAB session.

## What is in this folder

| File | What it does |
|---|---|
| `training_SGD.m` | Initialises random weights and trains for 10,000 epochs with `function_SGD`. |
| `function_SGD.m` | One epoch of SGD: the delta rule, one example at a time. |
| `testing_SGD.m` | Feeds the four inputs through the trained neuron and prints the outputs. |
| `Sigmoid.m` | The sigmoid activation function. |

## What you should see

The correct outputs are `0 0 1 1`. After training with `rng default`, the network prints:

| Input | Output | Correct |
|---|---|---|
| 1 | 0.0076 | 0 |
| 2 | 0.0076 | 0 |
| 3 | 0.9924 | 1 |
| 4 | 0.9924 | 1 |

---
[Back to the main page](../README.md) · [Chapter list](../README.md#chapter-guide)
