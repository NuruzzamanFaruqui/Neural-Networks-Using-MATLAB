Training_Iris;

noise_Levels = [0 0.2 0.4 0.6 0.8 1.0];
accuracy_Table = zeros(size(noise_Levels));
repeats = 100;

for n = 1:length(noise_Levels)
  total_Correct = 0;
  for r = 1:repeats
    noisy_Input = input;
    noisy_Input(:, 1:4) = input(:, 1:4) + noise_Levels(n)*randn(150, 4);

    for k = 1:150
      transposed_Input = noisy_Input(k, :)';
      y1 = Sigmoid(weight1*transposed_Input);
      output = Softmax(weight2*y1);
      [~, predicted_Class] = max(output);
      if predicted_Class == species(k)
        total_Correct = total_Correct + 1;
      end
    end
  end
  accuracy_Table(n) = total_Correct / (150*repeats);
end

[noise_Levels' accuracy_Table']
