clear all

rng(3);

input = zeros(5, 5, 5);

input(:, :, 1) = [ 0 1 1 0 0;
                   0 0 1 0 0;
                   0 0 1 0 0;
                   0 0 1 0 0;
                   0 1 1 1 0
                 ];

input(:, :, 2) = [ 1 1 1 1 0;
                   0 0 0 0 1;
                   0 1 1 1 0;
                   1 0 0 0 0;
                   1 1 1 1 1
                 ];

input(:, :, 3) = [ 1 1 1 1 0;
                   0 0 0 0 1;
                   0 1 1 1 0;
                   0 0 0 0 1;
                   1 1 1 1 0
                 ];

input(:, :, 4) = [ 0 0 0 1 0;
                   0 0 1 1 0;
                   0 1 0 1 0;
                   1 1 1 1 1;
                   0 0 0 1 0
                 ];

input(:, :, 5) = [ 1 1 1 1 1;
                   1 0 0 0 0;
                   1 1 1 1 0;
                   0 0 0 0 1;
                   1 1 1 1 0
                 ];

correct_output = [ 1 0 0 0 0;
                   0 1 0 0 0;
                   0 0 1 0 0;
                   0 0 0 1 0;
                   0 0 0 0 1
                 ];

error_ReLU    = zeros(5000, 1);
error_Sigmoid = zeros(5000, 1);

weight1_ReLU = 2*rand(20, 25) - 1;
weight2_ReLU = 2*rand(20, 20) - 1;
weight3_ReLU = 2*rand(20, 20) - 1;
weight4_ReLU = 2*rand( 5, 20) - 1;

weight1_Sig = weight1_ReLU;
weight2_Sig = weight2_ReLU;
weight3_Sig = weight3_ReLU;
weight4_Sig = weight4_ReLU;

for epoch = 1:5000
  [weight1_ReLU weight2_ReLU weight3_ReLU weight4_ReLU] = BackPropagation_DeepReLU(weight1_ReLU, weight2_ReLU, weight3_ReLU, weight4_ReLU, input, correct_output);
  [weight1_Sig weight2_Sig weight3_Sig weight4_Sig] = BackPropagation_DeepSigmoid(weight1_Sig, weight2_Sig, weight3_Sig, weight4_Sig, input, correct_output);

  es_ReLU = 0;
  es_Sig  = 0;
  N = 5;
  for k = 1:N
    x = reshape(input(:, :, k), 25, 1);
    d = correct_output(k, :)';

    v1 = weight1_ReLU*x;  y1 = ReLU(v1);
    v2 = weight2_ReLU*y1; y2 = ReLU(v2);
    v3 = weight3_ReLU*y2; y3 = ReLU(v3);
    v  = weight4_ReLU*y3; y  = Softmax(v);
    es_ReLU = es_ReLU + sum((d - y).^2);

    v1 = weight1_Sig*x;  y1 = Sigmoid(v1);
    v2 = weight2_Sig*y1; y2 = Sigmoid(v2);
    v3 = weight3_Sig*y2; y3 = Sigmoid(v3);
    v  = weight4_Sig*y3; y  = Softmax(v);
    es_Sig = es_Sig + sum((d - y).^2);
  end
  error_ReLU(epoch)    = es_ReLU / N;
  error_Sigmoid(epoch) = es_Sig  / N;
end

plot(error_ReLU, 'k', 'LineWidth', 1.5)
hold on
plot(error_Sigmoid, 'k:', 'LineWidth', 1.5)
xlabel('Epoch')
ylabel('Average Training Error')
legend('Deep Network with ReLU', 'Deep Network with Sigmoid')
title('Effect of Activation Function on Deep Network Training')
grid on
