N = 5;
for k = 1:N
  input_Vector = reshape(input(:, :, k), 25, 1);

  v1 = weight1*input_Vector;
  y1 = ReLU(v1);

  v2 = weight2*y1;
  y2 = ReLU(v2);

  v3 = weight3*y2;
  y3 = ReLU(v3);

  v  = weight4*y3;
  output = Softmax(v)
end
