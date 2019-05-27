v   =-1;%V
Tem = 200;%K
fis = 0.2;%eV
mobility = 1e-16;

dividefun = @(x) myfun(x, mobility, Tem, fis,v);

x0 = [0.9801;0.0051;0.0148];
options = optimoptions('fsolve','Display','iter','FunctionTolerance', 1e-44, 'OptimalityTolerance', 1e-44);
[x,fval] = fsolve(@myfun,x0,options)




disp("prundy:")
Jp(x(1)*v, S,A,Tem,fi)
-Js_diff(-x(2)*v,S,Tem,fis,Na,Nd,es, mobility)
x(3)*v/Resistance(x(1)*v,x(2)*v,thickness,S,fis,fi,Na,Nd,es,mobility)
disp("residuum:")
Jp(x(1)*v, S,A,Tem,fi)-(-Js_diff(-x(2)*v,S,Tem,fis,Na,Nd,es, mobility))