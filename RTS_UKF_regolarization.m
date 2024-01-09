% Rauch Tung Striebel regolarization fo UKF

% x format homogenization
x_new = transpose(out.x_new_UKF.data);
x_now = [out.x_UKF.data; out.theta_UKF.data; out.dx_UKF.data; out.dtheta_UKF.data];

% Initialization
C = zeros(4, 4);
xs_UKF = zeros(4, length(out.tout));
Ps = zeros(4, 4, length(out.tout));

% For cicle initialization
x = x_now(:, length(out.tout));
xs_UKF(:, length(out.tout)) = x;

for i = (length(out.tout) - 1):-1:1
    P = out.P_UKF.data(:,:,i);%
    P_new = out.P_new_UKF.data(:,:,i);%
    F = out.F_UKF.data(:,:,i+1);%
    x_now1 = x_now(:,i);
    x_new1 = x_new(:,i);
    
    C = P*transpose(F)*pinv(P_new);
    svd_vector = svd(C);
    
    for j = 1:1:4
        if svd_vector(j) > 1.05
            C = zeros(4);
        end
    end
    
    x = x_now1 + C*( x - x_new1 );
    xs_UKF(:,i) = x;
end