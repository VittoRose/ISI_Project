%% Parameters for simulation

clear dim param;
clc

%% System dimension

% Rail length
dim.xmin = 0;
dim.xmax = 10;

% Body dimension
dim.h = 1;
dim.b = 1.5;

% Pendulum length
dim.L1 = 3;
dim.L2 = 3;
dim.Lp = 3;

%% System inertial param

% Masses
Mp = 1;
Mc = 2;
M1 = 3;
M2 = 4;

% Other param
Kg = 4;         % Planetary gearbox ratio
Km = 2;         % DC motor constant


% Param for dynamic equations
param.M = Mp + Mc + M1 + M2;   
param.N = 4/3*(M2*dim.L2^2 + M1*dim.L1^2) + Mp*dim.Lp^2;
param.P = M2*dim.L2 + Mp*dim.Lp - M1*dim.L1;




