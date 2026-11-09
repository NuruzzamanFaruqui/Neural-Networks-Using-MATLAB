clear all

rng(3);

data = dlmread('diabetes.csv', ',');
N = size(data, 1);
order = randperm(N);
train_Index = order(1:354);
test_Index  = order(355:N);

features = data(:, [1 3 4 5 6 7 8 9 10]);
target   = data(:, 11);

average_Value = mean(features(train_Index, :));
spread_Value  = std(features(train_Index, :));
features = (features - average_Value) ./ spread_Value;
input = [features ones(N, 1)];

target_Mean = mean(target(train_Index));
target_Std  = std(target(train_Index));
scaled_Target = (target - target_Mean) / target_Std;

weight1 = 0.5*(2*rand(8, 10) - 1);
weight2 = 0.5*(2*rand(1, 8) - 1);
alpha = 0.01;

for epoch = 1:200
  for k = train_Index(randperm(length(train_Index)))
    x = input(k, :)';
    y1 = Sigmoid(weight1*x);
    output = weight2*y1;
    delta = scaled_Target(k) - output;
    delta1 = y1.*(1 - y1).*(weight2'*delta);
    weight1 = weight1 + alpha*delta1*x';
    weight2 = weight2 + alpha*delta*y1';
  end
end

prediction = zeros(length(test_Index), 1);
for k = 1:length(test_Index)
  y1 = Sigmoid(weight1*input(test_Index(k), :)');
  prediction(k) = (weight2*y1)*target_Std + target_Mean;
end
actual = target(test_Index);

error = actual - prediction;
MAE  = mean(abs(error))
MSE  = mean(error.^2)
RMSE = sqrt(MSE)
R2   = 1 - sum(error.^2) / sum((actual - mean(target(train_Index))).^2)
baseline_MAE = mean(abs(actual - mean(target(train_Index))))
