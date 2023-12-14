%% Test animation
clc, close all;

%% Get data from simulink

% Real state
theta = out.theta.Data; 
xc = out.xc.Data;

% EKF state
x_EKF = out.x_EKF.Data;
theta_EKF = out.theta_EKF.Data;

% Reshape
x_EKF = reshape(x_EKF,1,size(x_EKF,3));
theta_EKF = reshape(theta_EKF,1,size(theta_EKF,3));

% Resize
step = 100;
xc_plot = xc(1:step:end);
theta_plot = theta(1:step:end);
x_EKF_plot = x_EKF(1:step:end);
theta_EKF_plot = theta_EKF(1:step:end);

%% Plot

for i = 1:1:length(xc_plot)
    cla;
    draw_sys(xc_plot(i), theta_plot(i),x_EKF_plot(i), theta_EKF_plot(i), dim);
    drawnow;
end