function [x1,x2] = skaidosmetodas(func,a,b,dx)
% Intervalo skaidos metodu surandamas intervalas (x1, x2), kuriame yra ma?iausias
%funkcijos nulis (ma?iausia lygties f(x) = 0 ?aknis)
% NAUDOJIMAS: [x1,x2] = skaidosmetodas(@myfunc,a,b,dx)
% IVEDIMO PARAMETRAI:
% func = priskiriama M-failo myfunc.m funkcija (arba anonimine funkcija).
% a,b = pirminio intervalo prad?ia ir pabaiga.
% dx = ?ingsnio ilgis: (b-a)/n.
% I?VEDIMO PARAMETRAI:
% x1,x2 = ma?iausio funkcijos nulio ribos: intervalas (x1,x2), kuris yra poaibis (a,b);
% priskiriame NaN jeigu nebuvo surastas toks intervalas
if nargin<4
      dx=0.01;
end
if a > b; x1 = NaN; x2 = NaN; return; end
x1 = a; f1 = func(x1);
x2 = a + dx; f2 = func(x2);
while f1*f2 > 0.0
    if x1 >= b
        x1 = NaN; x2 = NaN;
        return
    end
    x1 = x2; f1 = f2;
    x2 = x1 + dx; f2 = func(x2);
end