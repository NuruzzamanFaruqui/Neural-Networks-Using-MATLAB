Split_Ratings;

weight1 = 0.1*(2*rand(8, number_Of_Movies) - 1);
weight2 = 0.1*(2*rand(number_Of_Movies, 8) - 1);

best_RMSE  = Inf;
best_Epoch = 0;
patience   = 25;

train_RMSE      = zeros(300, 1);
validation_RMSE = zeros(300, 1);

for epoch = 1:300
  [weight1 weight2] = BackPropagation_Recommender(weight1, weight2, train_Scaled);

  train_RMSE(epoch)      = Rating_Error(weight1, weight2, train_Scaled, ratings, train_Cells);
  validation_RMSE(epoch) = Rating_Error(weight1, weight2, train_Scaled, ratings, validation_Cells);

  if validation_RMSE(epoch) < best_RMSE
    best_RMSE  = validation_RMSE(epoch);
    best_Epoch = epoch;
    best_Weight1 = weight1;
    best_Weight2 = weight2;
  elseif epoch - best_Epoch >= patience
    break
  end
end

weight1 = best_Weight1;
weight2 = best_Weight2;
stopped_Epoch = epoch;
