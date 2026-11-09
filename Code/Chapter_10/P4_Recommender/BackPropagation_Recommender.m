function [weight1, weight2] = BackPropagation_Recommender(weight1, weight2, train_Scaled)
  alpha = 0.05;

  N = size(train_Scaled, 1);

  for k = randperm(N)
    transposed_Input = train_Scaled(k, :)';
    mask = double(transposed_Input > 0);

    v1 = weight1*transposed_Input;
    y1 = Sigmoid(v1);
    v  = weight2*y1;
    Output = Sigmoid(v);

    e     = mask.*(transposed_Input - Output);
    delta = Output.*(1 - Output).*e;

    hidden_layer_error = weight2'*delta;
    delta1 = y1.*(1 - y1).*hidden_layer_error;

    weight1 = weight1 + alpha*delta1*transposed_Input';
    weight2 = weight2 + alpha*delta*y1';
  end
end
