function [factors] = factorsList(DistCM, ThCM)

  % DistCM - Distance Covariance Multiplicator
  %          Modify covariance for distance measures
  %          By default it should be '1'
  % ThCM - Theta Covariance Multiplicator
  %        Modify covariance for angles measures
  %        By default it should be '1'

  % To swap between 'Original' and 'Corrected' values,
  % un/comment lines and swap them

  %
  factors{1+ 0} = struct(...
    'type', 'pose',...
    'measurement', [0; 0; 0],...
    'covariance', 1e-3 * eye(3,3),...
    'index', 0);

  factors{1+ 1} = struct(...
    'type', 'motion',...
    'measurement', [0.9; 0; d2r(-15)],... % Corrected
    'covariance', diag([5e-2*DistCM, 1e-2*DistCM, (d2r(2)*ThCM)^2]),... % Corrected
    'index', [0,1]);
    % 'measurement', [1; 0; d2r(-5)],... % Original
    % 'covariance', diag([1e-2*DistCM, 1e-2*DistCM, (d2r(2))^2]),... % Original

  factors{1+ 2} = struct(...
    'type', 'motion',...
    'measurement', [1.0; -0.2; d2r(-12)],... % Corrected
    'covariance', diag([5e-2*DistCM, 5e-2*DistCM, (d2r(2)*ThCM)^2]),... % Corrected
    'index', [1,2]);
    % 'measurement', [1.0; -0.05; d2r(-3)],... % Original
    % 'covariance', diag([1e-2*DistCM, 1e-2*DistCM, (d2r(2))^2]),... % Original

  factors{1+ 3} = struct(...
    'type', 'lmk',...
    'measurement', [1.10; d2r(30)],... % Corrected
    'covariance', diag([10e-2*DistCM, (d2r(2)*ThCM)^2]),... % Corrected
    'index', [0,3]);
    % 'measurement', [1.2; d2r(40)],... % Original
    % 'covariance', diag([1e-2*DistCM, (d2r(10))^2]),... % Original

  factors{1+ 4} = struct(...
    'type', 'lmk',...
    'measurement', [0.85; d2r(100)],... % Corrected
    'covariance', diag([5e-2*DistCM, (d2r(2)*ThCM)^2]),... % Corrected
    'index', [1,3]);
    % 'measurement', [0.85; d2r(100)],... % Original
    % 'covariance', diag([2e-2*DistCM, (d2r(5))^2]),... % Original

  factors{1+ 5} = struct(...
    'type', 'lmk',...
    'measurement', [1.20; d2r(30)],...
    'covariance', diag([10e-2*DistCM, (d2r(2)*ThCM)^2]),... % Corrected
    'index', [1,4]);
    % 'measurement', [1.2; d2r(40)],... % Original
    % 'covariance', diag([1e-2*DistCM, (d2r(10)*ThCM)^2]),... % Original

  factors{1+ 6} = struct(...
    'type', 'lmk',...
    'measurement', [1.3; d2r(-35)],... % Corrected
    'covariance', diag([10e-2*DistCM, (d2r(2)*ThCM)^2]),... % Corrected
    'index', [0,5]);
    % 'measurement', [1.5; d2r(-35)],... % Original
    % 'covariance', diag([2e-2*DistCM, (d2r(5)*ThCM)^2]),... % Original

  factors{1+ 7} = struct(...
    'type', 'lmk',...
    'measurement', [0.95; d2r(-55)],... % Corrected
    'covariance', diag([5e-2*DistCM, (d2r(2)*ThCM)^2]),... % Corrected
    'index', [1,5]);
    % 'measurement', [0.9; d2r(-50)],... % Original
    % 'covariance', diag([1e-2*DistCM, (d2r(5)*ThCM)^2]),... % Original

  factors{1+ 8} = struct(...
    'type', 'lmk',...
    'measurement', [2.35; d2r(-30)],... % Corrected
    'covariance', diag([20e-2*DistCM, (d2r(1)*ThCM)^2]),... % Corrected
    'index', [0,6]);
    % 'measurement', [2.5; d2r(-30)],... % Original
    % 'covariance', diag([5e-2*DistCM, (d2r(10)*ThCM)^2]),... % Original

  factors{1+ 9} = struct(...
    'type', 'lmk',...
    'measurement', [1.55; d2r(-25)],... % Corrected
    'covariance', diag([10e-2*DistCM, (d2r(2)*ThCM)^2]),... % Corrected
    'index', [1,6]);
    % 'measurement', [1.85; d2r(-40)],... % Original
    % 'covariance', diag([2e-2*DistCM, (d2r(5)*ThCM)^2]),... % Original

  factors{1+ 10} = struct(...
    'type', 'lmk',...
    'measurement', [0.85; d2r(-40)],...  % Corrected
    'covariance', diag([7e-2*DistCM, (d2r(2)*ThCM)^2]),...  % Corrected
    'index', [2,6]);
    % 'measurement', [0.8; d2r(-45)],... % Original
    % 'covariance', diag([1e-2*DistCM, (d2r(5)*ThCM)^2]),... % Original

end
