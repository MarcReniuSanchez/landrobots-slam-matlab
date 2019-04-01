function [lmk, J_lmk_rob, J_lmk_y] = inv_observe(rob, y)

  [lmkrob, J_lmkrob_y] = p2c(y);

  [lmk, J_lmk_rob, J_lmk_lmkrob] = fromFrame2D(rob, lmkrob);

  J_lmk_y = J_lmk_lmkrob * J_lmkrob_y;

end
