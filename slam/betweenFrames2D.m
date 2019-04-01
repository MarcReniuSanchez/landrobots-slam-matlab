function [F, J_f_f1, J_f_f2] = betweenFrames2D(F1, F2)

  % Rotational for frame 1 (F1)
  T1 = F1(1:2);
  th1 = F1(3);
  R1 = [ cos(th1) -sin(th1) ; sin(th1) cos(th1) ];

  % Rotational for frame 2 (F2)
  T2 = F2(1:2);
  th2 = F2(3);
  % R2 = [ cos(th2) -sin(th2) ; sin(th2) cos(th2) ];

  % New frame
  T = R1' * (T2 - T1); % T = toFrame2D(F1, F2);
  th = th2 - th1;
  F = [T;th];

  x1 = T1(1);
  y1 = T1(2);
  x2 = T2(1);
  y2 = T2(2);

  % Jacobian for frame 1 (F1)
  J_f_f1 = [...
    [ -cos(th1), -sin(th1), sin(th1)*(x1 - x2) - cos(th1)*(y1 - y2)]
    [  sin(th1), -cos(th1), cos(th1)*(x1 - x2) + sin(th1)*(y1 - y2)]
    [         0,        0, 1]
  ];

  % Jacobian for frame 2 (F2)
  J_f_f2 = [...
    [  cos(th1), sin(th1), 0]
    [ -sin(th1), cos(th1), 0]
    [         0,        0, 1]
  ];
end

function f()
  %%
  syms x1 y1 th1 x2 y2 th2 real
  F1 = [x1;y1;th1];
  F2 = [x2;y2;th2];
  F = betweenFrames2D(F1,F2);
  J_f_f1 = simplify(jacobian(F, F1))
  J_f_f2 = simplify(jacobian(F, F2))
  %%
end
