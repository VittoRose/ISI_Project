function [y, Cov_y, cross_cov] = UT_H(x_mean, sigma_x, dim, r)

% Define parameters
alpha = 1;
% beta = 2;
k = 0;
n = size(x_mean,1);
lambda = alpha^2*(n + k);

% Compute weights
w0 = lambda/(lambda + n);
wc = zeros(2*n+1,1);
wc(1) = w0;
wc(2:2*n+1) = 1/(2*(n+lambda));

% Factorise covariance matrix
[U,S] = svd(sigma_x);
S = complex(S);                 % convert S to a complex matrix to avoid errors
gamma = U*sqrt(S);

gamma = real(gamma);

% Create sigma points
sigma_points = zeros(length(x_mean),2*n+1);
sigma_points(:,1) = x_mean;

for i = 1:size(gamma,2)
    sigma_points(:,i+1) = x_mean + sqrt(n+lambda)*gamma(:,i);
    sigma_points(:,n+i+1) = x_mean - sqrt(n+lambda)*gamma(:,i);
end

% Propagated sigma points eval.
prop_sigma_points = zeros(3,2*n+1);
for i = 1:size(gamma,2)

    % Rename sigma points componets
    xc = sigma_points(1,i);
    theta = sigma_points(2,i);
    dxc = sigma_points(3,i);
    % dtheta = sigma_points(4,i);
    
    % h(sigma_points)
    prop_sigma_points(:,i) = [(dim.xmax - dim.xmin) - xc; atan2(-dim.Lp*cos(theta), xc - dim.Lp*sin(theta)); dxc/r];
end


% Compute means
y = zeros(3,1);
y(1) = prop_sigma_points(1,:)*wc;
y(2) = atan2(sin(prop_sigma_points(2,:))*wc,cos(prop_sigma_points(2,:))*wc);
y(3) = prop_sigma_points(3,:)*wc;

% Compute tilde
y_tilde = zeros(3,2*n+1);

for i = 1:1:2*n+1
    y_tilde(1,i) = prop_sigma_points(1,i) - y(1);
    y_tilde(2,i) = atan2(sin(prop_sigma_points(2,i) - y(2)) ,cos(prop_sigma_points(2,i)- y(2)));
    y_tilde(3,i) = prop_sigma_points(3,i) - y(3);
end

% Compute cov
Cov_y = zeros(length(y), length(y));
cross_cov = zeros(length(x_mean), length(y));
for i = 1:1:2*n+1
        Cov_y = Cov_y + wc(i)*y_tilde(:,i)*y_tilde(:,i)';
        cross_cov = cross_cov + wc(i)*(sigma_points(:,i) - x_mean)*y_tilde(:,i)';
end

end