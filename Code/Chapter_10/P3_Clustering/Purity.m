function [score, table] = Purity(assignment, cultivar, K)
  table = zeros(K, 3);
  for k = 1:K
    for c = 1:3
      table(k, c) = sum(assignment == k & cultivar == c);
    end
  end
  score = sum(max(table, [], 2))/length(cultivar);
end
