function [A, r] = buildproblem(states, factor)
  % Variables
  K = numel(factor);
  A = zeros(25, 17);
  r = zeros(25, 1);
  row = 1;
  %

  % Let's iterate over all factors
  for k = 1:K
    % Factor parameters
    y = factor{k}.measurement;
    W = factor{k}.covariance^-1;
    Wt2 = chol(W, 'upper');

    switch factor{k}.type
    case 'motion' % For rob-to-rob factor
        i = factor{k}.index(1);
        j = factor{k}.index(2);
        rob1 = states{1+ i};
        rob2 = states{1+ j};
        [e, J_e_rob1, J_e_rob2] = error_move(rob1.value, rob2.value, y);

        rows = [row : row + numel(y) - 1];
        r(rows) = Wt2 * e;
        A(rows, rob1.range) = Wt2 * J_e_rob1;
        A(rows, rob2.range) = Wt2 * J_e_rob2;
      case 'lmk' % For rob-to-lmk factor
        i = factor{k}.index(1);
        j = factor{k}.index(2);
        rob = states{1+ i};
        lmk = states{1+ j};
        [e, J_e_rob, J_e_lmk] = error_observe(rob.value, lmk.value, y);

        rows = [row : row + numel(y) - 1];
        r(rows) = Wt2 * e;
        A(rows, rob.range) = Wt2 * J_e_rob;
        A(rows, lmk.range) = Wt2 * J_e_lmk;
      case 'pose' % For rob factor
        i = factor{k}.index(1);
        rob = states{1+ i};
        [e, J_e_rob] = error_pose(rob.value, y);

        rows = [row : row + numel(y) - 1];
        r(rows) = Wt2 * e;
        A(rows, rob.range) = Wt2 * J_e_rob;
    end

    % Update row index to a new index based on factor's num of measurements
    row = row + numel(y);
  end

end
