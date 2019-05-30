v = -1:0.01:1;
v = v(v~=0);
Tem = 80:10:180;
x0 = [0.9999;0.0001;0.0];
division=x0;

% Main_diode_potential     = zeros(1,length(v));
% Back_contact_potential   = zeros(1,length(v));
% Neutral_region_potential = zeros(1,length(v));
last_resonable_iteration = 201;

[Temperature,Voltage] = meshgrid(Tem,v);
susceptancja = zeros( length( v ),length( Tem ) );

for i=1:length(Tem)
    for j=1:length(v)
        try
        [c_susceptance,division]= calculate_susceptance(v(j),Tem(i),0.02,0.2,division);

        display("potencja³: " + v(j))
        display("susceptancja: " + c_susceptance + "  podzia³: "+division)
        susceptancja(j,i)=c_susceptance;
%         Main_diode_potential(i)     = division(1);
%         Back_contact_potential(i)   = division(2);
%         Neutral_region_potential(i) = division(3);
        catch
            if last_resonable_iteration > j-1
                last_resonable_iteration=j-1;
            end
        end
    end
end

susceptancja = susceptancja(1:last_resonable_iteration,:);
susceptancja = transpose( transpose(susceptancja)./Cj(v(1:last_resonable_iteration),es,S, Na,Nd,fi) );

[Temperature,Voltage] = meshgrid(Tem,v(50:last_resonable_iteration)); 
subplot(1,1,1)
surf(Temperature,Voltage,susceptancja(50:187,:)*100)
colorbar
% S   = 0.1;%cm2
% Na = 10^15;%cm-3
% Nd = 10^18;%cm-3
% fi = 1;%eV
% es = 13*8.85*10^-14;
% %(1:length(susceptancja))
% sus_percent = susceptancja(1:last_resonable_iteration)./Cj(v(1:last_resonable_iteration),es,S, Na,Nd,fi);
% 
% figure
% subplot(2,2,1);
% plot(v(1:last_resonable_iteration),sus_percent)
% 
% subplot(2,2,2);
% plot(v(1:last_resonable_iteration),Main_diode_potential(1:last_resonable_iteration))
% 
% subplot(2,2,3);
% plot(v(1:last_resonable_iteration),Back_contact_potential(1:last_resonable_iteration))
% 
% subplot(2,2,4);
% plot(v(1:last_resonable_iteration),Neutral_region_potential(1:last_resonable_iteration))


