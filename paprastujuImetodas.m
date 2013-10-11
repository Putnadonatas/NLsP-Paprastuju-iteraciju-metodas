function [ans] = paprastujuImetodas(func,fun_fi,funfi_isv,x1,x2,E,xa)
% randamas taskas kuris kerta x asi.
%Func_fi isreiksta f-ja;
% Naudojimas:
%   a=10; b=20; E=0.1, xa=13;  paprastujuImetodas(@fi_func,a,b,E,xa);
% paprastujuImetodas(@my_func,10,20,0.01,13);


if nargin<7 
         xa =x1+(x2-x1)*rand(1);             
 end
if nargin<6 
            E=0.01; 
 end
if nargin<5 
            error('permazai ivestu parametru');             
end
f1 = func(x1);
if abs(f1) <10^(-10); saknis = x1; return; end
f2 = func(x2);
if abs(f2) <10^(-10); saknis = x2; return; end
if f1*f2 > 0;
error('Nurodytame intervale (x1,x2) nera funkcijos nulio')
end
%Antras--------------------------
%KONVERGAVIMO SALYGA
l= x1:0.1:x2;
y=funfi_isv(l);
q=abs(max(y));
%paklaida------------------------
pk=abs(x2-x1);
%While ciklas---------------------
q=0.5;
if q <1
n=1;
x(n)=xa;
while pk > E
   x(n+1)=fun_fi(x(n)); 
   pk=((1-q)/q)*abs(x(n+1)-x(n));
   n=n+1;
   if (n>10000)
               disp(['konvergavimo salyga nepatenkinta per', num2str(n), '100000 iteraciju']);
               break;
   end

end
ans=x(n);
else disp('Jusu q>1'); 
ans=NaN;    
end
 
