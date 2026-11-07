% 207924499 & 213804289
% task 1

function solve_linear_system(A, b)

    % getting the sizes of the matrix and vector
    [rows_a, colls_a] = size(A);
    [rows_b, colls_b] = size(b);

    % checking if the input is valid
    if ~(rows_a == 4 && colls_a == 4 && rows_b == 4 && colls_b == 1)
        error('A has to be 4x4 and b should be 4x1. Try again.');
    end

    % checking if matrix A is invertible by calculating its determinant
    det_A = det(A);

    if det_A == 0
        disp('Matrix A is not invertible.');
    else
        % task a: calculating and displaying the inverse of A
        inv_A = inv(A);
        disp('Inverse of A: ');
        disp(inv_A);

        % task b: solving the system A * x = b
        x = A \ b;
        disp('Solution to A * x = b: ');
        disp(x);
    end
end