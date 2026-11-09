function Weight = function_SGD(Weight, input, correct_Output)
  alpha = 0.9;
  
  N = 5;  
  for k = 1:N
    transposed_Input = input(k, :)';
    c = correct_Output(k);

    weighted_Sum = Weight*transposed_Input;
    output = Sigmoid(weighted_Sum);
    
    error     = c - output;  
    delta = output*(1-output)*error;
  
    dWeight = alpha*delta*transposed_Input;    
    
    Weight(1) = Weight(1) + dWeight(1); 
    Weight(2) = Weight(2) + dWeight(2);
    Weight(3) = Weight(3) + dWeight(3);    
  end
end