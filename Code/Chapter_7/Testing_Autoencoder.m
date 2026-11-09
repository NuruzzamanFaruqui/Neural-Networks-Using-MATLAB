N = 5;
for k = 1:N
  input_Vector = reshape(input(:, :, k), 25, 1);

  v1 = weight1*input_Vector;
  code = Sigmoid(v1)

  v  = weight2*code;
  Output = Sigmoid(v);

  reconstruction = reshape(Output, 5, 5)
end
