clear all

budget = [10 20 40 80 160 300];
number_Of_Seeds = 50;

success_Rate = zeros(1, length(budget));
mean_Steps   = zeros(1, length(budget));

for b = 1:length(budget)
  wins = 0;
  total_Steps = 0;

  for seed = 1:number_Of_Seeds
    rng(seed);
    Q = zeros(25, 4);
    for episode = 1:budget(b)
      Q = QLearning(Q);
    end

    state = 21;
    is_Terminal = 0;
    steps = 0;
    while is_Terminal == 0 && steps < 50
      [~, action] = max(Q(state, :));
      [state, reward, is_Terminal] = GridWorld(state, action);
      steps = steps + 1;
    end
    wins = wins + (is_Terminal == 1 && reward == 1);
    total_Steps = total_Steps + steps;
  end

  success_Rate(b) = wins / number_Of_Seeds;
  mean_Steps(b)   = total_Steps / number_Of_Seeds;
end

budget
success_Rate
mean_Steps
