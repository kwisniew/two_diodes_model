syms omega Rj Rbc Cj Cbc Rn real;
Impedance = Rn + 1/(1i*Cj*omega+1/Rj)+1/(1i*Cbc*omega+1/Rbc);
imag(Impedance^-1);


syms S A Tem fi fis mobility Na Nd es x;
jjs = S*A*Tem^2*exp(-fi/(0.0000862*Tem));
Jp  = jjs*(exp(x/(0.0000862*Tem)) - 1);

resistance_j = diff(Jp,x)^-1;
Nv = 2.5*10^19*((0.72)^(3/2))*(Tem/300)^(3/2);
Ws=sqrt(2*es*(fis - x)*(Na + Nd)/((1.6*10^-19)*Na*Nd));
Js_diff  = S*(1.6*10^-19)^2*Nv*mobility*Na*Ws*exp(-fis/(0.0000862*Tem))*(exp(x/(0.0000862*Tem))-1)/es;
resistance_sch = diff(Js_diff,x)^-1;


function susceptance=susceptance(Cbc,Cj,Rbc,Rj,Rn,omega)
    
    susceptance=((Cbc*omega)/(1/Rbc^2 + Cbc^2*omega^2) + (Cj*omega)/(1/Rj^2 + Cj^2*omega^2))/(((Cbc*omega)/(1/Rbc^2 + Cbc^2*omega^2) + (Cj*omega)/(1/Rj^2 + Cj^2*omega^2))^2 + (Rn + 1/(Rbc*(1/Rbc^2 + Cbc^2*omega^2)) + 1/(Rj*(1/Rj^2 + Cj^2*omega^2)))^2);
 

end