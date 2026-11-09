function [weight1, weight2] = BackPropagation_Compress(weight1, weight2, input)
  alpha = 0.02;

  N = size(input, 1);

  for k = randperm(N)
    transposed_Input = input(k, :)';

    v1 = weight1*transposed_Input;
    y1 = Sigmoid(v1);
    Output = weight2*y1;

    delta = transposed_Input - Output;

    hidden_layer_error = weight2'*delta;
    delta1 = y1.*(1 - y1).*hidden_layer_error;

    weight1 = weight1 + alpha*delta1*transposed_Input';
    weight2 = weight2 + alpha*delta*y1';
  end
end
