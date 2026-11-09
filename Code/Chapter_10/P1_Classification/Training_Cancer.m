Split_Cancer;

weight1 = 0.1*(2*rand(16, 31) - 1);
weight2 = 0.1*(2*rand(1, 16) - 1);

train_Loss      = zeros(200, 1);
validation_Loss = zeros(200, 1);

best_Loss  = Inf;
best_Epoch = 0;
patience   = 20;

for epoch = 1:200
  [weight1 weight2] = BackPropagation_Project(weight1, weight2, train_Input, train_Output);

  train_Loss(epoch)      = Cross_Entropy(weight1, weight2, train_Input, train_Output);
  validation_Loss(epoch) = Cross_Entropy(weight1, weight2, validation_Input, validation_Output);

  if validation_Loss(epoch) < best_Loss
    best_Loss  = validation_Loss(epoch);
    best_Epoch = epoch;
    best_Weight1 = weight1;
    best_Weight2 = weight2;
  elseif epoch - best_Epoch >= patience
    break
  end
end

weight1 = best_Weight1;
weight2 = best_Weight2;
