function resistance_bc=resistance_bc(x,S,Tem,fis,mobility,Na,Nd,es)
    resistance_bc = -1/((609546368859983975114067784391*S*mobility*exp(-(73786976294838206464*fis)/(6360437356615053*Tem))*(exp((73786976294838206464*x)/(6360437356615053*Tem)) - 1)*(Tem/300)^(3/2)*(Na + Nd))/(249429612771140788556360843264*Nd*((20769187434139310514121985316880384*es*(fis - x)*(Na + Nd))/(1661534994731145*Na*Nd))^(1/2)) - (3047731844299919875570338921955*Na*S*mobility*exp(-(73786976294838206464*fis)/(6360437356615053*Tem))*exp((73786976294838206464*x)/(6360437356615053*Tem))*(Tem/300)^(3/2)*((20769187434139310514121985316880384*es*(fis - x)*(Na + Nd))/(1661534994731145*Na*Nd))^(1/2))/(671901019402260392969943879699766851869343744*Tem*es));
 end