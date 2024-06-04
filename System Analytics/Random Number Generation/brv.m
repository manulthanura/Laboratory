function brv(n,p)
R = zeros(n,1);
    for k = 1:n
    U=rand(1);
    c=p/(1-p);
    pr=(1-p).^n;
    F=pr;
    i=0;
        while U>=F
            pr=((c*(n-i))/(i+1))*pr;
                F=F+pr;
                i = i+1;
        end
            R(k) = i;
            disp(R(k));
    end
end