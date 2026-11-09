           
input = [ 0 0 1;
          0 1 1;
          1 0 1;
          1 1 1;
          0 0 1
        ];

correct_Output = [ 0
      0
      1
      1
      0
    ];
      
Weight = 2*rand(1, 3) - 1;

for epoch = 1:10000
  Weight = function_SGD(Weight, input, correct_Output);
end
