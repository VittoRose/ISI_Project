%% Test animation
clc, close all;

% Get data from simulink
t = out.tout;
theta = out.theta.Data; 
xc = out.xc.Data;

% Resize
step = 100;
xc_plot = xc(1:step:end);
theta_plot = theta(1:step:end);

for i = 1:1:length(xc_plot)
    cla;
    draw_sys(xc_plot(i), theta_plot(i), dim);
    drawnow;
end