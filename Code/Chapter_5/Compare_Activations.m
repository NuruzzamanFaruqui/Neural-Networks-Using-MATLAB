clear all
rng(3);
data = dlmread('iris.csv', ',');
measurements = data(:, 1:4);  species = data(:, 5);
measurements = (measurements - mean(measurements)) ./ std(measurements);
input = [measurements ones(150, 1)];
correct_output = zeros(150, 3);
for k = 1:150, correct_output(k, species(k)) = 1; end

error_ReLU = zeros(3000, 1);  error_Sigmoid = zeros(3000, 1);
weight1_ReLU = 2*rand(8, 5) - 1;  weight2_ReLU = 2*rand(8, 8) - 1;
weight3_ReLU = 2*rand(8, 8) - 1;  weight4_ReLU = 2*rand(3, 8) - 1;
weight1_Sig = weight1_ReLU;  weight2_Sig = weight2_ReLU;
weight3_Sig = weight3_ReLU;  weight4_Sig = weight4_ReLU;

for epoch = 1:3000
  [weight1_ReLU weight2_ReLU weight3_ReLU weight4_ReLU] = BackPropagation_DeepReLU(weight1_ReLU, weight2_ReLU, weight3_ReLU, weight4_ReLU, input, correct_output);
  [weight1_Sig weight2_Sig weight3_Sig weight4_Sig] = BackPropagation_DeepSigmoid(weight1_Sig, weight2_Sig, weight3_Sig, weight4_Sig, input, correct_output);
  es_ReLU = 0;  es_Sig = 0;
  for k = 1:150
    x = input(k, :)';  d = correct_output(k, :)';
    y = ReLU(weight3_ReLU*ReLU(weight2_ReLU*ReLU(weight1_ReLU*x)));  y = Softmax(weight4_ReLU*y);
    es_ReLU = es_ReLU + sum((d - y).^2);
    y = Sigmoid(weight3_Sig*Sigmoid(weight2_Sig*Sigmoid(weight1_Sig*x)));  y = Softmax(weight4_Sig*y);
    es_Sig = es_Sig + sum((d - y).^2);
  end
  error_ReLU(epoch) = es_ReLU/150;  error_Sigmoid(epoch) = es_Sig/150;
end
idx = [1 10 50 100 200 500 1000 2000 3000];
fprintf('%5d  ReLU %.4f  Sigmoid %.4f\n', [idx' error_ReLU(idx) error_Sigmoid(idx)]');
