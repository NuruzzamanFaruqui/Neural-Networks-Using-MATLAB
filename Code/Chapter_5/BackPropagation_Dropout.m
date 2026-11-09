function [weight1, weight2, weight3, weight4] = BackPropagation_Dropout(weight1, weight2, weight3, weight4, input, correct_output)
  alpha = 0.01;

  N = 150;
  for k = randperm(N)
    transposed_Input = input(k, :)';
    C = correct_output(k, :)';

    v1 = weight1*transposed_Input;
    y1 = ReLU(v1);
    mask1 = Dropout(y1, 0.3);
    y1 = y1 .* mask1;

    v2 = weight2*y1;
    y2 = ReLU(v2);
    mask2 = Dropout(y2, 0.3);
    y2 = y2 .* mask2;

    v3 = weight3*y2;
    y3 = ReLU(v3);
    mask3 = Dropout(y3, 0.3);
    y3 = y3 .* mask3;

    v  = weight4*y3;
    Output = Softmax(v);

    error = C - Output;
    delta = error;

    error3 = weight4'*delta;
    delta3 = (v3 > 0).*mask3.*error3;
    error2 = weight3'*delta3;
    delta2 = (v2 > 0).*mask2.*error2;
    error1 = weight2'*delta2;
    delta1 = (v1 > 0).*mask1.*error1;

    weight4 = weight4 + alpha*delta*y3';
    weight3 = weight3 + alpha*delta3*y2';
    weight2 = weight2 + alpha*delta2*y1';
    weight1 = weight1 + alpha*delta1*transposed_Input';
  end
end
