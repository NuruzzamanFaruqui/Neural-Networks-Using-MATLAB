clear all

rng(6);

data = dlmread('weather.csv', ',');

max_Temp = data(:, 1);
min_Temp = data(:, 2);

window = 7;
days   = length(max_Temp);

features = zeros(days - window, 2*window);
target   = zeros(days - window, 1);

for k = 1:days - window
  features(k, :) = [max_Temp(k:k+window-1)' min_Temp(k:k+window-1)'];
  target(k)      = max_Temp(k + window);
end

target_Day = (window+1:days)';

train_Index      = find(target_Day <= 731);
validation_Index = find(target_Day > 731  & target_Day <= 1096);
test_Index       = find(target_Day > 1096);

average_Value = mean(features(train_Index, :));
spread_Value  = std(features(train_Index, :));
features      = (features - average_Value) ./ spread_Value;
features      = [features ones(size(features, 1), 1)];

average_Target = mean(target(train_Index));
spread_Target  = std(target(train_Index));
scaled_Target  = (target - average_Target) / spread_Target;

train_Input       = features(train_Index, :);
train_Output      = scaled_Target(train_Index);
validation_Input  = features(validation_Index, :);
validation_Output = scaled_Target(validation_Index);
test_Input        = features(test_Index, :);
test_Output       = scaled_Target(test_Index);
