clear all

rng(3);

data = dlmread('cancer.csv', ',');

features  = data(:, 1:30);
diagnosis = data(:, 31);

order = randperm(569);
train_Index      = order(1:398);
validation_Index = order(399:483);
test_Index       = order(484:569);

average_Value = mean(features(train_Index, :));
spread_Value  = std(features(train_Index, :));
features      = (features - average_Value) ./ spread_Value;
features      = [features ones(569, 1)];

train_Input       = features(train_Index, :);
train_Output      = diagnosis(train_Index);
validation_Input  = features(validation_Index, :);
validation_Output = diagnosis(validation_Index);
test_Input        = features(test_Index, :);
test_Output       = diagnosis(test_Index);
