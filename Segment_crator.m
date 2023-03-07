function [Vi,Ri] = Segment_crator()
Size=0;
while Size<10
Size=round(rand*30);
end
for(i=1:Size)
Vi(i,1)=round(rand*1000);
Vi(i,2)=round(rand*1000);
end


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

end

