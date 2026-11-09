Training_Recommender;

[RMSE, MAE] = Rating_Error(weight1, weight2, train_Scaled, ratings, test_Cells);

global_Mean = mean(train_Ratings(train_Ratings > 0));
actual      = ratings(test_Cells);
global_RMSE = sqrt(mean((actual - global_Mean).^2));

item_Mean = zeros(1, number_Of_Movies);
for m = 1:number_Of_Movies
  rated = train_Ratings(:, m) > 0;
  item_Mean(m) = mean(train_Ratings(rated, m));
end
[row, column] = ind2sub(size(ratings), test_Cells);
item_RMSE = sqrt(mean((actual - item_Mean(column)').^2));

fprintf('Stopped at epoch %d, best epoch %d\n', stopped_Epoch, best_Epoch);
fprintf('Always the global average:  RMSE = %.2f\n', global_RMSE);
fprintf('Average rating per movie:   RMSE = %.2f\n', item_RMSE);
fprintf('Neural network:             RMSE = %.2f   MAE = %.2f\n', RMSE, MAE);

titles = fileread('movie_titles.txt');
titles = strsplit(strtrim(titles), newline);

user = 7;
predicted = 10*Sigmoid(weight2*Sigmoid(weight1*train_Scaled(user, :)'))';
predicted(train_Ratings(user, :) > 0) = -1;
[~, best] = sort(predicted, 'descend');

disp('Movies this user has not rated yet, best guesses first:')
for r = 1:5
  fprintf('  %d. %-40s predicted %.1f\n', r, titles{best(r)}, predicted(best(r)));
end
