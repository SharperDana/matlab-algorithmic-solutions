% question 7
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289

function analyzePolynomial()
    a = 2; b = 9;

    % solving the polynomial
    solutions = roots([1, 3, a, b]);
    disp('Solution for f(x) = 0: ')
    disp(solutions);

    % all the solutions with no imaginary part
    disp('Real solutions: ')
    for i = 1 : length(solutions)
        if imag(solutions(i)) == 0
            disp(solutions(i))
        end
    end

    c = 0; d = 9;
    f = @(x) x.^3 + 2 * x.^2 + a * x + b;
    f_values = [f(c), f(d)];
    f_points = [c, d];
    n = 10000;
    x = linspace(c, d, n);
    d_x = x(2) - x(1);
    p_x = [1, 3, a, b];
    approx_integral = 0;
    
    y_abs_min = Inf; y_abs_max = -Inf;
    
    % polynomial
    p_values = p_x(1) * x.^3 + p_x(2) * x.^2 + p_x(3) * x.^1 + p_x(4);
    
    % calculating approximated integral using trapezoidal rule
    for i = 2 : n
        p1 = p_values(i - 1); p2 = p_values(i);
        approx_integral = approx_integral + ((p1 + p2) / 2) * d_x;
    
        if(p2 < y_abs_min)
            y_abs_min = p2; 
            x_abs_min = x(i);
        elseif(p2 > y_abs_max)
            y_abs_max = p2; 
            x_abs_max = x(i);
        end
    end
    abs_min = [x_abs_min, y_abs_min]; % absolute minimum
    abs_max = [x_abs_max, y_abs_max]; % absolute maximum
    
    disp('Approximated integral result: ')
    disp(approx_integral);
    
    % calculating the accurate integral using 'integral' command
    fun = @(x) p_x(1) * x.^3 + p_x(2) * x.^2 + p_x(3) * x.^1 + p_x(4);
    acc_integral = integral(fun, c, d);
    
    disp('Accurate integral result: ')
    disp(acc_integral);
    
    % calculating the error
    disp('Error = ');
    disp(abs(acc_integral - approx_integral));
    
    % finding critical points with f'(x) = 0
    c_points = roots([3, 4, a]);
    real_c_points = c_points(imag(c_points) == 0); 
    valid_c_points = real_c_points(real_c_points >= c & real_c_points <= d);
    test_x = linspace(c, d, n);
    test_y = f(test_x);
    [min_check, min_index] = min(test_y);
    [max_check, max_index] = max(test_y);
    x_min_value = test_x(min_index);
    x_max_value = test_x(max_index);
    
    if ~isempty(valid_c_points)
        f_c = f(valid_c_points);
        [min_c_value, min_c_index] = min(f_c);
        if min_c_value < min_check
            min_check = min_c_value;
            x_min_value = valid_c_points(min_c_index);
        end
        [max_c_value, max_c_index] = max(f_c);
        if max_c_value > max_check
            max_check = max_c_value;
            x_max_value = valid_c_points(max_c_index);
        end
    end
    if min(f_values) < min_check
        [min_check, min_index] = min(f_values);
        x_min_value = f_points(min_index);
    end
    if max(f_values) > max_check
        [max_check, max_index] = max(f_values);
        x_max_value = f_points(max_index);
    end
    
    % (x, f(x))
    local_min = [x_min_value, min_check]; % local minimum
    local_max = [x_max_value, max_check]; % local maximum
    
    disp('Minimal absolute point: ');
    fprintf('(%0.4f, %0.4f)\n', abs_min(1), abs_min(2));
    
    disp('Maximal absolute point: ');
    fprintf('(%0.4f, %0.4f)\n', abs_max(1), abs_max(2));
    
    disp('Minimal local point: ');
    fprintf('(%0.4f, %0.4f)\n', local_min(1), local_min(2));
    
    disp('Maximal local point: ');
    fprintf('(%0.4f, %0.4f)\n', local_max(1), local_max(2));
end