function [weight1, weight2] = BackPropagation_Denoising(weight1, weight2, input)
alpha = 0.1;

N = 8000;
for k = 1:N
  input_Vector = reshape(input(:, :, k), 784, 1);

  noise_Mask  = rand(784, 1) > 0.3;
  noisy_Input = input_Vector .* noise_Mask;

  v1 = weight1*noisy_Input;
  y1 = Sigmoid(v1);
  v  = weight2*y1;
  Output = Sigmoid(v);

  error = input_Vector - Output;
  delta = error;

  hidden_layer_error = weight2'*delta;
  delta1 = y1.*(1-y1).*hidden_layer_error;

  delta_weight1 = alpha*delta1*noisy_Input';
  weight1 = weight1 + delta_weight1;

  delta_weight2 = alpha*delta*y1';
  weight2 = weight2 + delta_weight2;
end
end
