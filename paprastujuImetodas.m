function [ans] = paprastujuImetodas(func,func_fi,x1,x2,E,xa)
% randamas taskas kuris kerta x asi.
%Func_fi isreiksta f-ja;
% Naudojimas:
%   a=10; b=20; E=0.1, xa=13;  paprastujuImetodas(@fi_func,a,b,E,xa);
% paprastujuImetodas(@my_func,10,20,0.01,13);


if nargin<6 
         xa =x1+(x2-x1)*rand(1);             
 end
if nargin<5 
            E=0.01; 
 end
if nargin<4 
            error('permazai ivestu parametru');             
  end
 
q=0.5;
 f1 = func(x1);
if abs(f1) <10^(-10); saknis = x1; return; end
f2 = func(x2);
if abs(f2) <10^(-10); saknis = x2; return; end
if f1*f2 > 0;
error('Nurodytame intervale (x1,x2) nera funkcijos nulio')
end


%Antras--------------------------
%konvergavimo salyga



%paklaida------------------------
pk=abs(x2-x1);
%While ciklas---------------------
n=1;
x(n)=xa;
while pk > E
   x(n+1)=func_fi(x(n)); 
   pk=((1-q)/q)*abs(x(n+1)-x(n));
   n=n+1;
   if (n>10000)
               disp(['konvergavimo salyga nepatenkinta per', num2str(n), '100000 iteraciju']);
               break;
   end
end
 ans=x(n);
