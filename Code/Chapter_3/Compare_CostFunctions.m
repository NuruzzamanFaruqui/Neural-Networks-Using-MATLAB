input = [ 0 0 1;
      0 1 1;
      1 0 1;
      1 1 1;
  ];

correct_output = [ 0
      1
      1
      0
  ];

error_CE  = zeros(1000, 1);
error_SSE = zeros(1000, 1);

weight1_CE  = 2*rand(4, 3) - 1;
weight2_CE  = 2*rand(1, 4) - 1;

weight1_SSE = weight1_CE;
weight2_SSE = weight2_CE;

for epoch = 1:1000
  [weight1_CE  weight2_CE]  = BackPropagation_CE(weight1_CE,  weight2_CE,  input, correct_output);
  [weight1_SSE weight2_SSE] = BackPropagation(weight1_SSE, weight2_SSE, input, correct_output);
  
  es_CE  = 0;
  es_SSE = 0;
  N = 4;
  for k = 1:N
  x = input(k, :)';
  d = correct_output(k);
  
  v1 = weight1_CE*x;   y1 = Sigmoid(v1);
  v  = weight2_CE*y1;  y  = Sigmoid(v);
  es_CE = es_CE + (d - y)^2;
  
  v1 = weight1_SSE*x;  y1 = Sigmoid(v1);
  v  = weight2_SSE*y1; y  = Sigmoid(v);
  es_SSE = es_SSE + (d - y)^2;
  end
  error_CE(epoch)  = es_CE  / N;
  error_SSE(epoch) = es_SSE / N;
end

plot(error_CE,  'k', 'LineWidth', 1.5)
hold on
plot(error_SSE, 'k:', 'LineWidth', 1.5)
xlabel('Epoch')
ylabel('Average Training Error')
legend('Cross-Entropy', 'Squared Error')
