Training_Anomaly;

validation_Error = Reconstruction_Error(weight1, weight2, validation_Input);
normal_Error     = sort(validation_Error(validation_Label == 0));
test_Error       = Reconstruction_Error(weight1, weight2, test_Input);

fprintf('Average test error: benign %.3f, malignant %.3f\n', ...
        mean(test_Error(test_Label == 0)), mean(test_Error(test_Label == 1)));

for percentile = [0.90 0.95 0.99]
  threshold = normal_Error(ceil(percentile*length(normal_Error)));
  [TP, FP, FN, TN] = Confusion_Matrix(test_Error, test_Label, threshold);

  fprintf('Percentile %2d: threshold %.3f   TP %2d  FP %2d  FN %2d  TN %2d   recall %.1f%%  precision %.1f%%\n', ...
          100*percentile, threshold, TP, FP, FN, TN, 100*TP/(TP+FN), 100*TP/(TP+FP));
end
