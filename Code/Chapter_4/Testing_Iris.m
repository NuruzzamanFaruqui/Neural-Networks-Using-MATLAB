Training_Iris;

N = 150;
correct_Count = 0;

for k = 1:N
  transposed_Input = input(k, :)';
  v1 = weight1*transposed_Input;
  y1 = Sigmoid(v1);
  v  = weight2*y1;
  output = Softmax(v);

  [~, predicted_Class] = max(output);
  if predicted_Class == species(k)
    correct_Count = correct_Count + 1;
  end
  if mod(k, 25) == 1
    fprintf('%3d  %s  predicted %d (actual %d)\n', k, mat2str(round(output'*10000)/10000), predicted_Class, species(k));
  end
end

accuracy = correct_Count / N
