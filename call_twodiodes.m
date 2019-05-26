function [T,U] = call_twodiodes(u1_0, u2_0, v, t0, tend,S,A,Tem,fi,fis,es, Na,Nd, thickness, mobility)
 tspan =[t0 tend];
%  u1_0 = 0;
%  u2_0 = 0;
%  u3_0 = -1;
 options = odeset('RelTol',1e-8,'AbsTol',1e-10,'OutputFcn',@myfun);
 [T,U] = ode45(@(T,U) twodiodes(T,U,v,S,A,Tem,fi,fis,es, Na,Nd, thickness, mobility),tspan,[u1_0 u2_0], options);
 semilogx(T,U(:,1))
 hold on
 semilogx(T,U(:,2))
 hold off
end
% [T,U] = call_twodiodes(0,0,-1,0,1, 0.1,1.2*10^2,120,1,0.2,13*8.85*10^-14,8*10^14,10^18);


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

