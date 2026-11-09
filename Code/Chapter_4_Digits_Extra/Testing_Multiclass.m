N = 5;
for k = 1:N
  input_Vector = reshape(input(:, :, k), 25, 1);
  v1 = weight1*input_Vector;
  y1 = Sigmoid(v1);
  v  = weight2*y1;
  output = Softmax(v)
end
