% question 5
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289

function pointPlaneDistance()
    disp('    The Initial Data')
    fprintf('\n')
    
    % input the function
    A = input('Input A: ');
    B = input('Input B: ');
    C = input('Input C: ');
    D = input('Input D: ');
    
    % input the point
    x_0 = input('Input x_0: ');
    y_0 = input('Input y_0: ');
    z_0 = input('Input z_0: ');
    
    fprintf('x_0 = %d, y_0 = %d, z_0 = %d\n', x_0, y_0, z_0);
    fprintf('D = %d\n', D);
    fprintf('A = %d, B = %d, C = %d\n', A, B, C);
    disp('---------------------------------------------------------')
    fprintf('\n', '\n');
    
    % calculating distance
    distance = abs((A * x_0 + B * y_0 + C * z_0 + D) / sqrt(A^2 + B^2 + C^2));
    fprintf('               The Answer \n The distance of the point to the plane = ');
    disp(distance)

    % creating a grid for the plane
    [x, y] = meshgrid(-10 : 0.5 : 10); 

    % calculating z
    if C ~= 0
        z = (-A * x - B * y - D) / C;
    else
        z = zeros(size(x)); % flat plane if C = 0
    end

    % calculating the point's position on the plane
    t = -(A * x_0 + B * y_0 + C * z_0 + D) / (A^2 + B^2 + C^2);
    x_proj = x_0 + A * t;
    y_proj = y_0 + B * t;
    z_proj = z_0 + C * t;

    % plotting the plane
    figure; hold on;
    surf(x, y, z, 'EdgeColor', 'none', 'DisplayName', 'Plane');
    colormap cool; colorbar;
    xlabel('x'); ylabel('y'); zlabel('z');
    title('Graph of the Plane and the Projected Point');
    grid on; axis equal; view(3);

    % plotting the given point
    plot3(x_0, y_0, z_0, 'ro', 'MarkerSize', 4, 'MarkerFaceColor', 'r', 'DisplayName', 'Given Point'); 

    % plotting the point's projection (shadow) on the plane
    plot3(x_proj, y_proj, z_proj, 'bo', 'MarkerSize', 4, 'MarkerFaceColor', 'b', 'DisplayName', 'Projected Point');

    % plotting the line between the original point and its projection
    plot3([x_0, x_proj], [y_0, y_proj], [z_0, z_proj], 'k', 'LineWidth', 2, 'DisplayName', 'Normal to the plane');

    legend;
    hold off;
end