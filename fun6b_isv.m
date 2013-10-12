function [ans] = fun6b_isv(x)
%F-ja leidzia apskaiciuot y reiksme fi f-jos isvestines, 
%kai x zinomas, o fi f-ja yra y=(x+6)^(1/3)   
% fi fujos isvestine antras variantas.
% Panaudojimas:
%                x=1; funkcija6b_isv(x);
%                funkcija6b_isv(10);
if x>6
ans=(3*(x+6)).^(-2/3);
else ans=0;
end
end