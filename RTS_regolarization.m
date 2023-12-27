% Rauch Tung Striebel regolarization

% Initialization
C = zeros(4, 4);
xs = zeros(4, size(out.x_now.data, 3));
Ps = zeros(4, 4, size(out.x_now.data, 3));

% For cicle initialization
x = out.x_now.data(:, size(out.x_now.data, 3));
xs(:, size(out.x_now.data, 3)) = x;

for i = (size(out.x_now.data, 3) - 1):-1:1
    P = out.P.data(:,:,i);
    P_new = out.P_new.data(:,:,i);
    F = out.F.data(:,:,i);
    x_now = out.x_now.data(:,i);
    x_new = out.x_new.data(:,i);
    
    C = P*transpose(F)*pinv(P_new);
    x = x_now + C*( x - x_new );
    xs(:,i) = x;
end
