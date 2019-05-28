
function [x,fval]=divide_potential(parts)

x0 = [parts(1);parts(2);parts(3)];
options = optimoptions('fsolve','Display','iter','FunctionTolerance', 1e-44, 'OptimalityTolerance', 1e-44);
[x,fval] = fsolve(@myfun,x0,options)


u1_0= 0;%V
u2_0= 0;%V
v   =-1;%V
t0  = 0;%s
tend= 1;%s
S   = 0.1;%cm2
A   = 1.2*10^2; %A/(cm2K2)
Tem = 200;%K
fis = 0.2;%eV
Na = 10^15;%cm-3
Nd = 10^18;%cm-3
fi = 1;%eV
es = 13*8.85*10^-14;
thickness = 3*10^-4;%cm
mobility = 1e-16;

disp("prundy:")
Jp(x(1)*v, S,A,Tem,fi)
-Js_diff(-x(2)*v,S,Tem,fis,Na,Nd,es, mobility)
x(3)*v/Resistance(x(1)*v,x(2)*v,thickness,S,fis,fi,Na,Nd,es,mobility)
disp("residuum:")
Jp(x(1)*v, S,A,Tem,fi)-(-Js_diff(-x(2)*v,S,Tem,fis,Na,Nd,es, mobility))