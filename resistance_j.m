function resistance_j=resistance_j(x,A,S,Tem,fi)

resistance_j = (6360437356615053*exp((73786976294838206464*fi)/(6360437356615053*Tem))...
               *exp(-(73786976294838206464*x)/(6360437356615053*Tem)))/(73786976294838206464*A*S*Tem);
 
end