function Js_diff = Js_diff(v,S,Tem,fis,Na,Nd,es, mobility)
    
    q=1.6*10^-19;
    Js_diff  = S*q*Nv(Tem)*mobility*sqrt(2*q*(fis-v)*Na/es)*exp(-fis/(0.0000862*Tem)).*(exp(v/(0.0000862*Tem))-1);
   
   
end

function Nv = Nv(Tem)
    Nv = 2.5*10^19*((0.72)^(3/2))*(Tem/300)^(3/2);
end


function Ws =Ws(v, Na,Nd,fis,es)
%     Na = 8*10^14;
%     Nd = 10^18;
%     fi = 0.2;
%     es = 13*8.85*10^-14;
    Ws=sqrt(2*es*(fis - v)*(Na + Nd)/((1.6*10^-19)*Na*Nd));
end
