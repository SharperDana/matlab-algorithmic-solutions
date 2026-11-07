% question 8
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289

function pointsAMB()
    A_x = 6; A_y = 5;
    B_x = 0;

    % calculating coordinates of point M
    M_x = (A_x - B_x) / 2;
    M_y = (3 + 5 * M_x) / 2;

    % calculating coordinates of point B
    B_y = 2 * M_y - A_y;
    disp('The coordinates of the point B are: ');
    disp([B_x, B_y]);

    % plotting line AB
    figure;
    plot([A_x B_x], [A_y B_y], 'b-', 'LineWidth', 2);
    hold on;

    % plotting line 2y - 5x = 3
    x = linspace(-1, 7);
    y = (5 * x + 3) / 2;
    plot(x, y, 'r--', 'LineWidth', 2);

    % plotting points A, B, and M
    plot(A_x, A_y, 'go', 'MarkerSize', 6, 'MarkerFaceColor', 'g');
    plot(B_x, B_y, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
    plot(M_x, M_y, 'ko', 'MarkerSize', 6, 'MarkerFaceColor', 'k');

    % labels for points A, B, and M
    text(A_x, A_y + 1, 'A(6,5)', 'FontSize', 10, 'Color', 'g');
    text(B_x, B_y + 1, sprintf('B(0,%g)', B_y), 'FontSize', 10, 'Color', 'r');
    text(M_x + 0.5, M_y + 0.5, sprintf('M(%g,%g)', M_x, M_y), 'FontSize', 10, 'Color', 'k');

    xlabel('X-axis'); ylabel('Y-axis');
    title('Plot of line AB and 2y – 5x = 3: ');
    legend('Line AB', '2y - 5x = 3', 'Point A', 'Point B', 'Point M', 'Location', 'best');


    % calculating the area under AB
    area = (B_y + A_y) * (A_x - B_x) / 2;
    disp('Area under the line AB: ');
    disp(area);

    grid on;
    hold off;
end