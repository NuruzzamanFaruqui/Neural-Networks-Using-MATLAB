clear all

Images = LoadMNISTImages('./MNIST/t10k-images.idx3-ubyte');
Images = reshape(Images, 28, 28, []);

rng(1);

weight1 = (2*rand(100, 784) - 1) * sqrt(6) / sqrt(784 + 100);
weight2 = (2*rand(784, 100) - 1) * sqrt(6) / sqrt(100 + 784);

input = Images(:, :, 1:8000);

for epoch = 1:10
  epoch
  [weight1 weight2] = BackPropagation_Denoising(weight1, weight2, input);
end

save('Denoising_Trained.mat');
