% 207924499 & 213804289
% task 2

function simulate_pendulum()

    % parameters and initial conditions
    g = 9.8; % gravity
    L = 1.0; % pendulum length
    theta_0 = pi / 4; % initial angle
    omega_0 = 0; % initial angular velocity
    y_0 = [theta_0; omega_0]; % y(1) = θ, y(2) = ω
    t_span = [0, 10]; % time interval from 0 to 10 seconds

    % the system: dθ/dt = ω, dω/dt = −(g/L)·sin(θ)
    pendulum_ode = @(t, y) [y(2); - (g / L) * sin(y(1))];

    % solving the system using ode45
    [t, y] = ode45(pendulum_ode, t_span, y_0);
    theta = y(:, 1);   % θ(t) angle over time
    omega = y(:, 2);   % θ'(t) angular velocity over time

    % plotting θ(t) and ω(t)
    figure;
    subplot(2, 1, 1);
    plot(t, theta, 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('\theta(t)');
    title('Pendulum angle vs time');
    grid on;

    subplot(2, 1, 2);
    plot(t, omega, 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('Angular velocity \omega(t)');
    title('Pendulum angular velocity vs time');
    grid on;

    % calculating pendulum position from angle
    x =  L * sin(theta); % x-position of the mass
    mass_radius = 0.12; % estimated visual radius of the mass
    y = -L * cos(theta) - mass_radius; % y-position of the mass

    
    % setting up the animation figure
    figure; 
    axis equal;
    axis([-L L -1.12 0.1]);  % moving lower to allow mass to touch x-axis
    hold on;
    plot(0, 0, 'k.', 'MarkerSize', 20); % the point it swings from
    xlabel('מיקום אופקי (מטרים)');
    ylabel('גובה אנכי (מטרים)');
    title('תנועת המטוטלת');
    grid on;
    box on;

    % drawing the initial pendulum
    pendulum_line = plot([0, x(1)], [0, y(1)], 'k-', 'LineWidth', 2);
    pendulum_mass = plot(x(1), y(1), 'o', 'MarkerSize', 15, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k');

    % updating pendulum position frame by frame
    for k = 1 : length(t)
        set(pendulum_line, 'XData', [0, x(k)], 'YData', [0, y(k)]);
        set(pendulum_mass, 'XData', x(k), 'YData', y(k));
        drawnow;
        pause(0.02);  % adjusting the animation speed
    end
end