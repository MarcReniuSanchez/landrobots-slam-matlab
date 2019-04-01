function slam
  % RESET
  clc; % clean console
  clear; % clean variables
  close all; % close all figures
  %

  % Initializations
  states = statesList;
  factors = factorsList(1, 1);
  dx = ones(17,1) * 1e6;
  normDx = norm(dx);
  eps = 1e-6;
  iters = 0;
  %

  while normDx > eps
    [A,r] = buildproblem(states, factors);
    dx = solvelinearized(A, r);
    states = updatestates(states, dx);
    drawmap(states, factors);
    normDx = norm(dx);
    iters = iters + 1;
    fprintf('Iteration %d, Norm(dx) = %e\n\n', iters, normDx);
  end

  fprintf('Final results --\n')
  fprintf('Norm(dx) = %e\n', normDx);
  fprintf('Iterations = %d\n', iters);
end
