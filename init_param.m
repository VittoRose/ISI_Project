%% Parameters for simulation

clear;
clc

% Simulation Flags
GET_MATRIX = true;
PLOT_FILTER = true;

% Simulation time
sim_time = 20;          % [s]

% UKF and EKF sample time
dt_EKF = 0.001;         % [s]
dt_UKF = 0.001;         % [s]

%% Ideal Initial condition
xc_0_i = 2;           % [m]
dxc_0_i = 0;          % [m/s]
theta_0_i = pi/4;     % [rad]
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
U_mean = 0;                 % [V]

%% Ideal System dimension

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

%% Standard deviation system dimension
std_dev_dim = 0.01;         %[m]

%% Real System dimension

% Rail length
dim_real.xmin = 0 + std_dev_dim*randn(1,1);               %[m]
dim_real.xmax = 10 + std_dev_dim*randn(1,1);              %[m]

% Kart dimension
dim_real.h = 1 + std_dev_dim*randn(1,1);                  %[m]
dim_real.b = 1.5 + std_dev_dim*randn(1,1);                %[m]

% Pendulum length
dim_real.L1 = 3 + std_dev_dim*randn(1,1);                 %[m]
dim_real.L2 = 3 + std_dev_dim*randn(1,1);                 %[m]
dim_real.Lp = 3 + std_dev_dim*randn(1,1);                 %[m]


%% Ideal system inertial param

% Masses
Mp = 10;             %[kg]
Mc = 30;            %[kg]
M1 = 10;             %[kg]
M2 = 10;             %[kg]

%% Standard deviation inertial param
std_dev_m = 0.01;         %[kg]

%% Real system inertial param

% Masses
Mp_real = 10 + std_dev_m*randn(1,1);         %[kg]
Mc_real = 30 + std_dev_m*randn(1,1);         %[kg]
M1_real = 10 + std_dev_m*randn(1,1);         %[kg]
M2_real = 10 + std_dev_m*randn(1,1);         %[kg]

%% Other param
Kg = 4;         % [-] Planetary gearbox ratio
Km = 2;         % [Nm/A] DC motor constant
r = 0.1;        % [m] motor pinion radius   

%% Ideal param for dynamic equations
param.M = Mp + Mc + M1 + M2;   
param.N = 4/3*(M2*dim.L2^2 + M1*dim.L1^2) + Mp*dim.Lp^2;
param.P = M2*dim.L2 + Mp*dim.Lp - M1*dim.L1;
param.W = Kg*Km/(2*r);
param.Rm = 0.1;                                 % [ohm] armature resistence
param.g = 9.81;                                 % [m/s^2]

%% Real param for dynamic equations
param_real.M = Mp_real + Mc_real + M1_real + M2_real;   
param_real.N = 4/3*(M2_real*dim_real.L2^2 + M1_real*dim_real.L1^2) + Mp_real*dim_real.Lp^2;
param_real.P = M2_real*dim_real.L2 + Mp_real*dim_real.Lp - M1_real*dim_real.L1;
param_real.W = Kg*Km/(2*r);
param_real.Rm = 0.1;                                 % [ohm] armature resistence
param_real.g = 9.81;                                 % [m/s^2]


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

%% Parameters for Filtering

% Sensor Covariance
R =[std_dev.distance_sensor^2 0 0; 0 std_dev.a1_sensor^2 0; 0 0 std_dev.angularspeed_sensor^2];

% Input disturbe
Q = std_dev_d^2;

x_mean_0 = [xc_0_i; theta_0_i; dxc_0_i; dtheta_0_i];

P_0 = [std_dev_xc^2 0 0 0; 0 std_dev_theta^2 0 0; 0 0 std_dev_dxc^2 0; 0 0 0 std_dev_dtheta^2];

epsilon = 0.0001;

%% Mahalanobis treshold
m_treshold = 5;



