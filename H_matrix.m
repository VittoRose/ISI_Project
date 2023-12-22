function H = H_matrix(in1)
%H_matrix
%    H = H_matrix(IN1)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    22-Dec-2023 11:32:38

theta = in1(:,3);
xc = in1(:,1);
t2 = cos(theta);
t3 = imag(xc);
t4 = sin(theta);
t5 = real(xc);
t6 = imag(t2);
t7 = real(t2);
t8 = imag(t4);
t9 = real(t4);
t10 = -t3;
t11 = t6.*3.0;
t12 = t7.*3.0;
t13 = t8.*3.0;
t14 = t9.*3.0;
t15 = -t14;
t18 = t10+t12+t13;
t16 = t5+t11+t15;
t19 = t18.^2;
t17 = t16.^2;
t20 = t17+t19;
t21 = 1.0./t20;
H = reshape([-1.0,t18.*t21,0.0,0.0,0.0,1.0e+1,0.0,-t17.*t21.*((t11+t15)./t16+(t18.*(t12+t13))./t17),0.0,0.0,0.0,0.0],[3,4]);
end
