function F = F_matrix(in1)
%F_matrix
%    F = F_matrix(IN1)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    13-Dec-2023 12:26:26

dtheta = in1(:,4);
dxc = in1(:,2);
theta = in1(:,3);
t2 = cos(theta);
t3 = sin(theta);
t4 = dtheta.^2;
t5 = t2.^2;
t6 = t3.^2;
t7 = t5.*8.1e+1;
t8 = t5.*(8.1e+1./1.0e+1);
t9 = t7-3.57e+2;
t11 = t8-3.57e+2./1.0e+1;
t10 = 1.0./t9;
t12 = 1.0./t11;
mt1 = [1.0,0.0,0.0,0.0,1.0e-4,0.0,t12.*(2.04e+2./2.5e+1)+1.0,t2.*t10.*(-7.2e+1./5.0),0.0,1.0,t12.*(t5.*7.9461e+1-t6.*7.9461e+1+t2.*t4.*(4.59e+2./1.0e+1)).*(-1.0e-4)-t2.*t3.*t12.^2.*(dxc.*-8.16e+4+t2.*t3.*7.9461e+1+t3.*t4.*(4.59e+2./1.0e+1)+3.57e+2).*1.62e-3];
mt2 = [(t10.*(t2.*6.1803e+2-t3.*6.3e+2+dxc.*t3.*1.44e+5-t4.*t6.*8.1e+1+t4.*t7))./1.0e+4+t2.*t3.*t10.^2.*(t2.*6.3e+2+t3.*6.1803e+2-dxc.*t2.*1.44e+5+t2.*t3.*t4.*8.1e+1).*1.62e-2,0.0,1.0e-4,dtheta.*t3.*t12.*(-9.18e-3),dtheta.*t2.*t3.*t10.*1.62e-2+1.0];
F = reshape([mt1,mt2],4,4);
end
