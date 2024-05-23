function mulcongmthd(x, a, m, num)
numbers = zeros(1,num);
numbers(1) = mod(a * x, m);
for i = 2:num
numbers(i) = mod(a * numbers(i-1), m);
end
disp(numbers/m);