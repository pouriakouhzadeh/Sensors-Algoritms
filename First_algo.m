close all
clear all
format bank
Size=0;
while (Size<10) || (Size>30)
    Size = round(rand*100);
end
Vi(1,1)=round(rand*1000);
for(i=2:Size)
    Tag=false;
    while (Tag==false)
    R = round(rand*1000);
    for(j=1:size(Vi,2))
        if((Vi(1,j)-30<R) && (Vi(1,j)+30>R))
            if((Vi(1,j)-2>R) || (Vi(1,j)+2<R))
                Tag1=false;
                count=0;
                for(k=1:size(Vi,2))
                    if((Vi(1,k)-30<R) && (Vi(1,k)+30>R))
                        if((Vi(1,k)-2<R) || (Vi(1,k)+2>R))
                            count=count+1;
                        end
                    end
                    if(count>1)
                        Tag1=true;
                        break;
                    end
                end
                if(Tag1==false)
                    Vi(1,i)= R;
                    Tag=true;
                    break;
                end
            end
        end
    end
    end
end
plot(Vi,'*')
Ri=0;
min=10000;
for(j=1:size(Vi,2))
    w=0;
    for(k=1:size(Vi,2))
            w=w+abs((Vi(1,k)-Vi(1,j)));
    end
    if(w<min)
        min=w;
        Ri=j;
    end
end
hold all
plot(Ri,Vi(1,Ri),'*r')
Ri