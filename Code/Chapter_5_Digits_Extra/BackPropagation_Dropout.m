function [weight1, weight2, weight3, weight4] = BackPropagation_Dropout(weight1, weight2, weight3, weight4, input, correct_output)
alpha = 0.01;

N = 5;
for k = 1:N
  input_Vector = reshape(input(:, :, k), 25, 1);
  C = correct_output(k, :)';

  v1 = weight1*input_Vector;
  y1 = Sigmoid(v1);
  y1 = y1 .* Dropout(y1, 0.2);

  v2 = weight2*y1;
  y2 = Sigmoid(v2);
  y2 = y2 .* Dropout(y2, 0.2);

  v3 = weight3*y2;
  y3 = Sigmoid(v3);
  y3 = y3 .* Dropout(y3, 0.2);

  v  = weight4*y3;
  Output = Softmax(v);

  error = C - Output;
  delta = error;

  error3 = weight4'*delta;
  delta3 = y3.*(1-y3).*error3;

  error2 = weight3'*delta3;
  delta2 = y2.*(1-y2).*error2;

  error1 = weight2'*delta2;
  delta1 = y1.*(1-y1).*error1;

  delta_weight4 = alpha*delta*y3';
  weight4 = weight4 + delta_weight4;

  delta_weight3 = alpha*delta3*y2';
  weight3 = weight3 + delta_weight3;

  delta_weight2 = alpha*delta2*y1';
  weight2 = weight2 + delta_weight2;

  delta_weight1 = alpha*delta1*input_Vector';
  weight1 = weight1 + delta_weight1;
end
end
