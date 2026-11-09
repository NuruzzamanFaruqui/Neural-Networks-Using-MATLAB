state = 21;
path  = state;
is_Terminal = 0;
steps = 0;

while is_Terminal == 0 && steps < 20
  input_Vector = zeros(25, 1);
  input_Vector(state) = 1;

  v1 = weight1*input_Vector;
  y1 = Sigmoid(v1);
  Q  = weight2*y1;

  [~, action] = max(Q);
  [next_State, reward, is_Terminal] = GridWorld(state, action);

  state = next_State;
  path  = [path state];
  steps = steps + 1;
end

path
reward
