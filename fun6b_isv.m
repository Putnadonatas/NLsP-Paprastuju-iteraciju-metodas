function [ans] = fun6b_isv(x)
% F-ja leidzia apskaiciuot x^3-x-6=0 x'so israiska antras variantas.
% Panaudojimas:
%                x=1; funkcija6b_isv(x);
%                funkcija6b_isv(10);
if x>6
ans=(1/3)*(1/(x+6))^(2/3);
else ans=NaN;
end
end