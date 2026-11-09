# Chapter 8: Reinforcement learning with Q-learning and a Q-network

A mouse learns to find the cheese in a 5×5 grid world by trial and error. First with a Q-table, then with a small neural network in place of the table.

## How to run

```matlab
>> Training_QLearning    % then
>> Testing_QLearning
>> Learning_Progress     % reward per episode, self-contained

>> Training_QNetwork      % then
>> Testing_QNetwork
```

`Training_QLearning` starts with `clear all`.

## What is in this folder

| File | What it does |
|---|---|
| `GridWorld.m` | The environment: takes a state and an action, returns the next state and the reward. |
| `QLearning.m` | One episode of Q-learning. |
| `Training_QLearning.m / Testing_QLearning.m` | Trains the Q-table and shows the mouse's path. |
| `Learning_Progress.m` | Plots the average reward over the episodes. |
| `Training_QNetwork.m / Testing_QNetwork.m` | The same task with a neural network that estimates Q (`rng(1)`). |
| `Sigmoid.m` | Activation function. |

## What you should see

The trained mouse walks the path 21, 22, 17, 18, 13, 8, 3, 4, 5. The first successful episode is episode 7. The average reward rises from -0.60 over the first 20 episodes to about +0.68 over episodes 51 to 100, and settles around +0.77.

## Figures made from these results

![The learned policy](../Figures/Fig_8_02.png)

![Average reward per episode](../Figures/Fig_8_03.png)

---
[Back to the main page](../README.md) · [Chapter list](../README.md#chapter-guide)
