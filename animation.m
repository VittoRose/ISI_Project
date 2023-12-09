%% Test animation
clc, close all;

% Get data from simulink
t = out.tout;
theta = out.theta.Data;
xc = out.xc.Data;

for i = 1:1:length(t)
    cla;
    draw_sys(xc(i), theta(i), dim);
    drawnow;
end