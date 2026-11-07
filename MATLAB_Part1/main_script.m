%% main script
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289 

clc; clear; close all;

%% 1 combineMatrices

disp('Question 1:');
fprintf('\n')

m = randi([3, 5]); n = randi([3, 5]);
A = randi([-10, 10], m, n);
B = randi([-10, 10], m, n);
disp('Matrix A: '); disp(A);
disp('Matrix B: '); disp(B);
combineMatrices(A, B);

fprintf('\n')
disp('Press any key to proceed.');
fprintf('\n')
pause;

%% 2 maxValues

disp('Question 2:');
fprintf('\n')

A = randi([-100, 100], 1, 19);
B = randi([-100, 100], 1, 19);
C = randi([-100, 100], 1, 19);

[D, E] = maxValues(A, B, C);

disp('Vector A: '); disp(A);
disp('Vector B: '); disp(B);
disp('Vector C: '); disp(C);
disp('Vector D: '); disp(D);
disp('Vector E: '); disp(E);

fprintf('\n')
disp('Press any key to proceed.');
fprintf('\n')
pause;

%% 3 checkPalindrome

disp('Question 3:');
fprintf('\n')

testString1 = 'radar';
testString2 = 'hello';

disp('Testing first string: ');
IsPal1 = checkPalindrome(testString1);

disp('Testing second string: ');
IsPal2 = checkPalindrome(testString2);

fprintf('\n')
disp('Press any key to proceed.');
fprintf('\n')
pause;

%% 4 findQuadrant

disp('Question 4:');
fprintf('\n')

A = [3, 4];  % I
B = [-5, 6]; % II
C = [-7, -8]; % III
D = [4, -3]; % IV
E = [0, 5];  % On the axis

disp('Testing point A: '); findQuadrant(A(1), A(2));
disp('Testing point B: '); findQuadrant(B(1), B(2));
disp('Testing point C: '); findQuadrant(C(1), C(2));
disp('Testing point D: '); findQuadrant(D(1), D(2));
disp('Testing point E: '); findQuadrant(E(1), E(2));

fprintf('\n')
disp('Press any key to proceed.');
fprintf('\n')
pause;

%% 5 pointPlaneDistance

disp('Question 5:');
fprintf('\n')

pointPlaneDistance();

fprintf('\n')
disp('Press any key to proceed.');
fprintf('\n')
pause;

%% 6 fibonacciPrimes

disp('Question 6:');
fprintf('\n')

n = randi([3, 1000]);
fprintf('n = %g\n', n);
fibonacciPrimes(n);
 
fprintf('\n')
disp('Press any key to proceed.');
fprintf('\n')
pause;

%% 7 analyzePolynomial

disp('Question 7:');
fprintf('\n')

analyzePolynomial();

fprintf('\n')
disp('Press any key to proceed.');
fprintf('\n')
pause;

%% 8 pointsAMB

disp('Question 8:');
fprintf('\n')

pointsAMB();

fprintf('\n')
disp('Press any key to proceed.');
fprintf('\n')
pause;

%% 9.A 

disp('Question 9.A:');
fprintf('\n')

recreating_drawing();

fprintf('\n')
disp('Press any key to proceed.');
fprintf('\n')
pause;

%% 9.B RobinHoodRockThrow

disp('Question 9.B:');
fprintf('\n')

RobinHoodRockThrow();