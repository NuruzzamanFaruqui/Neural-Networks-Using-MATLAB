function loss = Mean_Squared_Loss(weight1, weight2, input, correct_output)
  y1 = ReLU(weight1*input');
  Output = (weight2*y1)';
  loss = mean((correct_output - Output).^2);
end
