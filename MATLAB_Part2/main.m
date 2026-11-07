clc; clear all;

%% task 1

A = [2 0 1 3;
     1 2 1 1;
     3 0 0 2;
     1 4 2 1];
b = [1;
     2;
     3;
     4];

solve_linear_system(A, b);
pause;

%% task 2

simulate_pendulum();
pause;

%% task 3

analyze_temperature_data();
pause;

%% task 4

syms t_sym y_sym(t_sym)
from_time = 0;
to_time = 10;
T = from_time : 0.01 : to_time;
y_0 = 0.5;

compare_analytical_numerical(y_sym, t_sym, y_0, T);
pause;

%% task 5

analyze_critical_points();
pause;

%% task 6

analyze_student_grades();
pause;

%% task 7

find_root_bisection();
pause;

%% task 8

plot_drug_concentration();
pause;

%% task 9

animate_projectile_motion();
pause;

%% task 10

rotate_matrix_gif();
pause;

%% task 11

write_and_read_text_file();