n = 10;  % Number of binomial random numbers to generate
p = 0.4; % Probability of success
brv(n,p)

function brv(n,p)
    R = zeros(n,1);  % Pre-allocate space for n random numbers
    for k = 1:n
        U = rand(1);  % Generate a uniform random number between 0 and 1
        c = p / (1 - p);  % Calculate the odds ratio (used in the probability recursion)
        
        % This part initializes the probability of 0 successes (pr(0)).
        % This is the probability of having 0 successes in n trials, i.e., all failures.
        pr = (1 - p) .^ n;  % Initial probability (p(0)) = (1 - p)^n
        
        F = pr;  % The cumulative probability starts with pr(0)
        i = 0;  % Start with 0 successes
        
        % The while loop updates the cumulative distribution function (CDF) until
        % it finds the number of successes 'i' that makes the CDF exceed the random number U.
        while U >= F
            % The formula below computes the probability of i+1 successes using the recursive relationship
            pr = ((c * (n - i)) / (i + 1)) * pr;
            F = F + pr;  % Update the cumulative distribution function (CDF)
            i = i + 1;   % Increment the number of successes
        end
        
        R(k) = i;  % Store the result, which is the number of successes
        disp(R(k));  % Display the result for inspection (optional)
    end
end
