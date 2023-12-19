%% Evaluate the H matrix for EKF

syms xc dxc theta dtheta;
q = [xc, dxc, theta, dtheta];

D = (dim.xmax - dim.xmin) - xc;
a1 = atan2(-dim.Lp*cos(theta), xc - dim.Lp*sin(theta));
omega = dxc/r;

% First row
a = jacobian(D,q);

% Second row
b = jacobian(a1, q);

% Third row
c = jacobian(omega,q);

H = [a; b; c];

matlabFunction(H,'file','H_matrix', 'Vars', {q});