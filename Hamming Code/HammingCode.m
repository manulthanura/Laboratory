
% Date: 2023-05-19
% Description : Hamming Code

n = 7;
k = 4;
A = [ 1 1 1;1 1 0;1 0 1;0 1 1];
G = [eye(k) A]
H = [A' eye(n-k)]
msg = [0 0 1 1] % 4 bit message
code = mod(msg*G,2)
code(n+1-2) = ~code(n+1-2);
recd = code
syndrome = mod(recd*H',2)
find = 0;
for ii = 1:n
    if ~find
        errvect = zeros(1,n);
        errvect(ii) = 1;
        search = mod(errvect*H',2);
        if search == syndrome
            find = 1;
            index = ii;
        end
    end
end
disp(['Position of error in codeword=',num2str(n+1-index)]);
correctedcode = recd;
correctedcode(index) = mod(recd(index)+1,2)
msg_decoded = correctedcode;
msg_decoded = msg_decoded(1:4)