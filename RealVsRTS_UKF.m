%% State variable plot and analysis 
close all;

%% Import simulink data
t = out.tout;

% Real state
theta = out.theta.Data'; 
xc = out.xc.Data';
dtheta = out.dtheta.Data';
dxc = out.dxc.Data';

%% Real vs RTS
figure
title("UKF");
%% xc plot
% draw real xc
subplot(2,2,1)
plot(t,xc,'k','LineWidth',2)
hold on

% draw RTS
plot(t,xs_UKF(1,:),'b','LineWidth',2)
title("X_c real vs X_c RTS-UKF")
xlabel("[s]")
ylabel("[m]")
grid on
legend("Real","RTS");
hold off

%% theta plot
%draw real theta
subplot(2,2,2)
plot(t,theta,'k','LineWidth',2)
hold on

% draw RTS
plot(t,xs_UKF(2,:),'b','LineWidth',2)
title("\theta real vs \theta RTS-UKF")
xlabel("[s]")
ylabel("[rad]")
grid on
legend("Real", "RTS");
hold off

%% dxc plot
%draw real dxc
subplot(2,2,3)
plot(t,dxc,'k','LineWidth',2)
hold on

% draw RTS
plot(t,xs_UKF(3,:),'b','LineWidth',2)
title("dX_c real vs dX_c RTS-UKF")
xlabel("[s]")
ylabel("[m/s]")
grid on
legend("Real", "RTS");
hold off

%% dtheta plot
%draw real dtheta
subplot(2,2,4)
plot(t,dtheta,'k','LineWidth',2)
hold on

% draw RTS
plot(t,xs_UKF(4,:),'b','LineWidth',2)
title("d\theta real vs d\theta RTS-UKF")
xlabel("[s]")
ylabel("[rad/s]")
grid on
legend("Real", "RTS");
hold off