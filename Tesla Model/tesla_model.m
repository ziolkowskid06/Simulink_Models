%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   %
%   TESLA MODEL S P85 SIMULATION    %
%                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% SATURATION - parameters

uppLimit = 601;            % [Nm] maximum torque
lowLimit = 0;              % [Nm] minimum torque

%% BATTERY PERFORMANCE - parameters

mod = 16;                  % number of modules 
groups = 6;                % number of groups
v_nom = 3.6;               % nominal voltage of one cell

% cells are wired parallel, since nominal voltage is constant

V = mod*groups*v_nom;      % nominal battery voltage (INPUT)

%% BRUSHED DC MOTOR - parameters

R = 5.3*10^(-3);           % [Ohm] resistance
L = 493*10^(-9);           % [Henrys] inductance
K_E = 0.12;                % [Vs/rad] electromotive force constant
K_T = 0.25;                % [Nm/Amp] motor torque constant

%% TRACTION FORCE - parameters

d = 0.48;                  % [m] wheel diameter
r = 0.5*d;                 % [m] wheel radius
G_r = 9.73;                % [-] gear ratio
eta = 0.70;                % [-] overall efficiency
ft = G_r*eta*(1/r);        % traction force ingredients

%% AERODYNAMIC DRAG - parameters

density = 1.225;           % [kg/m3] density of air at sea level
A = 2.34;                  % [m2] frontal area
C_D = 0.24;                % [-] drag coefficient
fd = 0.5*density*A*C_D;    % drag force ingredients

%% ROLLING RESISTANCE - parameters

mass = 2108;               % [kgs] total mass of the car
g = 9.81;                  % [m/s2] gravitational constant
C_r = 0.02;                % [-] rolling resistance
fr = mass*g*C_r;           % rolling resistance force ingredients

%% SIMULATION PERFORMANCE
time = 16;                 % [s] simulation time
step = 0.01;               % [s] time step

sim('tesla_model')

%% RESULTS

% Voltage
subplot(1,3,1)
plot(volt.time, volt.data)
title("Voltage supplied to battery")
xlabel("Time [s]")
ylabel("Voltage [V]")
grid on

% Velocity
subplot(1,3,2)
plot(vel.time, vel.data)
title("Car Velocity")
xlabel("Time [s]")
ylabel("Velocity [km/h]")
grid on

% Acceleration
subplot(1,3,3)
plot(acc.time, acc.data)
title("Car Acceleration")
xlabel("Time [s]")
ylabel("Acceleration [m/s^2]")
grid on