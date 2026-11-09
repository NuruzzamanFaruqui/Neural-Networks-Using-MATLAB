clear all
rng(11);

Q = zeros(49, 4);
number_Of_Episodes = 1500;
episode_Reward = zeros(number_Of_Episodes, 1);

for episode = 1:number_Of_Episodes
  epsilon = max(0.05, 1 - episode/800);
  Q = QLearning_Warehouse(Q, epsilon);

  [steps, outcome] = Run_Policy(Q, false);
  episode_Outcome(episode) = outcome;
end

fprintf('Delivered in the last 100 greedy checks: %d%%\n', ...
        round(100*mean(episode_Outcome(end-99:end) == 1)));
