function [T,U] = call_twodiodes(u1_0, u2_0, v, t0, tend,S,A,Tem,fi,fis,es, Na,Nd)
 tspan =[t0 tend];
%  u1_0 = 0;
%  u2_0 = 0;
%  u3_0 = -1;
 options = odeset('OutputFcn',@myfun);
 [T,U] = ode45(@(T,U) twodiodes(T,U,v,S,A,Tem,fi,fis,es, Na,Nd),tspan,[u1_0 u2_0], options);
 semilogx(T,U(:,1))
 hold on
 semilogx(T,U(:,2))
 hold off
end
% 1.1*10^-3:0.01:1  10^-4:10^-2:10^-1
% [0:5*10^-10:10^-8 1.1*10^-8:8*10^-8:10^-6 1.1*10^-6:10^-5:10^-4 10^-4:10^-3:10^-2]
%:tend/100:

% function [value, isterminal, direction] = myEvent(T, U,v)
% value      = ((U(2)) < (-0.99999));
% isterminal = 1;   % Stop the integration
% direction  = 0;
% end


function status = myfun(t,u,flag)
    global u2

    switch(flag)
        case 'init'
            fprintf('Jedziemy!\n');
            u2 = [u(1) u(2)];
        case 'done'
            fprintf('Zrobione!\n');
    end
    
    if isempty(flag)
    u2 = [u2(2) u(2)];
    status = abs(u2(2)-u2(1)) < 0.000001;
    end
end

