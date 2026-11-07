% question 1
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289

function C = combineMatrices(A, B)
    [m, n] = size(A);
    C = zeros(m, n);
    for i = 1 : m
        for j = 1 : n
            if(A(i, j) * B(i, j) > 0) % if the elements have the same sign
                C(i, j) = A(i, j) * B(i, j); % then – multiplication
            else
                C(i, j) = A(i, j) + B(i, j); % otherwise – addition
            end
        end
    end
    disp('Matrix C: '); disp(C);
end