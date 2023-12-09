function draw_sys(xc, theta, dim)
% Function used to draw the system in a specific configuration 
% xc and theta are the two Lagrangian variable used to describe the system
% dim is defined in init_param.m


% Check if the kart position is possible
if xc > dim.xmax
    error("Xc exceeded maximum value");
elseif xc < dim.xmin
    error("Xc exceeded minimum value");
end


hold on
title("Pendulum motion");
axis equal
grid on

% Graph boundary evaluation

if dim.L1 >= dim.L2
    axis ([dim.xmin-2*dim.L1-1 dim.xmax+2*dim.L1+1 -2*dim.L1-1 2*dim.L1+1]);
else 
    axis ([dim.xmin-2*dim.L2-1 dim.xmax+2*dim.L2+1 -2*dim.L2-1 2*dim.L2+1]);
end

% Draw rail
plot([dim.xmin, dim.xmax], [0, 0], '-b');
plot([dim.xmin, dim.xmin], [1, -1], '-b');
plot([dim.xmax, dim.xmax], [1, -1], '-b');

% Define cart
kart = [xc-dim.b/2, -dim.h/2, dim.b, dim.h];

% Draw kart
rectangle('Position', kart, 'EdgeColor', 'k', 'LineWidth', 2)

% Penulum position 
P_end1 = [xc + 2*dim.L1*sin(theta), 2*dim.L1*cos(theta)];
P_end2 = [xc - 2*dim.L2*sin(theta), -2*dim.L2*cos(theta)];

% Draw pendulum
plot([xc, P_end1(1)], [0, P_end1(2)], '-k', 'LineWidth',2);
plot([xc, P_end2(1)], [0, P_end2(2)], '-k', 'LineWidth',2);

% Mass position
P_mass = [xc - dim.Lp*sin(theta), -dim.Lp*cos(theta)];

% Draw mass
plot(P_mass(1), P_mass(2), 'ko', 'LineWidth',3);

hold off

end

