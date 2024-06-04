function erv(n)
A = zeros(n,1);
for i=1:n
    U=rand(1);
    A(i)=-log(1-U);
    disp(A(i));
end
end