function F = F_matrix(in1,V,U)
%F_matrix
%    F = F_matrix(IN1,V,U)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    06-Jan-2024 18:50:12

dtheta = in1(:,4);
dxc = in1(:,2);
theta = in1(:,3);
t2 = cos(theta);
t3 = sin(theta);
t4 = U+V;
t5 = dtheta.^2;
t6 = t2.^2;
t7 = t3.^2;
t8 = t6.*9.0e+1;
t9 = t6.*9.0e+2;
t10 = t8-1.98e+3;
t11 = t9-1.98e+4;
t12 = 1.0./t10;
t13 = 1.0./t11;
mt1 = [1.0,0.0,0.0,0.0,1.0./1.0e+3,0.0,t12.*6.9828+1.0,t2.*t13.*(-6.348),0.0,1.0,t12.*(t6.*8.829e+2-t7.*8.829e+2+t2.*t5.*9.9e+2).*(-1.0./1.0e+3)-t2.*t3.*t12.^2.*(dxc.*(-6.9828e+3)+t4.*1.518e+3+t2.*t3.*8.829e+2+t3.*t5.*9.9e+2).*(9.0./5.0e+1)];
mt2 = [(t13.*(t2.*1.7658e+4+dxc.*t3.*6.348e+3-t3.*t4.*1.38e+3-t5.*t7.*9.0e+2+t5.*t9))./1.0e+3+t2.*t3.*t13.^2.*(t3.*1.7658e+4-dxc.*t2.*6.348e+3+t2.*t4.*1.38e+3+t2.*t3.*t5.*9.0e+2).*(9.0./5.0),0.0,1.0./1.0e+3,dtheta.*t3.*t12.*(-9.9e+1./5.0e+1),dtheta.*t2.*t3.*t13.*(9.0./5.0)+1.0];
F = reshape([mt1,mt2],4,4);
end
