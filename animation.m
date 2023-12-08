%% Test animation

for i = 0:0.1:2*pi
    cla;
    draw_sys(2, i, dim);
    drawnow;
end