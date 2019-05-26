function [T,U] = set_up_twoDiodesModel()

u1_0= 0;%V
u2_0= 0;%V
v   =-1;%V
t0  = 0;%s
tend= 1;%s
S   = 0.1;%cm2
A   = 1.2*10^2; %A/(cm2K2)
Tem = 120;%K
fis = 0.2;%eV
Na = 8*10^14;%cm-3
Nd = 10^18;%cm-3
fi = 1;%eV
es = 13*8.85*10^-14;
thickness = 3*10^-4;%cm
mobility = 200;
[T,U] = call_twodiodes(u1_0, u2_0, v, t0, tend,S,A,Tem,fi,fis,es, Na,Nd, thickness,mobility);

end

%Js_diff  = S*q*Nv(Tem)*mobility*sqrt(2*q*(fis-v)*Na/es)*exp(-fis/(0.0000862*Tem)).*(exp(v/(0.0000862*Tem))-1);