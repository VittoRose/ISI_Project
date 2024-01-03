function theta = atan2_mod(y,x)
%This function change the range of theta from [-pi,pi] to [0,2pi]

theta_aux = atan2(y,x);                 % Auxiliary angle with range [-pi, pi]

theta = mod(theta_aux + 2*pi, 2*pi);       % Angle with range [0, 2pi]

end