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

% UKF state
x_UKF = out.x_UKF.Data;
theta_UKF = out.theta_UKF.Data;
dx_UKF = out.dx_UKF.Data;
dtheta_UKF = out.dtheta_UKF.Data;

% Reshape
x_UKF = reshape(x_UKF,1,size(x_UKF,3));
theta_UKF = reshape(theta_UKF,1,size(theta_UKF,3));
dx_UKF = reshape(dx_UKF,1,size(dx_UKF,3));
dtheta_UKF = reshape(dtheta_UKF,1,size(dtheta_UKF,3));

% Resize
step = 100;
xc_plot = xc(1:step:end);
theta_plot = theta(1:step:end);
x_EKF_plot = x_EKF(1:step:end);
theta_EKF_plot = theta_EKF(1:step:end);
x_UKF_plot = x_UKF(1:step:end);
theta_UKF_plot = theta_UKF(1:step:end);

%% Plot

a = figure;

for i = 1:1:length(xc_plot)
    clf;

% Draw EKF
    subplot(1,2,1)
    draw_sys(xc_plot(i), theta_plot(i),x_EKF_plot(i), theta_EKF_plot(i), dim, "EKF");

% Draw UFK
    subplot(1,2,2)
    draw_sys(xc_plot(i), theta_plot(i), x_UKF_plot(i), theta_UKF_plot(i), dim, "UKF");
    
% MATLAB optimization    
    drawnow limitrate;
    pause(0.01);
end