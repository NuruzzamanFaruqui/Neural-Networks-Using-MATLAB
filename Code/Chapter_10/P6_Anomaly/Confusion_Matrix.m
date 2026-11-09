function [TP, FP, FN, TN] = Confusion_Matrix(scores, actual, threshold)
  predicted = scores >= threshold;

  TP = sum(predicted == 1 & actual == 1);
  FP = sum(predicted == 1 & actual == 0);
  FN = sum(predicted == 0 & actual == 1);
  TN = sum(predicted == 0 & actual == 0);
end
