%% State variable plot and analysis 
close all;

%% Import simulink data
t = out.tout;

% Real state
theta = out.theta.Data'; 
xc = out.xc.Data';
dtheta = out.dtheta.Data';
dxc = out.dxc.Data';

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

%% Real vs EKF vs RTS
figure
title("EKF");
% xc plot
subplot(2,2,1)
plot(t,xc,'k','LineWidth',2)
hold on
plot(t,x_EKF,'r','LineWidth',2)
% draw RTS
plot(t,xs_EKF(1,:),'b','LineWidth',1)
title("X_c real vs X_c EKF vs X_c RTS")
%
grid on
legend("Real","EKF","RTS");
hold off

% theta plot
subplot(2,2,2)
plot(t,theta,'k','LineWidth',2)
hold on
plot(t,theta_EKF,'r','LineWidth',2)
% draw RTS
plot(t,xs_EKF(2,:),'b','LineWidth',1)
title("\theta real vs \theta EKF vs \theta RTS")

grid on
legend("Real","EKF", "RTS");
hold off

% dxc plot
subplot(2,2,3)
plot(t,dxc,'k','LineWidth',2)
hold on
plot(t,dx_EKF,'r','LineWidth',2)
% draw RTS
plot(t,xs_EKF(3,:),'b','LineWidth',1)
title("dX_c real vs dX_c EKF vs dX_c RTS")

grid on
legend("Real","EKF", "RTS");
hold off

% dtheta plot
subplot(2,2,4)
plot(t,dtheta,'k','LineWidth',2)
hold on
plot(t,dtheta_EKF,'r','LineWidth',2)
% draw RTS
plot(t,xs_EKF(4,:),'b','LineWidth',1)
title("d\theta real vs d\theta EKF vs d\theta RTS")

grid on
legend("Real","EKF", "RTS");
hold off


%% Real vs UKF 
figure
title("UKF");
% xc plot
subplot(2,2,1)
plot(t,xc,'k','LineWidth',2)
hold on
plot(t,x_UKF,'r','LineWidth',2)
% draw RTS
% plot(t,xs_UKF(1,:),'b','LineWidth',1)
title("X_c real vs X_c UKF")
grid on
legend("Real","UKF");
hold off

% theta plot
subplot(2,2,2)
plot(t,theta,'k','LineWidth',2)
hold on
plot(t,theta_UKF,'r','LineWidth',2)
% draw RTS
% plot(t,xs_UKF(2,:),'b','LineWidth',1)
title("X_c real vs X_c UKF")
grid on
legend("Real","UKF");
hold off

% dxc plot
subplot(2,2,3)
plot(t,dxc,'k','LineWidth',2)
hold on
plot(t,dx_UKF,'r','LineWidth',2)
% draw RTS
% plot(t,xs_UKF(3,:),'b','LineWidth',1)
title("X_c real vs X_c UKF")
grid on
legend("Real","UKF");
hold off

% dtheta plot
subplot(2,2,4)
plot(t,dtheta,'k','LineWidth',2)
hold on
plot(t,dtheta_UKF,'r','LineWidth',2)
% draw RTS
% plot(t,xs_UKF(4,:),'b','LineWidth',1)
title("X_c real vs X_c UKF")
grid on
legend("Real","UKF");
hold off