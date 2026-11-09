% Testing
%
input          = Images(:, :, 8001:10000);
correct_output = Labels(8001:10000);

accuracy = 0;
N        = length(correct_output);
for k = 1:N
  x  = input(:, :, k);                 % Input,        28x28

  y1 = Conv(x, filter_Weight);         % Convolution,  20x20x20
  y2 = ReLU(y1);                       %
  y3 = Pool(y2);                       % Pooling,      10x10x20
  y4 = reshape(y3, [], 1);             %               2000x1
  v5 = hidden_Weight*y4;               %               100x1
  y5 = ReLU(v5);                       %
  v  = output_Weight*y5;               %               10x1
  y  = Softmax(v);                     %

  [~, prediction] = max(y);
  if prediction == correct_output(k)
    accuracy = accuracy + 1;
  end
end

accuracy = accuracy / N;
fprintf('Accuracy is %f\n', accuracy);
