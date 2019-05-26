function scr_length = scr_length(thickness, u, v, fis,fi,Na,Nd,es) 
    scr_length = thickness - Wj(u, Na,Nd,fi,es) - Ws(v, Na,Nd,fis,es);
    %3*10^-4 to gruboœæ warstwy CIGSu w cm*
end

function Ws =Ws(v, Na,Nd,fis,es)
%     Na = 8*10^14;
%     Nd = 10^18;
%     fi = 0.2;
%     es = 13*8.85*10^-14;
    Ws=sqrt(2*es*(fis - v)*(Na + Nd)/((1.6*10^-19)*Na*Nd));
end

function Wj =Wj(u, Na,Nd,fi,es)
%     Na = 8*10^14;
%     Nd = 10^18;
%     fi = 1;
%     es = 13*8.85*10^-14;
    Wj=sqrt(2*es*(fi - u)*(Na + Nd)/((1.6*10^-19)*Na*Nd));
end