function Ws =Ws(v, Na,Nd,fis,es)
%     Na = 8*10^14;
%     Nd = 10^18;
%     fi = 0.2;
%     es = 13*8.85*10^-14;
    Ws=sqrt(2*es*(fis - v)*(Na + Nd)/((1.6*10^-19)*Na*Nd));
end