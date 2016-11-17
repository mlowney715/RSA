function output = RSAH( B1, B2 )
output = RSA(xor(RSA(B1),B2));
end