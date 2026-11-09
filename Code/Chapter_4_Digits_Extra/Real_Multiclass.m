clear all

Training_Multiclass;          % provides weight1, weight2

input = zeros(5, 5, 5);

input(:, :, 1) = [ 0 0 1 1 0;
                   0 0 1 1 0;
                   0 1 0 1 0;
                   0 0 0 1 0;
                   0 1 1 1 0
                 ];

input(:, :, 2) = [ 1 1 1 1 0;
                   0 0 0 0 1;
                   0 1 1 1 0;
                   1 0 0 0 1;
                   1 1 1 1 1
                 ];

input(:, :, 3) = [ 1 1 1 1 0;
                   0 0 0 0 1;
                   0 1 1 1 0;
                   1 0 0 0 1;
                   1 1 1 1 0
                 ];

input(:, :, 4) = [ 0 1 1 1 0;
                   0 1 0 0 0;
                   0 1 1 1 0;
                   0 0 0 1 0;
                   0 1 1 1 0
                 ];

input(:, :, 5) = [ 0 1 1 1 1;
                   0 1 0 0 0;
                   0 1 1 1 0;
                   0 0 0 1 0;
                   1 1 1 1 0
                 ];

N = 5;
for k = 1:N
  input_Vector = reshape(input(:, :, k), 25, 1);
  v1 = weight1*input_Vector;
  y1 = Sigmoid(v1);
  v  = weight2*y1;
  output = Softmax(v)
end
