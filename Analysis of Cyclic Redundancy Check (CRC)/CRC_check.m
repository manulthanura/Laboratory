function [data,error] = CRC_check(msg,poly)
[q r] = deconv(msg,poly);
r = abs(r);
for i = 1:length(r)
     a = r(i);
     if (mod(a,2) == 0)
     r(i) = 0;
     else
     r(i) = 1;
     end
end
data = msg;
    if(r == zeros(1,length(r)))
        error = 0;
    else
        error = 1;
    end
end