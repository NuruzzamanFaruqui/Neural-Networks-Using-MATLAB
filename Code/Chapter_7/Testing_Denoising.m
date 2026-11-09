input = Images(:, :, 8001:10000);

N = 8;
for k = 1:N
  input_Vector = reshape(input(:, :, k), 784, 1);

  noise_Mask  = rand(784, 1) > 0.3;
  noisy_Input = input_Vector .* noise_Mask;

  v1 = weight1*noisy_Input;
  y1 = Sigmoid(v1);
  v  = weight2*y1;
  Output = Sigmoid(v);

  subplot(3, N, k)
  imshow(reshape(input_Vector, 28, 28))
  subplot(3, N, N + k)
  imshow(reshape(noisy_Input, 28, 28))
  subplot(3, N, 2*N + k)
  imshow(reshape(Output, 28, 28))
end
