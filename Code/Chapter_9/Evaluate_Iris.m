clear all

rng(3);

data = dlmread('iris.csv', ',');
order = randperm(150);
train_Index = order(1:120);
test_Index  = order(121:150);

measurements = data(:, 1:4);
species      = data(:, 5);

average_Value = mean(measurements(train_Index, :));
spread_Value  = std(measurements(train_Index, :));
measurements  = (measurements - average_Value) ./ spread_Value;
input = [measurements ones(150, 1)];

correct_output = zeros(150, 3);
for k = 1:150
  correct_output(k, species(k)) = 1;
end

weight1 = 2*rand(6, 5) - 1;
weight2 = 2*rand(3, 6) - 1;

for epoch = 1:1000
  [weight1 weight2] = BackPropagation_Multiclass(weight1, weight2, input(train_Index, :), correct_output(train_Index, :));
end

predicted = zeros(30, 1);
for k = 1:30
  y1 = Sigmoid(weight1*input(test_Index(k), :)');
  [~, predicted(k)] = max(Softmax(weight2*y1));
end
actual = species(test_Index);

confusion = Multiclass_Confusion(actual, predicted, 3)

accuracy  = sum(diag(confusion)) / 30
precision = diag(confusion)' ./ sum(confusion, 1)
recall    = diag(confusion)' ./ sum(confusion, 2)'
F1_score  = 2*precision.*recall ./ (precision + recall)
macro_F1  = mean(F1_score)
