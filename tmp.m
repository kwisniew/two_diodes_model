v   = 0.93;%V
Tem = 80;%K
fis = 0.2;%eV
mobility = 0.02;
x0 = [0.89607;0.10393;1.1454e-09];

S   = 0.1;%cm2
A   = 1.2*10^2; %A/(cm2K2)
Na = 10^15;%cm-3
Nd = 10^18;%cm-3
fi = 1;%eV
es = 13*8.85*10^-14;
thickness = 3*10^-4;%cm
omega = 1e6;

 (  abs(-Js_diff(-v/1000,S,Tem,fis,Na,Nd,es, mobility))                   < abs(Jp(v, S,A,Tem,fi))  )
%  || ...
%        (  (v/1000)/resistance_nr(v,0,thickness,S,fis,fi,Na,Nd,es,mobility) > Jp(v, S,A,Tem,fi)  )