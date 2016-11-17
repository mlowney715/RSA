function C = RSA( varargin )
nargs = length(varargin);

size = 4;
M = dec2binarray(2);
p = dec2binarray(5);
q = dec2binarray(11);
e = dec2binarray(9);
d = dec2binarray(9);
debug = true;

if nargs > 0
    M = varargin(1); end
if nargs > 1
    p = varargin(2); end
if nargs > 2
    q = varargin(3); end
if nargs > 3
    debug = varargin(4); end

n = multiply(p, q);
if debug == true
    disp(['Compute n = pq: ' num2str(binarray2dec(n))])
end

z = multiply(dec2binarray(binarray2dec(p)-1), ...
    dec2binarray(binarray2dec(q)-1));
if debug == true
    disp(['Compute z = (p-1)(q-1): ' num2str(binarray2dec(z))])
end

% d = dec2binarray(mod(binarray2dec(1/e),binarray2dec(z)));
% if debug == true
%     disp(['Compute d, such that ed-1 is exactly divisible: ' num2str(d)]);
%     disp(['Public Key: (' num2str(n) ',' num2str(e) ')']);
%     disp(['Private Key: (' num2str(n) ',' num2str(d) ')']);
% end

M_e = M;
for i = 2:binarray2dec(e)
    M_e = multiply(M_e,M);
end

mod_n = dec2binarray(binarray2dec(n)-1);
if length(mod_n) < length(M_e)
    pad = length(M_e)-length(mod_n);
    mod_n = [zeros(1, pad) mod_n];
end

C = bitand(M_e, mod_n);
if debug == true
    disp(['Encrypt M => ' num2str(binarray2dec(M)) '^' num2str(binarray2dec(e)) ' mod ' num2str(binarray2dec(n)) ': ' ...
        num2str(binarray2dec(C))])
end

C_d = C;
for i = 2:binarray2dec(d)
    C_d = multiply(C_d,M);
end

mod_n = dec2binarray(binarray2dec(n)-1);
if length(mod_n) < length(C_d)
    pad = length(C_d)-length(mod_n);
    mod_n = [zeros(1, pad) mod_n];
end

D = bitand(C_d, mod_n);
if debug == true
    disp(['Decrypt C => ' num2str(binarray2dec(C)) '^' num2str(binarray2dec(d)) ' mod ' num2str(binarray2dec(n)) ': ' ...
        num2str(binarray2dec(D))])
end

end
