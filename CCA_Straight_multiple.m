clc, clear, close all

% Parameters Initialization
% Angle Converting Parameters
r2d = 180 / pi;          % Radian to Degree [-]
d2r = 1 / r2d;           % Degree to Radian [-]

% Time Step Size
dt = 0.1;               % Time Step Size [s]

% Time
t(1) =  0;                 % Simulation Time [s]

% Waypoint
Wi = [ 0, 0 ]';         % Initial Waypoint Position [m]
Wf = [ 500, 500 ]';     % Final Waypoint Position [m]

% Position and Velocity of UAV
x(1) = 100;               % Initial UAV X Position [m]
y(1) = 0;                 % Initial UAV Y Position [m]
psi(1) = 0 * d2r;         % Initial UAV Heading Angle [rad]

p(:,1) = [ x(1), y(1) ]';   % UAV Position Initialization [m]
va = 20;                    % UAV Velocity [m/s]

% Maximum Lateral Acceleration of UAV
Rmin = 50 ;                % UAV Minimum Turn Radius [m]
umax = va^2 / Rmin ;       % UAV Maximum Lateral Acceleration [m]

% Design Parameters
kappa  =  0.75 ;            % Gain
delta  =  50 ;              % Carrot Distance

%% Path Following Algorithm
N = 5;
leg = cell(1,N);
leg(1) = {'Desired Path'};
figure(1) ;
plot( [ Wi(1), Wf(1) ], [ Wi(2), Wf(2) ], 'r--', 'LineWidth', 2 ) ;
hold on ;

for j = 1:N

delta = 10*j;
% kappa = 1.5*j;
i = 0; % Time Index
while x(i+1) < Wf(1)
    i = i + 1 ;
    
    %--------------------CCA Path Following Algorithm---------------------
    
    % Step 1
    % Distance between initial waypoint and current UAV position, Ru
    Ru = norm(Wi - p(:,i));    
    % Orientation of vector from initial waypoint to final waypoint, theta
    theta = atan2(Wf(2) - Wi(2), Wf(1) - Wi(1));
    
    % Step 2
    % Orientation of vector from initial waypoint to current UAV position, thetau
    theta_u = atan2(p(2,i) - Wi(2), p(1,i) - Wi(1));
    % Difference between theta and theatu, DEL_theta
    DEL_theta = theta - theta_u;
    
    % Step 3
    % Distance between initial waypoint and q, R
    R = sqrt( Ru^2 - (Ru*sin(DEL_theta))^2 );
    
    % Step 4
    % Carrot position, s = ( xt, yt )
    xt = Wi(1) + (R + delta) * cos(theta);
    yt = Wi(2) + (R + delta) * sin(theta);
    
    % Step 5
    % Desired heading angle, psid
    psi_d = atan2(yt - p(2,i), xt - p(1,i));
    % Wrapping up psid
    psi_d = rem(psi_d,2*pi);
    if psi_d < -pi
        psi_d = psi_d + 2*pi;
    elseif psi_d > pi
        psi_d = psi_d-2*pi;
    end
    
    % Step6
    % Guidance command, u
    u(i) = kappa*(psi_d - psi(i))*va;
    % Limit u
    if u(i) > umax
        u(i) = umax;
    elseif u(i) < -umax
        u(i) = - umax;
    end
    %--------------------------------------------------------------------%
    
    %.. UAV Dynamics
    % Dynamic Model of UAV
    dx = va * cos(psi(i));
    dy = va * sin(psi(i));
    dpsi = u(i) / va ;
    
    % UAV State Update
    x(i+1) = x(i) + dx * dt ;
    y(i+1) = y(i) + dy * dt ;
    psi(i+1) = psi(i) + dpsi * dt ;
    
    % UAV Position Vector Update
    p(:,i+1) = [ x(i+1), y(i+1) ]' ;
    
    %.. Time Update
    t(i+1) = t(i) + dt ;
end

plot( x, y, 'LineWidth', 1.2 )
leg{j+1} = strcat('\delta = ', num2str(delta));
% leg{j+1} = strcat('\kappa = ', num2str(kappa));

end

xlabel('X (m)') ;
ylabel('Y (m)') ;
legend(leg)
title(['CCA Straight line,  \kappa = ' num2str(kappa)])
% title(['CCA Straight line,  \delta = ' num2str(delta)])

%% Result Plot

% Trajectory Plot
axis([ 0 500 0 500 ]) ;

% Guidance Command
figure(2) ;
plot( t(1:end-1), u, 'LineWidth', 2 ) ;
xlabel('Time (s)') ;
ylabel('u (m/s^2)') ;
