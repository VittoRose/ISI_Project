%% Parameters for simulation

clear;
clc

GET_MATRIX = true;
sim_time = 20;

% UKF and EKF sample time
dt_EKF = 0.001;
dt_UKF = 0.001;

%% Ideal Initial condition
xc_0_i = 2;           % [m]
dxc_0_i = 0;          % [m/s]
theta_0_i = 0;     % [rad]
dtheta_0_i = 0;       % [rad/s]

%% Std deviation initial conditions
std_dev_xc = 0.1;               % [m]
std_dev_theta = 0.1;            % [rad]
std_dev_dxc = 0.01;             % [m/s]
std_dev_dtheta = 0.001;         % [rad/s]

%% Real Initial condition
xc_0 = xc_0_i + std_dev_xc*randn(1,1) ;                % [m]
dxc_0 = dxc_0_i + std_dev_theta*randn(1,1);            % [m/s]
theta_0 = theta_0_i + std_dev_dxc*randn(1,1);          % [rad]
dtheta_0 = dtheta_0_i + std_dev_dtheta*randn(1,1);     % [rad/s]

%% Input disturbe parameter

% Std deviation input disturbe
std_dev_d = 0.01;

% Mean input disturbe
U_mean = 0;

%% System dimension

% Rail length
dim.xmin = 0;               %[m]
dim.xmax = 10;              %[m]

% Kart dimension
dim.h = 1;                  %[m]
dim.b = 1.5;                %[m]

% Pendulum length
dim.L1 = 3;                 %[m]
dim.L2 = 3;                 %[m]
dim.Lp = 3;                 %[m]

%% System inertial param

% Masses
Mp = 10;             %[kg]
Mc = 30;            %[kg]
M1 = 10;             %[kg]
M2 = 10;             %[kg]

% Other param
Kg = 4;         % Planetary gearbox ratio
Km = 2;         % DC motor constant
r = 0.1;        % [m] motor pinion radius   

% Param for dynamic equations
param.M = Mp + Mc + M1 + M2;   
param.N = 4/3*(M2*dim.L2^2 + M1*dim.L1^2) + Mp*dim.Lp^2;
param.P = M2*dim.L2 + Mp*dim.Lp - M1*dim.L1;
param.W = Kg*Km/(2*r);
param.Rm = 0.1;                                 % [ohm] armature resistence
param.g = 9.81;                                 % [m/s^2]

%% Sensor's Params

% Sensors's standard deviations
std_dev.distance_sensor = 0.05;     % [m] Deviazione standard sensore per misurazione distanza D (sensore laser)
std_dev.a1_sensor = 0.09;           % [rad] Deviazione standard sensore per misurazione angolo a1 (telecamera)
std_dev.angularspeed_sensor = 0.1;  % [rad/s] Deviazione standard sensore per misurazione velocità angolare pignone (sensore a effetto hall)

% Sensor sampling times

Ts.distance_sensor = 1e-2;          % [s]
Ts.a1_sensor = 5e-2;                % [s]
Ts.angularspeed_sensor = 1e-3;      % [s]

%% Evaluate matrix for EKF

if GET_MATRIX 
    Get_F_matrix
    Get_H_matrix
    Get_D_matrix
end

%% Parameters for EKF

% Sensor Covariance
R =[std_dev.distance_sensor^2 0 0; 0 std_dev.a1_sensor^2 0; 0 0 std_dev.angularspeed_sensor^2];

% Input disturbe
Q = std_dev_d^2;

x_mean_0 = [xc_0_i; theta_0_i; dxc_0_i; dtheta_0_i];

P_0 = [std_dev_xc^2 0 0 0; 0 std_dev_theta^2 0 0; 0 0 std_dev_dxc^2 0; 0 0 0 std_dev_dtheta^2];

epsilon = 0.0001;