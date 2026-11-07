% 207924499 & 213804289
% task 9

function animate_projectile_motion()

    % initial data
    v_0 = 20; % velocity
    theta = pi / 4; % angle
    gravity = 9.81; % gravity
    time = linspace(0, 2 * v_0 * sin(theta) / gravity, 150); % time vector

    % horizontal and vertical positions over time
    x = v_0 * cos(theta) * time;
    y = -0.5 * gravity * time.^2 + v_0 * sin(theta) * time;

    % setting up the figure once
    figure;
    axis([0 max(x) 0 max(y) + 1]);
    grid on;
    xlabel('מרחק אופקי (x)');
    ylabel('גובה (y)');
    title('תנועת כדור - מסלול פרבולי');
    hold on;

    % initial path and ball
    path_line = plot(x(1), y(1), 'b-', 'LineWidth', 2);
    ball = plot(x(1), y(1), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

    % animation loop
    for i = 2 : length(time)
        % update path and ball position
        set(path_line, 'XData', x(1 : i), 'YData', y(1 : i));

        if i < length(time)
            % show ball while it's in the air
            set(ball, 'XData', x(i), 'YData', y(i), 'Visible', 'on');
        else
            % hide ball the moment it lands
            set(ball, 'Visible', 'off');
        end

        drawnow;
        pause(0.01);
    end
end