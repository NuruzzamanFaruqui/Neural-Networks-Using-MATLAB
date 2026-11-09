clear all
rng(3);
data = dlmread('iris.csv', ',');
measurements = data(:, 1:4);  species = data(:, 5);
measurements = (measurements - mean(measurements)) ./ std(measurements);
input = [measurements ones(150, 1)];
correct_output = zeros(150, 3);
for k = 1:150, correct_output(k, species(k)) = 1; end
weight1 = 2*rand(6, 5) - 1;  weight2 = 2*rand(3, 6) - 1;
error_Curve = zeros(300, 1);  accuracy_Curve = zeros(300, 1);
for epoch = 1:300
  [weight1 weight2] = BackPropagation_Multiclass(weight1, weight2, input, correct_output);
  es = 0; ok = 0;
  for k = 1:150
    y = Softmax(weight2*Sigmoid(weight1*input(k, :)'));
    es = es + sum((correct_output(k, :)' - y).^2);
    [~, p] = max(y);  ok = ok + (p == species(k));
  end
  error_Curve(epoch) = es/150;  accuracy_Curve(epoch) = ok/150;
end
fprintf('%d %.4f %.4f\n', [ (1:10:300)' error_Curve(1:10:300) accuracy_Curve(1:10:300)]');
