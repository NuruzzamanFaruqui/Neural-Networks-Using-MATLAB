state = 21;
path  = state;
is_Terminal = 0;

while is_Terminal == 0
  [~, action] = max(Q(state, :));
  [next_State, reward, is_Terminal] = GridWorld(state, action);
  state = next_State;
  path  = [path state];
end

path
reward
