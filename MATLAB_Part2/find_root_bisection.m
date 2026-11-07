% 207924499 & 213804289
% task 7

function find_root_bisection()

    % defining the function
    f = @(x) x.^3 - 2*x.^2 + 4*x - 8;

    % initial values to begin the bisection
    a = 1;
    b = 3;

    % wanted accuracy of the result
    accuracy = 0.001;

    % bisection method loop
    while (b - a) / 2 > accuracy
        c = (a + b) / 2; % midpoint
        if f(c) == 0
            break; % root has been found
        elseif f(a) * f(c) < 0
            b = c; % root is in [a, c]
        else
            a = c; % root is in [c, b]
        end
    end

    % final root approximation
    root = (a + b) / 2;

    % plotting the function
    x = linspace(1, 3, 500);
    y = f(x);
    figure;
    plot(x, y, 'b-', 'LineWidth', 2);
    hold on;

    % showing the root point on the graph
    plot(root, f(root), 'ro', 'MarkerSize', 10, 'LineWidth', 2); % root point
    
    % adding labels, title and legend
    xlabel('x');
    ylabel('f(x)');
    title('Graph of f(x) = x^3 - 2x^2 + 4x - 8');
    legend('f(x)', 'Root', 'Location', 'northwest');
    grid on;

    % printing the result
    fprintf('Approximated root is: %.4f\n', root);
end