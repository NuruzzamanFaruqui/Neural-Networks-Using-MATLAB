clear all

rng(3);

data = dlmread('iris.csv', ',');

measurements = data(:, 1:4);
species      = data(:, 5);

average_Value = mean(measurements);
spread_Value  = std(measurements);
measurements  = (measurements - average_Value) ./ spread_Value;

input = [measurements ones(150, 1)];

correct_output = zeros(150, 3);
for k = 1:150
  correct_output(k, species(k)) = 1;
end

weight1 = 2*rand(6, 5) - 1;
weight2 = 2*rand(3, 6) - 1;

for epoch = 1:1000
  [weight1 weight2] = BackPropagation_Multiclass(weight1, weight2, input, correct_output);
end
