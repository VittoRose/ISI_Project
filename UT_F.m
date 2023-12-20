function [p_mean, propagated_cov] = UT_F(x_mean, sigma_x, dt, V, param, Q, U_mean)

% Rename input variables
N = param.N;
M = param.M;
Rm = param.Rm;
g = param.g;
W = param.W;
P = param.P;



% Define parameters
alpha = 1;
% beta = 2;
k = 0;
n = size(x_mean,1);
lambda = alpha^2*(n + k) - n;

% Compute weights
w0 = lambda/(lambda + n);
wc = zeros(2*n+1,1);
wc(1) = w0;
wc(2:2*n+1) = 1/(2*(n+lambda));
size(wc)

% Factorise covariance matrix
[U,S] = svd(sigma_x);
S = complex(S);
gamma = U*S^(1/2);
gamma = real(gamma);

% Create sigma points
sigma_points = zeros(length(x_mean),2*n+1);
sigma_points(:,1) = x_mean;

for i = 1:size(gamma,2)
    sigma_points(:,i+1) = x_mean + sqrt(n+lambda)*gamma(:,i);
    sigma_points(:,n+i+1) = x_mean - sqrt(n+lambda)*gamma(:,i);
end

% Propagated sigma points eval.
prop_sigma_points = zeros(length(x_mean),2*n+1);
for i = 1:size(gamma,2)

    % Rename sigma points componets
    % xc = sigma_points(1,i);
    theta = sigma_points(2,i);
    dxc = sigma_points(3,i);
    dtheta = sigma_points(4,i);
    
    % F(sigma_points)
    prop_sigma_points(:,i) = sigma_points(1:4,i) + dt*...
        [dxc;...
        dtheta;...
        (V*N*W - dxc*N*W^2 + cos(theta)*g*sin(theta)*Rm*P^2 + dtheta^2*sin(theta)*Rm*N*P)/(Rm*(N*M - cos(theta)^2*P^2));...
        -P/Rm*(g*sin(theta)*Rm*M + cos(theta)*dtheta^2*sin(theta)*Rm*P + cos(theta)*(V)*W - cos(theta)*dxc*W^2)/(N*M - cos(theta)^2*P^2)];
end

% Propagated mean
p_mean = zeros(length(x_mean), 1);
p_mean(1) = prop_sigma_points(1,:)*wc;
p_mean(2) = prop_sigma_points(2,:)*wc;
%p_mean(2) = atan2(sin(prop_sigma_points(2,:))*wc,cos(prop_sigma_points(2,:))*wc);
p_mean(3) = prop_sigma_points(3,:)*wc;
p_mean(4) = prop_sigma_points(4,:)*wc;

% Compute tilde
p_tilde = zeros(length(x_mean),2*n+1);

for i = 1:1:2*n+1
    p_tilde(1,i) = prop_sigma_points(1,i) - p_mean(1);
    p_tilde(2,i) = atan2(sin(prop_sigma_points(2,i) - p_mean(2)) ,cos(prop_sigma_points(2,i)- p_mean(2)));
    p_tilde(3,i) = prop_sigma_points(3,i) - p_mean(3);
    p_tilde(4,i) = prop_sigma_points(4,i) - p_mean(4);
end


% Propagated cov
propagated_cov = zeros(size(sigma_x));
    for i = 1:size(sigma_points,2)
        propagated_cov = propagated_cov + wc(i)*p_tilde(:,i)*p_tilde(:,i)';
    end
end


