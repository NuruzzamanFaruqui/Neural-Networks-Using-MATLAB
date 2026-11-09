function error = Reconstruction_Error(weight1, weight2, input)
  Output = (weight2*ReLU(weight1*input'))';
  error  = mean((input - Output).^2, 2);
end
