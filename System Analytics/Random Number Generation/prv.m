function prv(lambda,n)
S = zeros(n,1);
    for k = 1:n
    U=rand(1);
    P=exp(-lambda);
    F=P;
    i=0;
        while U>=F
            P = (lambda*P)/(i+1);
            F=F+P;
            i = i+1;
        end
            S(k) = i;
            disp(S(k));
            % plot(S(k))
    end
end