function [c_susceptance,division]=calculate_susceptance(v,Tem,mobility, fis,x0)
    S   = 0.1;%cm2
    A   = 1.2*10^2; %A/(cm2K2)
    Na = 10^15;%cm-3
    Nd = 10^18;%cm-3
    fi = 1;%eV
    es = 13*8.85*10^-14;
    thickness = 3*10^-4;%cm
    omega = 1e6;
    
    if (  abs(-Js_diff(-v/1000,S,Tem,fis,Na,Nd,es, mobility))                   < abs(Jp(v, S,A,Tem,fi))  ) || ...
       (  abs((v/1000)/resistance_nr(v,0,thickness,S,fis,fi,Na,Nd,es,mobility)) < abs(Jp(v, S,A,Tem,fi))  )
   
        disp("rozwi¹zanie:")
        dividefun = @(x) myfun(x, mobility, Tem, fis,v, Jp(x0(1)*v, S,A,Tem,fi)^-1);
        options = optimoptions('fsolve','Display','off','FunctionTolerance', 1e-44, 'OptimalityTolerance', 1e-44,...
                                'StepTolerance',1e-44, 'FunValCheck', 'on');%, 'FunValCheck', 'on'
        [x,fval] = fsolve(dividefun,x0,options);
        
        
         c_susceptance = susceptance(Cbc(x(2)*v,es,S, Na,Nd,fis), ...
                                      Cj(x(1)*v,es,S, Na,Nd,fi),  ...
                                    resistance_bc(x(2)*v,  S,Tem,fis,mobility,Na,Nd,es),...
                                     resistance_j(x(1)*v,A,S,Tem,fi), ...
                                    resistance_nr(x(1)*v,x(2)*v,thickness,S,fis,fi,Na,Nd,es,mobility), ...
                                    omega);
                                
         division = x;
   
    else
    
        c_susceptance = susceptance(Cbc(0,es,S, Na,Nd,fis), ...
                                     Cj(v,es,S, Na,Nd,fi),  ...
                                    resistance_bc(0,  S,Tem,fis,mobility,Na,Nd,es),...
                                     resistance_j(v,A,S,Tem,fi), ...
                                    resistance_nr(v,0,thickness,S,fis,fi,Na,Nd,es,mobility), ...
                                    omega); 
                                
        division = [0.9999;0.0001;0.0];
        
    end
   
end