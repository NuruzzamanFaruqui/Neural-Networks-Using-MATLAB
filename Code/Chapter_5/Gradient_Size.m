clear all

rng(3);

data = dlmread('iris.csv', ',');
measurements = data(:, 1:4);
species      = data(:, 5);
measurements = (measurements - mean(measurements)) ./ std(measurements);
input = [measurements ones(150, 1)];

correct_output = zeros(150, 3);
for k = 1:150
  correct_output(k, species(k)) = 1;
end

weight1 = 2*rand(8, 5) - 1;
weight2 = 2*rand(8, 8) - 1;
weight3 = 2*rand(8, 8) - 1;
weight4 = 2*rand(3, 8) - 1;

size_Sigmoid = zeros(1, 3);
size_ReLU    = zeros(1, 3);

for k = 1:150
  x = input(k, :)';
  C = correct_output(k, :)';

  % Sigmoid network
  y1 = Sigmoid(weight1*x);
  y2 = Sigmoid(weight2*y1);
  y3 = Sigmoid(weight3*y2);
  delta  = C - Softmax(weight4*y3);
  delta3 = y3.*(1-y3).*(weight4'*delta);
  delta2 = y2.*(1-y2).*(weight3'*delta3);
  delta1 = y1.*(1-y1).*(weight2'*delta2);
  size_Sigmoid = size_Sigmoid + [mean(abs(delta1)) mean(abs(delta2)) mean(abs(delta3))];

  % ReLU network
  v1 = weight1*x;   y1 = ReLU(v1);
  v2 = weight2*y1;  y2 = ReLU(v2);
  v3 = weight3*y2;  y3 = ReLU(v3);
  delta  = C - Softmax(weight4*y3);
  delta3 = (v3 > 0).*(weight4'*delta);
  delta2 = (v2 > 0).*(weight3'*delta3);
  delta1 = (v1 > 0).*(weight2'*delta2);
  size_ReLU = size_ReLU + [mean(abs(delta1)) mean(abs(delta2)) mean(abs(delta3))];
end

size_Sigmoid = size_Sigmoid / 150
size_ReLU    = size_ReLU / 150
