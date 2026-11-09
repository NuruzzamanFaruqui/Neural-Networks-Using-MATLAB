clear all

Images = LoadMNISTImages('./MNIST/t10k-images.idx3-ubyte');
Images = reshape(Images, 28, 28, []);
Labels = LoadMNISTLabels('./MNIST/t10k-labels.idx1-ubyte');
Labels(Labels == 0) = 10;    % 0 --> 10

rng(1);

% Learning
%
filter_Weight = 1e-2*randn([9 9 20]);
hidden_Weight = (2*rand(100, 2000) - 1) * sqrt(6) / sqrt(360 + 2000);
output_Weight = (2*rand( 10,  100) - 1) * sqrt(6) / sqrt( 10 +  100);

input          = Images(:, :, 1:8000);
correct_output = Labels(1:8000);

for epoch = 1:3
  epoch
  [filter_Weight, hidden_Weight, output_Weight] = BackPropagation_CNN(filter_Weight, hidden_Weight, output_Weight, input, correct_output);
end

save('CNN_Trained.mat');
