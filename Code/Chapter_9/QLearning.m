function Q = QLearning(Q)
  alpha   = 0.9;
  gamma   = 0.9;
  epsilon = 0.1;

  state = 21;
  is_Terminal = 0;

  while is_Terminal == 0
    if rand < epsilon
      action = randi(4);
    else
      [~, action] = max(Q(state, :));
    end

    [next_State, reward, is_Terminal] = GridWorld(state, action);

    target        = reward + gamma*max(Q(next_State, :))*(1 - is_Terminal);
    error         = target - Q(state, action);
    Q(state, action) = Q(state, action) + alpha*error;

    state = next_State;
  end
end
