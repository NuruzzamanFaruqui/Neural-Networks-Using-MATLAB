function [RMSE, MAE] = Rating_Error(weight1, weight2, train_Scaled, ratings, cells)
  predicted_All = 10*Sigmoid(weight2*Sigmoid(weight1*train_Scaled'))';
  predicted = predicted_All(cells);
  actual    = ratings(cells);

  RMSE = sqrt(mean((actual - predicted).^2));
  MAE  = mean(abs(actual - predicted));
end
