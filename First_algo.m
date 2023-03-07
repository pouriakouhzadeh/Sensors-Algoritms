close all
clear all
format bank
Size=0;
while Size<10
Size=round(rand*30);
end
for(i=1:Size)
Vi(i,1)=round(rand*1000);
Vi(i,2)=round(rand*1000);
end

plot(Vi(:,1),Vi(:,2),'*')
Ri=0;
min=100000;
for(j=1:size(Vi,1))
    w=0;
    for(k=1:size(Vi,1))
            w=w+( abs(Vi(k,1)-Vi(j,1)) + abs(Vi(k,2)-Vi(j,2)) );
    end
    if(w<min)
        min=w;
        Ri=j;
    end
end
hold all
plot(Vi(Ri,1),Vi(Ri,2),'*r')
title('2-D Sensors location 1000*1000 (M M)')
xlabel('1000 Meter"s')
ylabel('1000 Meter"s')
Ri