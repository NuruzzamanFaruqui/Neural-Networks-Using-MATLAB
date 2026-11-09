input = [ 0 0 1;
          0 1 1;
          1 0 1;
          1 1 1; ];

correct_output = [ 0
                   1
                   1
                   0 ];

error_Mmt   = zeros(1000, 1);
error_NoMmt = zeros(1000, 1);

weight1_Mmt   = 2*rand(4, 3) - 1;
weight2_Mmt   = 2*rand(1, 4) - 1;
weight1_NoMmt = weight1_Mmt;
weight2_NoMmt = weight2_Mmt;

mmt1 = zeros(size(weight1_Mmt));
mmt2 = zeros(size(weight2_Mmt));

for epoch = 1:1000
    [weight1_Mmt weight2_Mmt mmt1 mmt2] = BackPropagation_Momentum(weight1_Mmt, weight2_Mmt, mmt1, mmt2, input, correct_output);
    [weight1_NoMmt weight2_NoMmt]        = BackPropagation(weight1_NoMmt, weight2_NoMmt, input, correct_output);

    es_Mmt   = 0;
    es_NoMmt = 0;
    N = 4;

    for k = 1:N
        x = input(k, :)';
        d = correct_output(k);

        v1 = weight1_Mmt*x;   y1 = Sigmoid(v1);
        v  = weight2_Mmt*y1;  y  = Sigmoid(v);
        es_Mmt = es_Mmt + (d - y)^2;

        v1 = weight1_NoMmt*x;  y1 = Sigmoid(v1);
        v  = weight2_NoMmt*y1; y  = Sigmoid(v);
        es_NoMmt = es_NoMmt + (d - y)^2;
    end

    error_Mmt(epoch)   = es_Mmt   / N;
    error_NoMmt(epoch) = es_NoMmt / N;
end

plot(error_Mmt,   'k',  'LineWidth', 1.5)
hold on
plot(error_NoMmt, 'k:', 'LineWidth', 1.5)
xlabel('Epoch')
ylabel('Average Training Error')
legend('With Momentum', 'Without Momentum')
title('Effect of Momentum on Learning')
grid on