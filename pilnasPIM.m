function saknys = pilnasPIM(func,a,b,dx,filter,tol)
% Pusiaukirtos metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%func - f-ja kaip m failas arba anonimine f-ja.
% filter = singuliarumo filtras: 0 = iðjungta (pagal nutylejima), 1 = ijungta.
% tol = paklaida (pagal nutylejima 0.0001).
% dx = zingsnio ilgis kreipiantis i sklaidos metoda (b-a)/n
%Paleidmas:
%saknis = pusiaukirtosmetodas(@f-jos_vardas,x1,x2,filter,tol)
saknusk = 0;
while 1
 [x1,x2] = skaidosmetodas(func,a,b,dx);
 if isnan(x1) 
    disp('Daugiau sprendiniu nera');
    break
 else
   a = x2;
   saknis = paprastujuImetodas(func,x1,x2,dx,xa);
    if ~isnan(saknis)
         saknusk = saknusk + 1;
         saknys(saknusk) = saknis;
end
end
end
x= a:0.1:b;
y=func(x); 
plot(x,y)