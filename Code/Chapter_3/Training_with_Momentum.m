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
      
weight1 = 2*rand(4, 3) - 1;
weight2 = 2*rand(1, 4) - 1;

mmt1 = zeros(size(weight1));
mmt2 = zeros(size(weight2));

for epoch = 1:10000          % train
  [weight1 weight2 mmt1 mmt2] = BackPropagation_Momentum(weight1, weight2, mmt1, mmt2, input, correct_output);
  weight1
end
