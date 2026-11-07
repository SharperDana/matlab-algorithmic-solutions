% question 4
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289

function findQuadrant(x, y)
    if(x > 0 && y > 0)
        disp('I');
    elseif(x < 0 && y > 0)
        disp('II');
    elseif(x < 0 && y < 0)
        disp('III');
    elseif(x > 0 && y < 0)
        disp('IV');
    else
        disp('The point is on the axis.');
    end
end
