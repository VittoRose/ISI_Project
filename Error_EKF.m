%% EFK errors 
figure
title("EKF");
% xc plot
subplot(2,2,1)
plot(t,xc - x_EKF,'k','LineWidth',2)
hold on
title("Errors on X_c")
xlabel("[s]")
ylabel("[m]")
grid on
hold off

% theta plot
subplot(2,2,2)
plot(t,theta - theta_EKF,'k','LineWidth',2)
hold on
title("Errors on \theta ")
xlabel("[s]")
ylabel("[rad]")
grid on
hold off

% dxc plot
subplot(2,2,3)
plot(t,dxc - dx_EKF,'k','LineWidth',2)
hold on
xlabel("[s]")
ylabel("[m/s]")
title("Error on dX_c")
grid on
hold off

% dtheta plot
subplot(2,2,4)
plot(t,dtheta - dtheta_EKF,'k','LineWidth',2)
hold on
grid on
xlabel("[s]")
ylabel("[rad/s]")
title("Error on d\theta")
hold off