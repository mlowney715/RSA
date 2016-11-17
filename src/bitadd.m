function s = bitadd( a,b )

if length(a) > length(b)
    pad = length(a)-length(b);
    b = [zeros(1, pad) b];
elseif length(a) < length(b)
    pad = length(b)-length(a);
    a = [zeros(1, pad) a];
end

s = zeros(1, length(a));
carry = 0;

for i = length(a):-1:1
    bit = a(i) + b(i) + carry;
    if bit > 1
        s(i) = mod(bit,2);
        carry = 1;
    else
        s(i) = bit;
        carry = 0;
    end
end

if carry > 0
    s = [dec2binarray(carry) s];
end

end