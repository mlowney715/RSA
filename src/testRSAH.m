function testRSAH
size = 4;
B1 = dec2binarray(2, size);
B2 = dec2binarray(5, size);
C1 = dec2binarray(7, size);
p = dec2binarray(5, size);
q = dec2binarray(11, size);
e = dec2binarray(9, size);

hB1B2 = RSAH(B1, B2);
end

function output = RSAH( B1, B2 )
output = RSA(xor(RSA(B1),B2));
end