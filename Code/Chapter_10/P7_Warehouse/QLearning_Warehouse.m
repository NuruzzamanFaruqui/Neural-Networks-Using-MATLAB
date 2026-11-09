function Q = QLearning_Warehouse(Q, epsilon)
  alpha = 0.5;
  gamma = 0.95;

  state = 43;
  is_Terminal = 0;
  steps = 0;

  while is_Terminal == 0 && steps < 200
    if rand < epsilon
      action = randi(4);
    else
      [~, action] = max(Q(state, :));
    end

    [next_State, reward, is_Terminal] = Warehouse(state, action);

    target = reward + gamma*max(Q(next_State, :))*(1 - is_Terminal);
    Q(state, action) = Q(state, action) + alpha*(target - Q(state, action));

    state = next_State;
    steps = steps + 1;
  end
end
