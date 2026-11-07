% 207924499 & 213804289
% task 8

function plot_drug_concentration()

    C_0 = 1; % initial concentration (C at time 0)
    t_half = 3; % time for concentration to cut in half
    C_3 = 0.5; % known concentration after 3 hours

    % calculating decay rate constant
    k = - log(C_3 / C_0) / t_half;

    % calculating concentration after 6 hours
    t_6 = 6;
    C_6 = C_0 * exp(- k * t_6);
    fprintf('Concentration after 6 hours is: %.4f mg/L\n', C_6);

    % creating time values from 0 to 6 hours
    t = linspace(0, 6, 100);

    % calculating concentration values over time
    C = C_0 * exp(-k * t);
   
    % plotting the function
    figure;
    plot(t, C, 'b-', 'LineWidth', 2); hold on;

    % marking specific known points on the graph
    plot(0, C_0, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
    plot(3, C_3, 'go', 'MarkerSize', 8, 'LineWidth', 2);
    plot(6, C_6, 'mo', 'MarkerSize', 8, 'LineWidth', 2);

    % adding labels next to the points
    text(0.1, C_0, 'C(0)', 'Color', 'r', 'FontSize', 12, 'FontWeight', 'bold');
    text(3.1, C_3, 'C(3)', 'Color', 'g', 'FontSize', 12, 'FontWeight', 'bold');
    text(6.1, C_6, 'C(6)', 'Color', 'm', 'FontSize', 12, 'FontWeight', 'bold');

    % adding axis labels, title and legend
    xlabel('זמן (שעות)');
    ylabel('ריכוז התרופה בדם (C(t))');
    title('ריכוז התרופה בדם לאורך זמן');
    legend('C(t)', 'C(0)', 'C(3)', 'C(6)', 'Location', 'northeast');
    grid on;
end