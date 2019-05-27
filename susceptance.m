function susceptance=susceptance(Cbc,Cj,Rbc,Rj,Rn,omega)
    
    susceptance=((Cbc*omega)/(1/Rbc^2 + Cbc^2*omega^2) + (Cj*omega)/(1/Rj^2 + Cj^2*omega^2))/...
        (omega*(((Cbc*omega)/(1/Rbc^2 + Cbc^2*omega^2) + (Cj*omega)/(1/Rj^2 + Cj^2*omega^2))^2 + (Rn + 1/(Rbc*(1/Rbc^2 + Cbc^2*omega^2)) + 1/(Rj*(1/Rj^2 + Cj^2*omega^2)))^2));

end