% Rauch Tung Striebel regolarization

% x format homogenization
x_new = transpose(out.x_new.data);
x_now = [out.x_EKF.data; out.theta_EKF.data; out.dx_EKF.data; out.dtheta_EKF.data];

% Initialization
C = zeros(4, 4);
xs = zeros(4, length(out.tout));
Ps = zeros(4, 4, length(out.tout));

% For cicle initialization
x = x_now(:, length(out.tout));
xs(:, length(out.tout)) = x;

for i = (length(out.tout) - 1):-1:1
    P = out.P.data(:,:,i);
    P_new = out.P_new.data(:,:,i);
    F = out.F.data(:,:,i);
    x_now1 = x_now(:,i);
    x_new1 = x_new(:,i);
    
    C = P*transpose(F)*pinv(P_new);
    x = x_now1 + C*( x - x_new1 );
    xs(:,i) = x;
end
