data = dlmread('wine.csv', ',');

features = data(:, 1:13);
cultivar = data(:, 14);

average_Value = mean(features);
spread_Value  = std(features);
features      = (features - average_Value) ./ spread_Value;

N = size(features, 1);
