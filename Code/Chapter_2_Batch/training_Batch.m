input = [ 0 0 1;
          0 1 1;
          1 0 1;
          1 1 1;
        ];

correct_Output = [ 0
                   0
                   1
                   1
                  ];
      
Weight = 2*rand(1, 3) - 1;

for epoch = 1:40000 
  Weight = function_Batch(Weight, input, correct_Output); 
end
