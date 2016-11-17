function p = multiply( m, n )

p = zeros(1,length(m));
while sum(n) ~= 0
    if n(end) ~= 0
        p = bitadd(p, m);
    end
    m = [m 0];
    n = [0 n(1:end-1)];
end
end


