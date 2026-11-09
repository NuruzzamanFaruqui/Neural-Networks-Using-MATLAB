clear all
data = dlmread('iris.csv', ',');
measurements = data(:, 1:4);  species = data(:, 5);
measurements = (measurements - mean(measurements)) ./ std(measurements);
input = [measurements ones(150, 1)];
correct_output = zeros(150, 3);
for k = 1:150, correct_output(k, species(k)) = 1; end
res = zeros(5, 6);
for rep = 1:5
rng(rep);
w1 = 2*rand(8, 5) - 1;  w2 = 2*rand(8, 8) - 1;  w3 = 2*rand(8, 8) - 1;  w4 = 2*rand(3, 8) - 1;
a1=w1;a2=w2;a3=w3;a4=w4;
for epoch = 1:600
  [w1 w2 w3 w4] = BackPropagation_DeepReLU(w1, w2, w3, w4, input, correct_output);
  [a1 a2 a3 a4] = BackPropagation_Dropout(a1, a2, a3, a4, input, correct_output);
end
lv = [0 0.5 1.0];
for n = 1:3
  c1 = 0; c2 = 0;
  for r = 1:40
    X = input; X(:, 1:4) = X(:, 1:4) + lv(n)*randn(150, 4);
    for k = 1:150
      x = X(k, :)';
      y = Softmax(w4*ReLU(w3*ReLU(w2*ReLU(w1*x)))); [~, p] = max(y); c1 = c1 + (p == species(k));
      y = Softmax(a4*ReLU(a3*ReLU(a2*ReLU(a1*x)))); [~, p] = max(y); c2 = c2 + (p == species(k));
    end
  end
  res(rep, n) = c1/(150*40); res(rep, 3+n) = c2/(150*40);
end
end
disp(res); disp(mean(res))
