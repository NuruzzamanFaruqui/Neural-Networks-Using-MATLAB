function [weight1, weight2] = BackPropagation_Autoencoder(weight1, weight2, input)
alpha = 0.9;

N = 5;
for k = 1:N
  input_Vector = reshape(input(:, :, k), 25, 1);

  v1 = weight1*input_Vector;
  y1 = Sigmoid(v1);
  v  = weight2*y1;
  Output = Sigmoid(v);

  error = input_Vector - Output;
  delta = error;

  hidden_layer_error = weight2'*delta;
  delta1 = y1.*(1-y1).*hidden_layer_error;

  delta_weight1 = alpha*delta1*input_Vector';
  weight1 = weight1 + delta_weight1;

  delta_weight2 = alpha*delta*y1';
  weight2 = weight2 + delta_weight2;
end
end
