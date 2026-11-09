# Chapter 7: Unsupervised learning with K-means, autoencoders and denoising

Learning without labels. K-means discovers three groups in 150 points, a small autoencoder compresses five digits into nine numbers each, and a denoising autoencoder cleans corrupted MNIST digits.

## How to run

```matlab
>> Clustering_KMeans        % K-means, self-contained

>> Training_Autoencoder     % then
>> Testing_Autoencoder

>> setup_mnist              % once, in the Code folder, for the next two
>> Training_Denoising       % about 17 seconds in MATLAB Online, saves Denoising_Trained.mat
>> Testing_Denoising
```

## What is in this folder

| File | What it does |
|---|---|
| `Clustering_KMeans.m` | Generates 150 points in three groups and runs K-means. |
| `KMeans.m` | The K-means function. |
| `Training_Autoencoder.m / Testing_Autoencoder.m` | Five 5×5 digits squeezed through 9 hidden nodes and rebuilt. |
| `BackPropagation_Autoencoder.m` | Back-propagation where the input is also the target. |
| `Training_Denoising.m / Testing_Denoising.m` | Denoising autoencoder (784-100-784) on MNIST. |
| `BackPropagation_Denoising.m` | Training function for the denoising network. |
| `LoadMNISTImages.m, Sigmoid.m` | Helpers. |

## What you should see

K-means finds the centroids (1.95, 1.97), (7.01, 8.10) and (8.88, 2.03), with 50 points in each cluster. The five-digit autoencoder reaches a total squared error of 0.0000004. `Clustering_KMeans` starts with `clear all`, so it wipes the workspace.

## Figures made from these results

![The 150 unlabelled points](../Figures/Fig_7_01.png)

![Three clusters found by K-means](../Figures/Fig_7_02.png)

![Autoencoder reconstructions](../Figures/Fig_7_04.png)

![Denoising autoencoder results](../Figures/Fig_7_05.png)

![What twelve hidden nodes learned](../Figures/Fig_7_06.png)

---
[Back to the main page](../README.md) · [Chapter list](../README.md#chapter-guide)
