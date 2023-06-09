
% Date: 2023-05-19
% Description : Hamming Code

n = 7; % n = 2^m-1
k = 4;  % k = n-m
A = [ 1 1 1;1 1 0;1 0 1;0 1 1]; % parity check matrix
G = [eye(k) A] % generator matrix
H = [A' eye(n-k)] % parity check matrix
msg = [0 0 1 1] % 4 bit message
code = mod(msg*G,2) % 7 bit codeword
code(n+1-2) = ~code(n+1-2); % error in 2nd bit
recd = code % received codeword
syndrome = mod(recd*H',2) % syndrome
find = 0; % find = 1 if error is found
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