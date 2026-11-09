<div align="center">

<img src="assets/social-preview.png" alt="Neural Networks Using MATLAB: Deep Learning from Scratch for Beginners, with Every Line of Code Explained, by Nuruzzaman Faruqui" width="100%">

# Neural Networks Using MATLAB

### Deep Learning from Scratch for Beginners, with Every Line of Code Explained

**Companion code for the book by [Nuruzzaman Faruqui](https://nuruzzamanfaruqui.com)**

![MATLAB](https://img.shields.io/badge/MATLAB-R2026b-orange?logo=mathworks&logoColor=white)
![No toolbox](https://img.shields.io/badge/Toolboxes-none%20needed-brightgreen)
![Scripts](https://img.shields.io/badge/MATLAB%20files-139-blue)
![Projects](https://img.shields.io/badge/Real--world%20projects-7-purple)
[![License: MIT](https://img.shields.io/badge/Code%20licence-MIT-lightgrey)](LICENSE)
[![Book](https://img.shields.io/badge/Book-Available%20on%20Amazon-ff9933)](https://www.amazon.com/dp/B0HQZ48CRV)

[Quick start](#quick-start) · [Chapter guide](#chapter-guide) · [Results gallery](#results-gallery) · [Seven projects](#seven-real-world-projects) · [FAQ](#frequently-asked-questions)

</div>

---

## What is this?

This repository holds **every MATLAB program in the book *Neural Networks Using MATLAB***. You build deep learning from the ground up: a single artificial neuron, back-propagation, softmax classifiers, ReLU and dropout, a convolutional neural network, autoencoders, K-means clustering and Q-learning. **You write everything with plain MATLAB commands. No Deep Learning Toolbox is needed.**

The book assumes you know nothing. Each idea starts with an everyday picture, then the equation, then the code, explained line by line. This repository is the code half of that story, tidied so that you can open any chapter and run it in seconds.

<table>
<tr>
<td width="34%" align="center"><img src="assets/book-cover.png" alt="Cover of the book Neural Networks Using MATLAB" width="260"></td>
<td>

**You will learn to**

- Train your first neuron and see why it needs hidden layers
- Write back-propagation, momentum and cross-entropy from scratch
- Classify flowers with softmax and measure the effect of noise
- Build ReLU, dropout and deep networks, and see the vanishing gradient
- Build a convolutional neural network that reads handwritten digits
- Compress and denoise images with autoencoders, and cluster with K-means
- Teach a mouse and a warehouse robot with Q-learning
- Test a model honestly with confusion matrices, validation sets and early stopping
- Finish with **seven real projects**: tumours, cars, wine, films, weather, anomalies and a robot

**[Get the paperback on Amazon](https://www.amazon.com/dp/B0HQZ48CRV)**. The Kindle edition is coming soon.

</td>
</tr>
</table>

## Quick start

**1. Get the code**

```bash
git clone https://github.com/NuruzzamanFaruqui/Neural-Networks-Using-MATLAB.git
```

Or press the green **Code** button and choose **Download ZIP**.

**2. Open MATLAB** (MATLAB Online in a browser works too). Set the *Current Folder* to a chapter folder inside `Code`, for example `Code/Chapter_4`.

**3. Run the scripts in order.** Type the training script, then the testing script:

```matlab
>> Training_Iris
>> Testing_Iris
```

That is all. Every folder is **self-contained**: it carries its own copy of the helper functions (such as `Sigmoid.m`) and its own data, so you never hunt for a missing file.

> **Chapters 6 and 7 need the MNIST digits.** Run `setup_mnist` once (it is in the `Code` folder). It downloads the two files and puts them where the chapters expect them. See the [FAQ](#frequently-asked-questions).

## Chapter guide

Click a chapter to open its folder. Each folder has its own `README.md` with the run order, a description of every file, and the numbers you should see.

| Chapter | Topic | Folder | What you build | Key result |
|:--:|---|---|---|---|
| 1 | The first step | *(no code)* | The ideas: machine learning, neurons, learning | |
| 2 | Single-layer network | [`Chapter_2_SGD`](Code/Chapter_2_SGD) · [`Chapter_2_Batch`](Code/Chapter_2_Batch) | One neuron, trained two ways | Outputs 0.0076 / 0.9924 against 0 / 1 |
| 3 | Multi-layer network | [`Chapter_3`](Code/Chapter_3) | Back-propagation, momentum, cross-entropy | XOR solved: 0.0053, 0.9890, 0.9882, 0.0142 |
| 4 | Classification | [`Chapter_4`](Code/Chapter_4) · [`bonus digits`](Code/Chapter_4_Digits_Extra) | Softmax network for Iris flowers | 97% accuracy after 6 epochs |
| 5 | Deep learning | [`Chapter_5`](Code/Chapter_5) · [`bonus digits`](Code/Chapter_5_Digits_Extra) | ReLU, dropout, vanishing gradient | ReLU reaches 0.0387 error at epoch 10, sigmoid 0.6528 |
| 6 | Convolutional network | [`Chapter_6`](Code/Chapter_6) | CNN on MNIST digits | 93.5% on 2,000 unseen digits, in about 30 s |
| 7 | Unsupervised learning | [`Chapter_7`](Code/Chapter_7) | K-means, autoencoder, denoising | Squared error 0.0000004 |
| 8 | Reinforcement learning | [`Chapter_8`](Code/Chapter_8) | Q-learning and a Q-network | Mouse finds the cheese from episode 7 |
| 9 | Measuring performance | [`Chapter_9`](Code/Chapter_9) | Confusion matrix, F1, MAE, RMSE, R² | Iris 93.3% on 30 unseen flowers |
| 10 | Real-world projects | [`Chapter_10`](Code/Chapter_10) | Seven complete projects | See [below](#seven-real-world-projects) |

**Where to start?** If you are new to neural networks, go in order: 2, 3, 4, 5, then 6 to 8, then 9 and 10. If you already know the basics, jump straight to Chapter 6 (CNN) or Chapter 10 (projects).

## Results gallery

Every number and picture below comes from running the code in this repository in MATLAB R2026b. The full-size files are in the [`Figures`](Figures) folder.

### Chapter 3: Momentum and cross-entropy

<p align="center">
<img src="Figures/Fig_3_Momentum.png" alt="Training error with and without momentum in a MATLAB neural network" width="48%">
<img src="Figures/Fig_3_29.png" alt="Cross-entropy against squared error training curves in MATLAB" width="48%">
</p>

Momentum reached an error below 0.01 in all 20 random starts (median 87 epochs). Without it, 18 of 20 runs got there (median 662 epochs). Cross-entropy was about twice as fast as squared error on the runs that both finished. The book shows these numbers honestly, including the runs that stalled.

### Chapter 4 and 5: Learning curves and the vanishing gradient

<p align="center">
<img src="Figures/Fig_4_Learning_Curve.png" alt="Iris classification learning curve of a MATLAB neural network" width="32%">
<img src="Figures/Fig_5_Compare.png" alt="ReLU against sigmoid training error in a deep MATLAB network" width="32%">
<img src="Figures/Fig_5_Gradient.png" alt="Gradient size by layer for sigmoid and ReLU networks" width="32%">
</p>

### Chapter 6: What a convolutional network sees

<p align="center">
<img src="Figures/Fig_6_03.png" alt="Feature maps of a convolutional neural network after convolution, ReLU and pooling for a handwritten digit nine" width="80%">
</p>

A handwritten 9 passes through five of the 20 trained filters. The top row shows the convolution, the middle row the ReLU and the bottom row the pooling. Nobody designed these filters. They emerged from training.

### Chapter 7: Unsupervised learning

<p align="center">
<img src="Figures/Fig_7_02.png" alt="K-means clustering of 150 points into three clusters in MATLAB" width="30%">
<img src="Figures/Fig_7_04.png" alt="Autoencoder reconstructions of five digits compared with the originals" width="64%">
</p>
<p align="center">
<img src="Figures/Fig_7_05.png" alt="Denoising autoencoder removing noise from MNIST digits" width="48%">
<img src="Figures/Fig_7_06.png" alt="Weights of twelve hidden nodes of a denoising autoencoder" width="48%">
</p>

### Chapter 8: A mouse learns by trial and error

<p align="center">
<img src="Figures/Fig_8_02.png" alt="Learned Q-learning policy in a five by five grid world" width="32%">
<img src="Figures/Fig_8_03.png" alt="Average reward per episode while a Q-learning agent trains" width="52%">
</p>

### Chapter 9: Measuring performance

<p align="center">
<img src="Figures/Fig_9_Iris_Confusion.png" alt="Confusion matrix of a neural network on the Iris data" width="30%">
<img src="Figures/Fig_9_Regression.png" alt="Predicted against actual diabetes progression from a neural network" width="30%">
<img src="Figures/Fig_9_RL.png" alt="Q-learning success rate against training episodes" width="36%">
</p>

## Seven real-world projects

Chapter 10 applies everything to seven complete projects. Each has its own folder with data, code and a README. Open the folder, set it as the MATLAB working directory, and run the `Evaluate_` script.

| # | Project | Folder | Headline result |
|:--:|---|---|---|
| 1 | Breast-cancer classification | [`P1_Classification`](Code/Chapter_10/P1_Classification) | 97.67% test accuracy, no malignant tumour missed |
| 2 | Predicting fuel economy of cars | [`P2_Regression`](Code/Chapter_10/P2_Regression) | Error 1.94 mpg, against 2.85 for a linear model |
| 3 | Grouping wines with K-means and an autoencoder | [`P3_Clustering`](Code/Chapter_10/P3_Clustering) | Clusters match the grape variety in 97.2% of wines |
| 4 | A film recommender | [`P4_Recommender`](Code/Chapter_10/P4_Recommender) | Rating error 1.36 against 1.47 for the global average |
| 5 | Forecasting tomorrow's temperature | [`P5_Forecasting`](Code/Chapter_10/P5_Forecasting) | Error 2.17 °C, against 2.24 for "same as today" |
| 6 | Anomaly detection | [`P6_Anomaly`](Code/Chapter_10/P6_Anomaly) | 18 of 27 malignant tumours caught with 0 false alarms |
| 7 | A warehouse robot | [`P7_Warehouse`](Code/Chapter_10/P7_Warehouse) | 100% delivery after 80 training episodes |

<p align="center">
<img src="Figures/Fig_10_ROC.png" alt="ROC curve of a neural network that detects breast cancer" width="24%">
<img src="Figures/Fig_10_Cars.png" alt="Predicted against actual car fuel economy and model comparison" width="40%">
<img src="Figures/Fig_10_Wine_Map.png" alt="Wine clusters found by K-means after autoencoder compression" width="30%">
</p>
<p align="center">
<img src="Figures/Fig_10_Weather_Forecast.png" alt="Neural network temperature forecast against actual temperature" width="42%">
<img src="Figures/Fig_10_Anomaly.png" alt="Reconstruction error thresholds for autoencoder anomaly detection" width="42%">
</p>

## Repository map

```text
Neural-Networks-Using-MATLAB/
├── README.md                    You are here
├── Code/
│   ├── setup_mnist.m            Run once: downloads MNIST for Chapters 6 and 7
│   ├── DATA_SOURCES.md          Where every data file comes from
│   ├── Chapter_2_SGD/           Single neuron, stochastic gradient descent
│   ├── Chapter_2_Batch/         Single neuron, batch training
│   ├── Chapter_3/               Back-propagation, momentum, cross-entropy
│   ├── Chapter_4/               Iris classification with softmax
│   ├── Chapter_4_Digits_Extra/  Bonus: digit classification
│   ├── Chapter_5/               ReLU, dropout, vanishing gradient
│   ├── Chapter_5_Digits_Extra/  Bonus: deep networks on digits
│   ├── Chapter_6/               Convolutional neural network (MNIST)
│   ├── Chapter_7/               K-means, autoencoder, denoising autoencoder
│   ├── Chapter_8/               Q-learning and Q-network
│   ├── Chapter_9/               Confusion matrix, F1, MAE, RMSE, R²
│   └── Chapter_10/
│       ├── P1_Classification/   P2_Regression/    P3_Clustering/
│       └── P4_Recommender/      P5_Forecasting/   P6_Anomaly/   P7_Warehouse/
├── Figures/                     26 result figures made from MATLAB output
├── assets/                      Book cover and social preview image
└── docs/                        Troubleshooting guide
```

Every chapter folder contains its own `README.md`, and every folder is self-contained.

## Requirements

- **MATLAB.** The code was written and tested in **MATLAB R2026b** (including MATLAB Online). It uses only base MATLAB commands such as `conv2`, `randn` and `dlmread`.
- **No toolboxes.** Nothing here calls the Deep Learning Toolbox or the Statistics and Machine Learning Toolbox.
- **A few minutes.** Most scripts finish in seconds. The slowest are the Chapter 6 CNN (about 30 seconds) and the Chapter 7 denoising autoencoder (about 17 seconds) in MATLAB Online.

## Frequently asked questions

<details>
<summary><b>Do I need the Deep Learning Toolbox?</b></summary>

No. That is the point of the book. You build every layer and every learning rule yourself, so that you understand what the toolbox does for you.
</details>

<details>
<summary><b>How do I get the MNIST files for Chapters 6 and 7?</b></summary>

Open MATLAB, set the Current Folder to `Code`, and run:

```matlab
>> setup_mnist
```

It downloads the MNIST test set and saves `t10k-images.idx3-ubyte` and `t10k-labels.idx1-ubyte` in a `MNIST` folder inside `Chapter_6` and `Chapter_7`. If you prefer to download the files yourself, rename them with dots (for example `t10k-images-idx3-ubyte` becomes `t10k-images.idx3-ubyte`) and place them in those two folders.
</details>

<details>
<summary><b>My numbers are slightly different from the book. Is something wrong?</b></summary>

Probably not. Neural networks start from random weights. The numbers in the book come from MATLAB R2026b. Scripts that call `rng(...)` give the same numbers on the same MATLAB version. For scripts that start from random weights without a seed, the book's numbers come from typing `rng default` just before running them. The Chapter 3 comparison scripts were run after `rng(1)`. Random number generators differ between MATLAB versions, so small differences are normal, and the overall behaviour stays the same.
</details>

<details>
<summary><b>The testing script says a variable is undefined.</b></summary>

Run the training script first, in the same MATLAB session. The testing scripts use the weights that the training script leaves in the workspace. A few scripts begin with `clear all`, which wipes the workspace, so run those in one go.
</details>

<details>
<summary><b>Why does every folder have its own copy of <code>Sigmoid.m</code>?</b></summary>

So that each chapter works on its own. You can copy a single folder anywhere, open it in MATLAB and run it. No paths to set and no files to hunt for.
</details>

<details>
<summary><b>Can I use this code in my course or project?</b></summary>

Yes. The code is released under the [MIT licence](LICENSE). The book text, the cover and the figures remain the property of the author. Please see [`NOTICE.md`](NOTICE.md).
</details>

More help is in [`docs/TROUBLESHOOTING.md`](docs/TROUBLESHOOTING.md).

## About the author

**Nuruzzaman Faruqui** is an Assistant Professor at Daffodil International University and a PhD researcher in Data Science and AI at Monash University. He has taught neural networks to students in classrooms and to learners online. Visit [nuruzzamanfaruqui.com](https://nuruzzamanfaruqui.com).

## Cite this work

If this code helps your teaching or research, please cite the book. The repository has a [`CITATION.cff`](CITATION.cff) file, so GitHub's **Cite this repository** button gives you ready-made BibTeX and APA entries. The entry will be updated with the publisher details when the book is released.

## Licence

- **Code** (the `Code` folder): [MIT](LICENSE).
- **Book text, cover and figures** (the `Figures` and `assets` folders): © 2026 Nuruzzaman Faruqui. All rights reserved. See [`NOTICE.md`](NOTICE.md).
- **Data files** keep the licences of their original sources. See [`Code/DATA_SOURCES.md`](Code/DATA_SOURCES.md).

---

<div align="center">

**If this repository helps you learn, please give it a star.** It helps other learners find it.

<sub>Keywords: neural networks MATLAB, deep learning from scratch, back-propagation MATLAB, convolutional neural network MATLAB without toolbox, autoencoder MATLAB, Q-learning MATLAB, MNIST MATLAB, machine learning for beginners, MATLAB deep learning book code, neural network tutorial.</sub>

</div>
