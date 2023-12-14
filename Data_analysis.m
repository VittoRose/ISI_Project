%% State variable plot and analysis 

% Import simulink data
t = out.tout;
theta = out.theta.Data; 
xc = out.xc.Data;
dtheta = out.dtheta.Data;
dxc = out.dxc.Data;
x_ekf = out.x_EKF.Data;

% Rename variable
% x_EKF = x_ekf(1,)