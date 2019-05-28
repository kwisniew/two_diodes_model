function Jp = Jp(u, S,A,Tem,fi)

    jjs = S*A*Tem^2*exp(-fi/(0.0000862*Tem));
    Jp  = jjs*(exp(u/(0.0000862*Tem)) - 1);
   
end