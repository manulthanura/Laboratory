function nrv(n,miu,sigma)
B = zeros(n,1);
for i=1:n
    B(i)=sqrt(2)*sigma*erfinv(2*(rand(1,1))-1)+miu;
    disp(B(i));
end
end