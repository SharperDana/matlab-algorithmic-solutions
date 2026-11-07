% question 2
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289

function [D, E] = maxValues(A, B, C)
    n = 9 + 10; % the maximum digit in the passport number plus ten
    D = zeros(1, n); E = [];

    % error in case the vectors are too short
    if length(A) < n || length(B) < n || length(C) < n
        error('Please input a vector with a length of 19.');
    end
   
    % check the max values, store them in D and the divisible by 3 - in E
    for i = 1 : n
        D(i) = max([A(i), B(i), C(i)]);

        if mod(D(i), 3) == 0
            E = [E, D(i)];
        end
    end
end
