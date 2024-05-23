function mixconmthd(x0, a, c, m, num)
numbers = zeros(1,num);
numbers(1) = mod(a * x0 + c, m);
for i = 2:num
numbers(i) = mod(a * numbers(i-1) + c, m);
end
disp(numbers/m);