disp("##################################################################################")
disp("##################################################################################")
disp("Zaczynamy!!!!")
v   = 0.8;%V
Tem = 80;%K
fis = 0.2;%eV
mobility = 0.02;

dividefun = @(x) myfun(x, mobility, Tem, fis,v);
x0 = [0.99;0.01;0.0];
disp("Wyniki wstêpne:")
Jp(x0(1)*v, S,A,Tem,fi)
(-Js_diff(-x0(2)*v,S,Tem,fis,Na,Nd,es, mobility))
x0(3)*v/Resistance(x0(1)*v,x0(2)*v,thickness,S,fis,fi,Na,Nd,es,mobility)
disp("rozwi¹zanie:")
options = optimoptions('fsolve','Display','iter','FunctionTolerance', 1e-44, 'OptimalityTolerance', 1e-44,...
                        'StepTolerance',1e-44, 'FunValCheck', 'on');%, 'FunValCheck', 'on'
[x,fval] = fsolve(dividefun,x0,options)


S   = 0.1;%cm2
A   = 1.2*10^2; %A/(cm2K2)
Na = 10^15;%cm-3
Nd = 10^18;%cm-3
fi = 1;%eV
es = 13*8.85*10^-14;
thickness = 3*10^-4;%cm

% 
% disp("prundy:")
% Jp(x(1)*v, S,A,Tem,fi)
% -Js_diff(-x(2)*v,S,Tem,fis,Na,Nd,es, mobility)
% x(3)*v/Resistance(x(1)*v,x(2)*v,thickness,S,fis,fi,Na,Nd,es,mobility)
disp("residuum:")
Jp(x(1)*v, S,A,Tem,fi)-(-Js_diff(-x(2)*v,S,Tem,fis,Na,Nd,es, mobility))
Jp(x(1)*v, S,A,Tem,fi)-x(3)*v/Resistance(x(1)*v,x(2)*v,thickness,S,fis,fi,Na,Nd,es,mobility)
x


% powers = -15:0;
% y= 10.^powers;

% y= -1:0.01:-0.01
% wyniki =x0;
% for i=y
%    dividefun = @(x) myfun(x, mobility, Tem, fis,i);
%    [x,fval] = fsolve(dividefun,x0,options);
%    x0=x;
%    wyniki = [wyniki x0];
%    
% disp("zmienna w pentli:")
% disp(i)
% 
% disp("residuum:")
% disp(Jp(x(1)*v, S,A,Tem,fi)-(-Js_diff(-x(2)*v,S,Tem,fis,Na,Nd,es, mobility)))
%    
%  disp("####################")  
% end
