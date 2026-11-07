% question 6
% written by Dana Sharper and Leonid Kuprian
% ID     =    207924499    &    213804289

function fibonacciPrimes(n)
    fib1 = 1; fib2 = 1;
    primes = [];
    for i = 1 : n
        fib3 = fib1 + fib2;
        fib1 = fib2;
        fib2 = fib3;
        if (isprime(fib3) && fib3 <= n)
            primes = [primes, fib3];
        elseif (fib3 > n)
            break;
        end
    end
    fprintf('%g ', primes);
    fprintf('\n')
end