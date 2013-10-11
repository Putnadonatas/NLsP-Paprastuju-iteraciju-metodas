function saknys = pilnasPIM(func,fun_fi,funfi_isv,a,b,dx,filter,tol,xa)
% Paprastuju iteraciju metodu surandami visi funkcijos f(x) nuliai intervale (a,b).
% IVEDIMO PARAMETRAI:
%   @func - pradine f-ja.
%   @fun_fi - isreiksta per kazkuri x f-ja.
%   @funfi_isv - isreikstos f-jos isvestine.
%   x1- pradinis intervalo skaicius, x2-galutinis intervalo skaicius.
%   E-epsilonas maksimalus nuokrypis nuo galutinio rez (nebutina ivest)
%   xa- skaicius intervale [x1;x2] (nebutina ivest)
%   filter - singuliarumo filtras: 0 = iðjungta (pagal nutylejima), 1 = ijungta.
%   tol - paklaida (pagal nutylejima 0.0001).
%   dx - zingsnio ilgis kreipiantis i sklaidos metoda (b-a)/n
%Paleidmas:
%saknis = pilnasPIM(func,fun_fi,funfi_isv,a,b,dx,filter,tol,xa)

if nargin<9 
           xa =a+(b-a)*rand(1);            
end
if nargin<8 
        tol=0.01;             
 end
if nargin<7 
            filter=0; 
 end
if nargin<6 
            dx=0.01;
  end
a_pradinis=a;
saknusk = 0;
while 1
 [x1,x2] = skaidosmetodas(func,a,b,dx);
 if isnan(x1) 
    disp('Daugiau sprendiniu nera');
    break
 else
   a = x2;
   saknis = paprastujuImetodas(func,fun_fi,funfi_isv,x1,x2,tol,xa);
    if ~isnan(saknis)
         saknusk = saknusk + 1;
                     if saknis < b
                      saknys(saknusk) = saknis;
                     end
end
end
end
x=a_pradinis:1:b
y = func(x)
plot(x,y)
hold on;
x_saknys = saknis
y_saknys = func(x_saknys)
scatter(x_saknys, y_saknys,'*r');