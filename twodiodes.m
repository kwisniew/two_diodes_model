function dudt = twodiodes(t,u,v,S,A,Tem,fi,fis,es, Na,Nd)
   R=10;
%    S = 0.1;
%    A = 1.2*10^2 ;
%    T = 120;
%    fis=0.2;
%    es = 13*8.85*10^-14;
   dudt = zeros(2,1);
   un = v - u(1) - u(2);
   dudt(1)=(un/R + Js(-u(1),S,A,Tem,fis))/Cs(-u(1),es,S, Na,Nd,fis);
   dudt(2)=(un/R - Jp( u(2),S,A,Tem,fi ))/Cj( u(2),es,S, Na,Nd,fi );
%    dudt(3)=-(u(3)/R + Js(-u(1)))/Cs(-u(1))-(u(3)/R + Jp(-u(2)))/Cj(-u(2));
   
   
end


function Js = Js(v, S,A,Tem,fis)
%     S = 0.1;
%     A = 1.2*10^2 ;
%     T = 120;
%     fis=0.2;
    jjs = S*A*Tem^2*exp(-fis/(0.0000862*Tem));
    Js = jjs*(exp(v/(0.0000862*Tem)) - 1);
   
   
end

function Jp = Jp(u, S,A,Tem,fi)
%     S = 0.1;
%     A = 1.2*10^2 ;
%     T = 120;
%     fis=1;
    jjs = S*A*Tem^2*exp(-fi/(0.0000862*Tem));
    Jp  = jjs*(exp(u/(0.0000862*Tem)) - 1);
   
   
end



function Wj =Wj(u, Na,Nd,fi,es)
%     Na = 8*10^14;
%     Nd = 10^18;
%     fi = 1;
%     es = 13*8.85*10^-14;
    Wj=sqrt(2*es*(fi - u)*(Na + Nd)/((1.6*10^-19)*Na*Nd));
end

function Cj = Cj(u,es,S, Na,Nd,fi)
%     es = 13*8.85*10^-14;
%     S = 0.28;
    Cj= S*es/Wj(u, Na,Nd,fi,es); 
end

function Ws =Ws(v, Na,Nd,fis,es)
%     Na = 8*10^14;
%     Nd = 10^18;
%     fi = 0.2;
%     es = 13*8.85*10^-14;
    Ws=sqrt(2*es*(fis - v)*(Na + Nd)/((1.6*10^-19)*Na*Nd));
end

function Cs = Cs(v,es,S, Na,Nd,fis)
%     es = 13*8.85*10^-14;
%     S = 0.28;
    Cs= S*es/Ws(v, Na,Nd,fis,es); 
end




