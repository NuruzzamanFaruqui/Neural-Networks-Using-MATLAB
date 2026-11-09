clear all

rng(8);

data = dlmread('cancer.csv', ',');

features  = data(:, 1:30);
diagnosis = data(:, 31);

order = randperm(569);
train_Index      = order(1:398);
validation_Index = order(399:483);
test_Index       = order(484:569);

normal_Train = train_Index(diagnosis(train_Index) == 0);

average_Value = mean(features(normal_Train, :));
spread_Value  = std(features(normal_Train, :));
features      = (features - average_Value) ./ spread_Value;

train_Input      = features(normal_Train, :);
validation_Input = features(validation_Index, :);
validation_Label = diagnosis(validation_Index);
test_Input       = features(test_Index, :);
test_Label       = diagnosis(test_Index);
