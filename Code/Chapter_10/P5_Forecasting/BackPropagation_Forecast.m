function [weight1, weight2] = BackPropagation_Forecast(weight1, weight2, input, correct_output)
  alpha      = 0.02;
  batch_Size = 16;

  N = size(input, 1);
  order = randperm(N);

  for start = 1:batch_Size:N
    batch = order(start : min(start + batch_Size - 1, N));

    sum_delta_weight1 = zeros(size(weight1));
    sum_delta_weight2 = zeros(size(weight2));

    for k = batch
      transposed_Input = input(k, :)';
      C = correct_output(k);

      v1 = weight1*transposed_Input;
      y1 = ReLU(v1);
      Output = weight2*y1;

      delta = C - Output;

      hidden_layer_error = weight2'*delta;
      delta1 = (v1 > 0).*hidden_layer_error;

      sum_delta_weight1 = sum_delta_weight1 + delta1*transposed_Input';
      sum_delta_weight2 = sum_delta_weight2 + delta*y1';
    end

    weight1 = weight1 + alpha*sum_delta_weight1/length(batch);
    weight2 = weight2 + alpha*sum_delta_weight2/length(batch);
  end
end
