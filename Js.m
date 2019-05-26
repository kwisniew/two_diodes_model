function Js = Js(v, S,A,Tem,fis)
%     S = 0.1;
%     A = 1.2*10^2 ;
%     T = 120;
%     fis=0.2;
    jjs = S*A*Tem^2*exp(-fis/(0.0000862*Tem));
    Js = jjs*(exp(v/(0.0000862*Tem)) - 1);
   
   
end