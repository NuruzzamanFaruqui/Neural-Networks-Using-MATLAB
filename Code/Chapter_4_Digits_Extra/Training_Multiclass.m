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

weight1 = 2*rand(50, 25) - 1;
weight2 = 2*rand( 5, 50) - 1;

for epoch = 1:10000
  [weight1 weight2] = BackPropagation_Multiclass(weight1, weight2, input, correct_output);
end
