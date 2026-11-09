function score = Silhouette(data, assignment, K)
  N = size(data, 1);
  s = zeros(N, 1);

  for n = 1:N
    distance = sqrt(sum((data - data(n, :)).^2, 2));
    own = assignment == assignment(n);
    own(n) = false;

    a = mean(distance(own));

    b = Inf;
    for k = 1:K
      if k ~= assignment(n)
        b = min(b, mean(distance(assignment == k)));
      end
    end

    s(n) = (b - a)/max(a, b);
  end

  score = mean(s);
end
