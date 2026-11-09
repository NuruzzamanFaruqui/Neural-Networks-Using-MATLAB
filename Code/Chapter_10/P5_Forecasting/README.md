# Project 5: Forecasting tomorrow's temperature

A network forecasts tomorrow's maximum temperature from recent weather in Seattle. It is compared with two simple forecasts: "tomorrow equals today" and the seven-day average. The network sees the maximum and minimum temperatures of the previous 7 days. The book then asks you to add rain and wind as extra inputs and see whether they help.

## How to run

Set the MATLAB working directory to this folder and run:

```matlab
>> Evaluate_Weather
```



## What is in this folder

| File | What it does |
|---|---|
| `Split_Weather.m` | Builds the inputs from the previous 7 days and splits 1,454 samples 724 / 365 / 365. |
| `Training_Weather.m` | Trains with early stopping. |
| `Evaluate_Weather.m` | Runs training, compares the forecasts and plots the first 60 days of 2015. |
| `BackPropagation_Forecast.m` | Back-propagation for a regression output. |
| `Mean_Squared_Loss.m` | The loss used for early stopping. |
| `ReLU.m` | Activation function. |
| `weather.csv` | The data. |

## What you should see

Training stops at epoch 91 and the best weights come from epoch 61. Mean absolute error on the test year: "tomorrow equals today" 2.24, seven-day average 2.72, neural network 2.17 (RMSE 2.77). In the exercise of the book, adding rain and wind as extra inputs gives an MAE of 2.18, so they do not help.

## Figures made from these results

![Forecast against actual temperature](../../Figures/Fig_10_Weather_Forecast.png)

---
[Back to the main page](../../README.md) · [Chapter list](../../README.md#chapter-guide)
