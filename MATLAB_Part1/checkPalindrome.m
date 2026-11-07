% question 3
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289

function IsPal = checkPalindrome(string)
    n = length(string);
    for i = 1 : n
        if(string(i) == string(n - i + 1))
            IsPal = 1;
        else
            IsPal = 0;
            break;
        end
    end
    if(IsPal == 1)
        disp('Palindrome!')
    else
        disp('Not a palindrome...')
    end
end