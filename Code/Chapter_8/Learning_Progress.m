clear all

rng(3);

alpha   = 0.9;
gamma   = 0.9;
epsilon = 0.1;

Q = zeros(25, 4);

episode_Reward = zeros(500, 1);
episode_Steps  = zeros(500, 1);

for episode = 1:500
  state = 21;
  is_Terminal = 0;
  steps = 0;

  while is_Terminal == 0
    if rand < epsilon
      action = randi(4);
    else
      [~, action] = max(Q(state, :));
    end

    [next_State, reward, is_Terminal] = GridWorld(state, action);

    target = reward + gamma*max(Q(next_State, :))*(1 - is_Terminal);
    error  = target - Q(state, action);
    Q(state, action) = Q(state, action) + alpha*error;

    state = next_State;
    steps = steps + 1;
  end

  episode_Reward(episode) = reward;
  episode_Steps(episode)  = steps;
end

average_Reward = zeros(500, 1);
for episode = 1:500
  window = max(1, episode-19):episode;
  average_Reward(episode) = mean(episode_Reward(window));
end

plot(average_Reward, 'k', 'LineWidth', 1.5)
xlabel('Episode')
ylabel('Average Reward (last 20 episodes)')
grid on
