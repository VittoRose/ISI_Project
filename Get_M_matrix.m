%% Evaluate the M matrix for EKF

syms xc dxc theta dtheta n1 n2 n3;
q = [xc, dxc, theta, dtheta];
Noise = [n1, n2, n3];

D = (dim.xmax - dim.xmin) - xc + n1;
a1 = atan2(-dim.Lp*cos(theta), xc + dim.Lp*sin(theta)) + n2;
omega = dxc/r + n3;

% First row
a = jacobian(D,Noise);

% Second row
b = jacobian(a1, Noise);

% Third row
c = jacobian(omega,Noise);

M = [a; b; c];

matlabFunction(M,'file','H_matrix', 'Vars', {q, Noise});