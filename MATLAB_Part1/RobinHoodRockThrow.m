% question 9.B
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289

function RobinHoodRockThrow()

    g = 9.81; % gravity (m/s^2)
    
    fprintf('Set up the throw:\n\n');
    initial_speed = input('Initial stone speed (m/s): ');
    angle_deg = input('Launch angle (degrees): ');
    angle_rad = deg2rad(angle_deg);
    distance_Robin_to_wall = input('Distance from Robin Hood to the wall (m): '); % 20  
    wall_thickness = input('Wall thickness (m): ');                               % 2
    distance_wall_to_tower = input('Distance from the wall to the tower (m): ');  % 30
    tower_thickness = input('Tower thickness (m): ');                             % 10

    fprintf('\nArrow slit details:\n\n');
    slit_bottom = input('Slit bottom above ground (m): ');                        % 10
    slit_height = input('Slit height (m): ');                                     % 5
    slit_top = slit_bottom + slit_height;                                         % 15

    fprintf('\nDefine the window in the tower:\n\n');
    tower_window_bottom = input('Tower window bottom above ground (m): ');        % 13
    tower_window_height = input('Tower window height (m): ');                     % 5
    tower_window_top = tower_window_bottom + tower_window_height;                 % 18
    
    % x(t) = initial_speed * cos(angle_rad) * t
    % y(t) = initial_speed * sin(angle_rad) * t - 0.5 * g * t^2
    
    time_total = (2 * initial_speed * sin(angle_rad)) / g; % time until the stone lands (y = 0)
    time_path = linspace(0, time_total, 200);
    x_path = initial_speed * cos(angle_rad) * time_path;
    y_path = initial_speed * sin(angle_rad) * time_path - 0.5 * g * time_path.^2;
    max_height = (initial_speed^2 * sin(angle_rad)^2) / (2 * g); % y_max
    max_range  = (initial_speed^2 * sin(2 * angle_rad)) / g; % x_max

    % stone’s height at front of the wall (x = distance_Robin_to_wall)
    % x(t) = initial_speed * cos(angle_rad) * t => t(wall) = x(wall) / (initial_speed * cos(angle_rad))
    time_wall_front = distance_Robin_to_wall / (initial_speed * cos(angle_rad));
    if 0 <= time_wall_front && time_wall_front <= time_total
        y_wall_front = initial_speed * sin(angle_rad) * time_wall_front - 0.5 * g * time_wall_front^2;
    else
        y_wall_front = -Inf;  % out of range
    end
    
    % check if the stone enters the slit
    enters_slit = (y_wall_front >= slit_bottom && y_wall_front <= slit_top && y_wall_front >= 0);

    % if it’s outside given vertical range but still above ground => it hits the wall
    hits_wall = (y_wall_front >= 0) && ~enters_slit;
    
    % stone’s height at back of the wall to see if it fully passes the wall
    % x_wall_back = distance_Robin_to_wall + wall_thickness
    time_wall_back = (distance_Robin_to_wall + wall_thickness) / (initial_speed * cos(angle_rad));
    if time_total >= time_wall_back && time_wall_back >= 0
        y_wall_back = initial_speed * sin(angle_rad) * time_wall_back - 0.5 * g * time_wall_back^2;
    else
        y_wall_back = -Inf;
    end
    
    % check if the stone pases the slit
    passes_slit = (y_wall_back >= slit_bottom && y_wall_back <= slit_top && y_wall_back >= 0);

    % if it enters the slit at the front, but doesn't line up with the slit at the back,
    % it means the stone hits somewhere inside the thickness of the wall
    passes_wall_totally = (enters_slit && passes_slit);
    hits_wall_inside = (enters_slit && ~passes_slit);

    % if the stone does hit the wall, check when it happens
    time_hits_wall = [];
    if hits_wall % exactly at the front
        time_hits_wall = time_wall_front;
    elseif hits_wall_inside
        time_hits_wall = time_wall_back;
    end

    % tower check (only in case if the stone passes the wall)
    x_tower_front = distance_Robin_to_wall + distance_wall_to_tower;
    time_tower_front = x_tower_front / (initial_speed * cos(angle_rad));
    y_tower_front = -Inf;             % set default, fill later
    hits_tower_below_window = false;  % set default
    passes_above_window = false;      % set default

    if passes_wall_totally && time_total >= time_tower_front && time_tower_front > 0
        y_tower_front = initial_speed * sin(angle_rad) * time_tower_front - 0.5 * g * time_tower_front^2;
        if (tower_window_top >= y_tower_front && y_tower_front >= tower_window_bottom)
            % goes through the window range
        elseif y_tower_front > tower_window_top
            passes_above_window = true;
        elseif y_tower_front >= 0
            hits_tower_below_window = true;
        end
    end

    % if the stone does hit the wall => cut the path
    if ~isempty(time_hits_wall)
        time_hit_total = linspace(0, time_hits_wall, 100);
        x_hit = initial_speed * cos(angle_rad) * time_hit_total;
        y_hit = initial_speed * sin(angle_rad) * time_hit_total - 0.5 * g * time_hit_total.^2;
        x_plot = x_hit; y_plot = y_hit;
    else
    % doesn't "meet" the wall => full path
        x_plot = x_path; y_plot = y_path;
    end

    % printing the results
    fprintf('Results:\n');
    fprintf('Max height (theoretical) = %.2f m\n', max_height);
    fprintf('Max range (theoretical)  = %.2f m\n', max_range);

    if hits_wall
        fprintf('Stone hits the *front* of the wall at x = %.2f, y = %.2f.\n', distance_Robin_to_wall, y_wall_front);
    elseif hits_wall_inside
        fprintf('Stone enters the slit at the front but hits *inside* the wall at x = %.2f.\n', distance_Robin_to_wall + wall_thickness);
    elseif ~enters_slit && y_wall_front < 0
        fprintf('Stone does not reach the wall above the ground.\n');
    else
        fprintf('Stone passes through the slit in the wall!\n');
        
        % checking tower results
        if passes_wall_totally && time_total > time_tower_front && time_tower_front > 0
            fprintf('At the distance of x = %.2f, the stone reaches the tower at the height of y = %.2f.\n', x_tower_front, y_tower_front);
            if (y_tower_front >= tower_window_bottom && tower_window_top >= y_tower_front)
                fprintf('Within its window range [%.2f, %.2f].\n', tower_window_bottom, tower_window_top);
                fprintf('The stone makes it through!\n');
            elseif passes_above_window
                fprintf('It is above the top of the window (%.2f), possibly over the tower.\n', tower_window_top);
            elseif hits_tower_below_window
                fprintf('It hits the tower under the window (%.2f).\n', tower_window_bottom);
            else
                fprintf('It may have missed or gone around the tower.\n');
            end
        else
            fprintf('It is either out of range or never reaches the tower.\n');
        end
    end

    % adjusting the plot title depending on the result
    if hits_wall
        plot_title = 'The stone hit the wall';
    elseif hits_wall_inside
        plot_title = 'The stone entered the slit but hit inside the wall';
    elseif passes_wall_totally
        if (y_tower_front >= tower_window_bottom && y_tower_front <= tower_window_top)
            plot_title = 'The stone went through the window!';
        elseif passes_above_window
            plot_title = 'The stone passed above the window';
        elseif hits_tower_below_window
            plot_title = 'The stone hit the tower below the window';
        else
            plot_title = 'The stone passed the wall but missed the tower';
        end
    else
        plot_title = 'The stone did not reach the wall';
    end

    % plotting trajectory, wall (with slit), and tower
    figure('Name', 'Stone Through a Wall Slit', 'NumberTitle', 'off');
    hold on; grid on;
    title(plot_title);
    plot(x_plot, y_plot, 'k-', 'LineWidth', 2, 'DisplayName', 'Stone path');

    % drawing the wall in two rectangles (one below and one above the slit)
    x_wall_front = distance_Robin_to_wall;
    x_wall_back  = distance_Robin_to_wall + wall_thickness;
    wall_top = max(slit_top + 5, 1.2 * slit_top);
    
    % bottom part of the wall (from y = 0 to slit_bottom)
    x_lower_wall = [x_wall_front x_wall_back x_wall_back x_wall_front];
    y_lower_wall = [0 0 slit_bottom slit_bottom];
    patch(x_lower_wall, y_lower_wall, 'r', 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'DisplayName', 'Wall (Lower part)');
    
    % top part of the wall (from y=slitTop to topOfWall)
    x_upper_wall = [x_wall_front x_wall_back x_wall_back x_wall_front];
    y_upper_wall = [slit_top slit_top wall_top wall_top];
    patch(x_upper_wall, y_upper_wall, 'r', 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'DisplayName', 'Wall (Upper part)');
    
    % drawing the tower in two rectangles (under and above the window)
    x_tower_front = distance_Robin_to_wall + distance_wall_to_tower;
    x_tower_back  = x_tower_front + tower_thickness;
    tower_top = max(tower_window_top + 5, 1.2 * tower_window_top);

    % bottom part of the tower (from y = 0 to tower_window_bottom)
    x_lower_tower = [x_tower_front x_tower_back x_tower_back x_tower_front];
    y_lower_tower = [0 0 tower_window_bottom tower_window_bottom];
    patch(x_lower_tower, y_lower_tower, 'b', 'FaceAlpha', 0.3, 'EdgeColor','none', 'DisplayName','Tower (Below Window)');
    
    % top part of the tower (from y = tower_window_top to tower_top)
    x_upper_tower = [x_tower_front x_tower_back x_tower_back x_tower_front];
    y_upper_tower = [tower_window_top tower_window_top tower_top tower_top];
    patch(x_upper_tower, y_upper_tower, 'b', 'FaceAlpha', 0.3, 'EdgeColor','none', 'DisplayName','Tower (Above Window)');

    xlabel('Distance (m)'); ylabel('Height (m)');
    legend('Location', 'best');
    
    axis([0, max_range, 0, max(max_height, tower_window_top + 5)]);
    hold off;
end
