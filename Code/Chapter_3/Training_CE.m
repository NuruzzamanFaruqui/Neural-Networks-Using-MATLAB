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

for epoch = 1:10000          % train
  [weight1 weight2] = BackPropagation_CE(weight1, weight2, input, correct_output);
end
