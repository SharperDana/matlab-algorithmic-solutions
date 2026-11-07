% 207924499 & 213804289
% task 3

function analyze_temperature_data()

    % reading the table
    data = readtable('data.csv');
    data.Properties.VariableNames = ["time", "temperature"];
    time = data.time;
    temperature = data.temperature;

    % plotting temperature vs time
    figure;
    plot(time, temperature, '-o', 'LineWidth', 2);
    xlabel('Time (seconds)');
    ylabel('Temperature (°C)');
    title('Temperature as a function of time');
    grid on;

    % finding the max temperature and when it happened
    [maximum_temperature, maximum_index] = max(temperature);
    maximum_time = time(maximum_index);
    fprintf('Maximum temperature = %.1f°C at t = %d seconds\n', maximum_temperature, maximum_time);

    % finding the average temperature
    average_temperature = mean(temperature);
    fprintf('Average temperature = %.1f°C\n', average_temperature);
end