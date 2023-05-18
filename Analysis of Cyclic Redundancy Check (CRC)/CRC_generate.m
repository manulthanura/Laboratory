function codeword = CRC_generate(msg,poly)
[M N] = size(poly);
msg_0 = [msg zeros(1,(N-1))];
[q r] = deconv(msg_0,poly);
r = abs(r); % Manul Thanura - 21UG0619
for i = 1:length(r)
    a = r(i);
    if (mod(a,2) == 0)
        r(i) = 0;
    else
        r(i) = 1;
    end
end
crc = r(length(msg)+1:end);
codeword = bitor(msg_0,r);
end