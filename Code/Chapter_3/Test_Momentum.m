input = [ 0 0 1;
          0 1 1;
          1 0 1;
          1 1 1;
        ];

N = 4;                        
for k = 1:N

  transposed_Input = input(k, :)';

  v1 = weight1*transposed_Input;
  y1 = Sigmoid(v1);

  v  = weight2*y1;
  output = Sigmoid(v)

end
