function [centroid, assignment] = KMeans(data, K, max_Iteration)
N = size(data, 1);

centroid   = data(randperm(N, K), :);
assignment = zeros(N, 1);

for iteration = 1:max_Iteration
  % Step 1: Assignment
  for n = 1:N
    for k = 1:K
      difference  = data(n, :) - centroid(k, :);
      distance(k) = sum(difference.^2);
    end
    [~, assignment(n)] = min(distance);
  end

  % Step 2: Update
  for k = 1:K
    centroid(k, :) = mean(data(assignment == k, :), 1);
  end
end
end
