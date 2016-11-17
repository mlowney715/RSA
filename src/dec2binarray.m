function bin = dec2binarray(dec, size)
bin = dec2bin(dec);
bin = bin - '0';
if nargin > 1
    pad = size - length(bin);
    if pad <= 0
        return
    else
        bin = [zeros(1, pad) bin];
    end
end