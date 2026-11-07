% 207924499 & 213804289
% task 4

function compare_analytical_numerical(y_sym, t_sym, y_0, T)

    % analytical solution using dsolve
    ode = diff(y_sym, t_sym) == y_sym * (y_sym - 1);
    condition = y_sym(0) == y_0;
    y_solution = dsolve(ode, condition);
    y_analytical = double(subs(y_solution, t_sym, T));
    
    % numerical solution using ode45
    [~, y_numerical] = ode45(@my_ode, T, y_0);

    % making sure both are column vectors
    y_analytical = y_analytical(:);

    % finding error
    error = abs(y_analytical - y_numerical);

    % plotting analytical and numerical solutions
    figure;
    plot(T, y_analytical, 'b--', 'LineWidth', 2); hold on;
    plot(T, y_numerical, 'r-', 'LineWidth', 2);
    xlabel('Time (t)');
    ylabel('y(t)');
    title('Analytical vs Numerical solution');
    legend('Analytical (dsolve)', 'Numerical (ode45)', 'Location', 'northeast');
    grid on;

    % plotting error between solutions
    figure;
    plot(T, error, 'm-', 'LineWidth', 2);
    xlabel('Time (t)');
    ylabel('Absolute error');
    title('Error between analytical and numerical solutions');
    grid on;

    % ode function
    function dy_dt = my_ode(t, y)
        dy_dt = y * (y - 1);
    end
end