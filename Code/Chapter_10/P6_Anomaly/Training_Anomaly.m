Split_Anomaly;

weight1 = 0.1*(2*rand(6, 30) - 1);
weight2 = 0.1*(2*rand(30, 6) - 1);

for epoch = 1:200
  [weight1 weight2] = BackPropagation_Anomaly(weight1, weight2, train_Input);

  if mod(epoch, 50) == 0
    train_Error = mean(Reconstruction_Error(weight1, weight2, train_Input));
    fprintf('epoch %3d   average error on normal tissue = %.3f\n', epoch, train_Error);
  end
end
