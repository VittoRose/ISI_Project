%% State variable plot and analysis 
close all;

%% Import simulink data
t = out.tout;

% Real state
theta = out.theta.Data; 
xc = out.xc.Data;
dtheta = out.dtheta.Data;
dxc = out.dxc.Data;

% EKF state
x_EKF = out.x_EKF.Data;
theta_EKF = out.theta_EKF.Data;
dx_EKF = out.dx_EKF.Data;
dtheta_EKF = out.dtheta_EKF.Data;

% Reshape
x_EKF = reshape(x_EKF,1,size(x_EKF,3));
theta_EKF = reshape(theta_EKF,1,size(theta_EKF,3));
dx_EKF = reshape(dx_EKF,1,size(dx_EKF,3));
dtheta_EKF = reshape(dtheta_EKF,1,size(dtheta_EKF,3));

% Real vs EKF
figure
subplot(2,2,1)
plot(t,xc,'k','LineWidth',2)
hold on
plot(t,x_EKF,'r','LineWidth',2)
title("X_c real vs X_c EKF")
grid on
hold off

subplot(2,2,2)
plot(t,theta,'k','LineWidth',2)
hold on
plot(t,theta_EKF,'r','LineWidth',2)
title("\theta real vs \theta EKF")
grid on
hold off