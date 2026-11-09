Training_Cancer;

N = length(test_Output);
test_Score = zeros(N, 1);
for k = 1:N
  y1 = ReLU(weight1*test_Input(k, :)');
  test_Score(k) = Sigmoid(weight2*y1);
end

[TP, FP, FN, TN] = Confusion_Matrix(test_Score, test_Output, 0.5);

accuracy    = (TP + TN) / N
precision   = TP / (TP + FP)
recall      = TP / (TP + FN)
specificity = TN / (TN + FP)
F1_score    = 2*precision*recall / (precision + recall)

baseline_accuracy = max(sum(test_Output), N - sum(test_Output)) / N

thresholds = 0:0.01:1;
TPR = zeros(size(thresholds));
FPR = zeros(size(thresholds));
for t = 1:length(thresholds)
  [a, b, c, d] = Confusion_Matrix(test_Score, test_Output, thresholds(t));
  TPR(t) = a / (a + c);
  FPR(t) = b / (b + d);
end
AUC = -trapz(FPR, TPR)
