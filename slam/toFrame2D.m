function [pf, J_pf_f, J_pf_p] = toFrame2D(F, p)

  % Rotational for frame (F)
  T = F(1:2); % Translation
  th = F(3); % Rotation/Orientation
  R = [ cos(th) -sin(th) ; sin(th) cos(th) ];

  % p transformation to frame F
  pf = R' * (p - T);

  x = T(1);
  y = T(2);
  px = p(1);
  py = p(2);

  % Jacobian for point (p)
  J_pf_f = [...
    [ -cos(th), -sin(th),   cos(th)*(py - y) - sin(th)*(px - x)]
    [  sin(th), -cos(th), - cos(th)*(px - x) - sin(th)*(py - y)]
  ];
  J_pf_p = R';

end

function f()
  %%
  syms x y th px py real
  F = [x;y;th];
  p = [px;py];
  pf = toFrame2D(F, p);

  J_pf_f = simplify(jacobian(pf, F))
end
