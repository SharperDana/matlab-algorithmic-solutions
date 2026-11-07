% 207924499 & 213804289
% task 5

function analyze_critical_points()

    % defining function and range
    x = linspace(-5, 5, 1000);
    f = @(x) x.^2 + 4 * sin(x);
    y = f(x);

    % plotting the function
    figure;
    plot(x, y, 'b', 'LineWidth', 2);
    hold on;
    grid on;
    xlabel('x');
    ylabel('f(x)');
    title('f(x) = x^2 + 4sin(x)');

    % first and second derivatives
    df = @(x) 2 * x + 4 * cos(x);
    d2f = @(x) 2 - 4 * sin(x);

    % trying to find critical points numerically
    points = [];
    guesses = -5 : 0.5 : 5;
    % finding critical points using fzero and storing them
    for i = 1 : length(guesses)
        try
            root = fzero(df, guesses(i));
            % avoiding duplicates
            if isempty(points) || all(abs(points - root) > 0.01)
                points(end + 1) = root;
            end
        catch
            % skipping if fzero doesn't work at this guess
        end
    end

    % checking type of each critical point
    for i = 1 : length(points)
        x_0 = points(i);
        y_0 = f(x_0);
        second_derivative = d2f(x_0);

        if second_derivative > 0
            plot(x_0, y_0, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'k', 'LineWidth', 1.5, 'DisplayName', 'Minima');
        elseif second_derivative < 0
            plot(x_0, y_0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'LineWidth', 1.5, 'DisplayName', 'Maxima');
        else
            plot(x_0, y_0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k', 'MarkerEdgeColor', 'w', 'LineWidth', 1.5, 'DisplayName', 'Inconclusive');
        end
    end
    legend('Function', 'Minima', 'Maxima');
end