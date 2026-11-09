function loss = Cross_Entropy(weight1, weight2, input, correct_output)
  N = size(input, 1);
  total = 0;
  for k = 1:N
    y1 = ReLU(weight1*input(k, :)');
    Output = Sigmoid(weight2*y1);
    Output = min(max(Output, 1e-10), 1 - 1e-10);
    C = correct_output(k);
    total = total - (C*log(Output) + (1 - C)*log(1 - Output));
  end
  loss = total / N;
end
