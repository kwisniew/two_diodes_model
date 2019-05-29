function Wj =Wj(u, Na,Nd,fi,es)
%     Na = 8*10^14;
%     Nd = 10^18;
%     fi = 1;
%     es = 13*8.85*10^-14;
    Wj=sqrt(2*es*(fi - u)*(Na + Nd)/((1.6*10^-19)*Na*Nd));
end