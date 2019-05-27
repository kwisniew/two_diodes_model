function F = myfun(x, mobility, Tem, fis,v)

% v   =-1;%V
S   = 0.1;%cm2
A   = 1.2*10^2; %A/(cm2K2)
% Tem = 200;%K
% fis = 0.2;%eV
Na = 10^15;%cm-3
Nd = 10^18;%cm-3
fi = 1;%eV
es = 13*8.85*10^-14;
thickness = 3*10^-4;%cm
% mobility = 1e-16;

fun1 = @(a) Jp(a*v, S,A,Tem,fi);
fun2 = @(b) -Js_diff(-b*v,S,Tem,fis,Na,Nd,es, mobility);
fun3 = @(a,b,c) c*v/Resistance(a*v,b*v,thickness,S,fis,fi,Na,Nd,es,mobility);

% F = [ fun1(x(1)) - fun2(x(2));
%       fun1(x(1)) - fun3(x(1),x(2),x(3));
%       x(1)+x(2)+x(3)-1];


F = [ log(fun1(x(1))) - log(fun2(x(2)));
      log(fun1(x(1))) - log(fun3(x(1),x(2),x(3)));
      x(1)+x(2)+x(3)-1];
 
