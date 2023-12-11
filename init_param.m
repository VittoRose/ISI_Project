%% Parameters for simulation

clear;
clc

%% Initial condition
xc_0 = 2;           % [m]
dxc_0 = 0;          % [m/s]
theta_0 = pi/3;     % [rad]
dtheta_0 = 0;       % [rad/s]


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
dim.Lp = 6;

%% System inertial param

% Masses
Mp = 1;
Mc = 2;
M1 = 3;
M2 = 4;

% Other param
Kg = 4;         % Planetary gearbox ratio
Km = 2;         % DC motor constant
r = 0.1;        % motor pinion diameter

% Param for dynamic equations
param.M = Mp + Mc + M1 + M2;   
param.N = 4/3*(M2*dim.L2^2 + M1*dim.L1^2) + Mp*dim.Lp^2;
param.P = M2*dim.L2 + Mp*dim.Lp - M1*dim.L1;
param.W = Kg*Km/(2*r);
param.Rm = 0.1;     % [ohm] armature resistence

%% Sensor's Params

% Sensors's standard deviations
std_dev.distance_sensor = 0.005;    % [m] Deviazione standard sensore per misurazione distanza D (sensore laser)
std_dev.a1_sensor = 0.09;           % [rad] Deviazione standard sensore per misurazione angolo a1 (telecamera)
std_dev.angularspeed_sensor = 0.1;  % [rad/s] Deviazione standard sensore per misurazione velocità angolare pignone (sensore a effetto hall)

% Sensor sampling times

Ts.distance_sensor = 1e-2;
Ts.a1_sensor = 5e-2;
Ts.angularspeed_sensor = 1e-3;


