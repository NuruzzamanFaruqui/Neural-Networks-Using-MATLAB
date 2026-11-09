clear all

rng(5);

data = dlmread('cars.csv', ',');

features = data(:, 1:9);
mpg      = data(:, 10);

order = randperm(392);
train_Index      = order(1:274);
validation_Index = order(275:333);
test_Index       = order(334:392);

average_Value = mean(features(train_Index, :));
spread_Value  = std(features(train_Index, :));
spread_Value(spread_Value == 0) = 1;
features      = (features - average_Value) ./ spread_Value;
features      = [features ones(392, 1)];

average_Mpg = mean(mpg(train_Index));
spread_Mpg  = std(mpg(train_Index));
target      = (mpg - average_Mpg) / spread_Mpg;

train_Input       = features(train_Index, :);
train_Output      = target(train_Index);
validation_Input  = features(validation_Index, :);
validation_Output = target(validation_Index);
test_Input        = features(test_Index, :);
test_Output       = target(test_Index);
