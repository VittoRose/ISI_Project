function D = D_matrix(in1,V,U)
%D_matrix
%    D = D_matrix(IN1,V,U)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    24-Dec-2023 13:00:53

theta = in1(:,3);
t2 = cos(theta);
t3 = t2.^2;
D = [0.0;0.0;(-6.6e+1./5.0)./(t3.*9.0e+1-1.98e+3);(t2.*1.2e+1)./(t3.*9.0e+2-1.98e+4)];
end
