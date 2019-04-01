function states = updatestates(states, dx)

  K = numel(states);

  for k = 1:K
    state = states{k};
    state.value = state.value + dx(state.range);
    if strcmp(state.type, 'pose')
      state.value(3) = pi2pi(state.value(3));
    end
    states{k} = state;
  end
end
