# Project 4: A film recommender

An autoencoder learns the taste patterns in a table of 1,405 users and 60 films, then predicts the ratings that users have not given yet. It is compared with simple averages.

## How to run

Set the MATLAB working directory to this folder and run:

```matlab
>> Evaluate_Recommender
```



## What is in this folder

| File | What it does |
|---|---|
| `Split_Ratings.m` | Hides some known ratings for validation and testing. |
| `Training_Recommender.m` | Trains with early stopping. |
| `Evaluate_Recommender.m` | Runs training, reports the errors and prints recommendations. |
| `BackPropagation_Recommender.m` | Back-propagation that counts only the known ratings. |
| `Rating_Error.m` | RMSE and MAE on a set of ratings. |
| `Sigmoid.m` | Activation function. |
| `ratings.csv, movie_titles.txt` | The data. |

## What you should see

Training stops at epoch 77 and the best weights come from epoch 52. Test RMSE: global average 1.47, film average 1.39, neural network 1.36 (MAE 1.04). The top recommendations are Star Wars: Episode VII - The Force Awakens, Avengers: Endgame, Interstellar and Joker (each 8.3), then Hacksaw Ridge (8.1).

---
[Back to the main page](../../README.md) · [Chapter list](../../README.md#chapter-guide)
