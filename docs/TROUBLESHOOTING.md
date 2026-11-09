# Troubleshooting

## "Undefined function or variable 'weight1'" (or similar) in a testing script

The testing scripts use the weights that the training script leaves in the MATLAB workspace. Run the training script first, in the same session:

```matlab
>> Training_Iris
>> Testing_Iris
```

## "Unable to find file or directory 'iris.csv'"

MATLAB is looking in the wrong folder. Set the **Current Folder** to the chapter folder you are running. Each folder carries its own data files.

## Chapters 6 and 7: "Unable to open the file ./MNIST/t10k-images.idx3-ubyte"

The MNIST files are not stored in this repository. Run `setup_mnist` once from the `Code` folder. It creates `Chapter_6/MNIST` and `Chapter_7/MNIST`.

If `setup_mnist` cannot download the files (for example behind a firewall), download the MNIST test files by hand, rename them with dots (`t10k-images.idx3-ubyte` and `t10k-labels.idx1-ubyte`) and place them in both `MNIST` folders.

## My numbers differ from the book

See the FAQ in the main README. Random starting weights make small differences normal. To match the book, run `rng default` before scripts that do not set their own seed, and `rng(1)` before `Compare_Momentum` and `Compare_CostFunctions`.

## A script wiped my variables

`Clustering_KMeans.m` and `Training_QLearning.m` begin with `clear all`. That is intentional: it gives each run a clean start. Save anything you need before running them.

## The Chapter 6 or Chapter 7 training feels slow

The CNN takes about 30 seconds and the denoising autoencoder about 17 seconds in MATLAB Online. On a slower machine they can take a minute or two. The scripts print nothing while they train, so wait for the prompt to return.

## Still stuck?

Open an [issue](https://github.com/NuruzzamanFaruqui/Neural-Networks-Using-MATLAB/issues/new/choose) and tell us the chapter, the script, your MATLAB version and the full error message.
