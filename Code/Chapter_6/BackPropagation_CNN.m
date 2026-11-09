function [filter_Weight, hidden_Weight, output_Weight] = BackPropagation_CNN(filter_Weight, hidden_Weight, output_Weight, input, correct_output)
alpha = 0.01;
beta  = 0.95;

momentum_Filter = zeros(size(filter_Weight));
momentum_Hidden = zeros(size(hidden_Weight));
momentum_Output = zeros(size(output_Weight));

N = length(correct_output);

batch_Size = 100;
batch_List = 1:batch_Size:(N-batch_Size+1);

% One epoch loop
for batch = 1:length(batch_List)
  delta_Filter = zeros(size(filter_Weight));
  delta_Hidden = zeros(size(hidden_Weight));
  delta_Output = zeros(size(output_Weight));

  % Mini-batch loop
  begin = batch_List(batch);
  for k = begin:begin+batch_Size-1
    % Forward propagation
    x  = input(:, :, k);               % Input,        28x28
    y1 = Conv(x, filter_Weight);       % Convolution,  20x20x20
    y2 = ReLU(y1);                     %
    y3 = Pool(y2);                     % Pooling,      10x10x20
    y4 = reshape(y3, [], 1);           %               2000x1
    v5 = hidden_Weight*y4;             %               100x1
    y5 = ReLU(v5);                     %
    v  = output_Weight*y5;             %               10x1
    y  = Softmax(v);                   %

    % One-hot encoding
    C = zeros(10, 1);
    C(sub2ind(size(C), correct_output(k), 1)) = 1;

    % Back-propagation
    error = C - y;
    delta = error;                     % Output layer

    error5 = output_Weight' * delta;   % Hidden (ReLU) layer
    delta5 = (y5 > 0) .* error5;

    error4 = hidden_Weight' * delta5;  % Pooling layer

    error3 = reshape(error4, size(y3));

    error2 = zeros(size(y2));          % Pooling-ReLU layers
    filter3 = ones(size(y2)) / (2*2);
    for c = 1:20
      error2(:, :, c) = kron(error3(:, :, c), ones([2 2])) .* filter3(:, :, c);
    end

    delta2 = (y2 > 0) .* error2;       % ReLU layer

    delta1_Filter = zeros(size(filter_Weight));    % Convolutional layer
    for c = 1:20
      delta1_Filter(:, :, c) = conv2(x(:, :), rot90(delta2(:, :, c), 2), 'valid');
    end

    delta_Filter = delta_Filter + delta1_Filter;
    delta_Hidden = delta_Hidden + delta5*y4';
    delta_Output = delta_Output + delta *y5';
  end

  % Update weights
  delta_Filter = delta_Filter / batch_Size;
  delta_Hidden = delta_Hidden / batch_Size;
  delta_Output = delta_Output / batch_Size;

  momentum_Filter = alpha*delta_Filter + beta*momentum_Filter;
  filter_Weight   = filter_Weight + momentum_Filter;

  momentum_Hidden = alpha*delta_Hidden + beta*momentum_Hidden;
  hidden_Weight   = hidden_Weight + momentum_Hidden;

  momentum_Output = alpha*delta_Output + beta*momentum_Output;
  output_Weight   = output_Weight + momentum_Output;
end
end
