close all
clear all
format bank

% Crate random number of segmet's
Size = 0;
while Size < 4 || Size > 10 
    Size = round (rand*100);
end

% Initialing segment's Data

n=0;
for(i=1:Size)
    [Vi,Ri(i,1)] = Segment_crator();
    n=n+1;
        for j = 1 : size(Vi,1)
            Segments(j,n) = Vi(j,1) ;
        end
    n=n+1;
        for j = 1 : size(Vi,1)
            Segments(j,n) = Vi(j,2) ;
        end
end
% Preparing Data to plot 

% Gnerate the segments area

Location_of_segments(1,1) = round((rand*Size)*1000); 
Location_of_segments(1,2) = round((rand*Size)*1000);
n = 1;
for i = 2 : Size
        Tag = false ;
        while(Tag == false)
        Tag = true ;
        LS_X = round((rand*Size)*5000);
        LS_Y = round((rand*Size)*5000);        
        for( j = 1 : size(Location_of_segments,1))
            if(abs( Location_of_segments(j,1)-LS_X) < 2000 ||  abs( Location_of_segments(j,1)-LS_Y) < 2000)
                Tag = false;
                break;
            end
        end
            if ( Tag == true )
                n = n + 1;
                Location_of_segments(n,1) = LS_X;
                Location_of_segments(n,2) = LS_Y;
            end
        end
end
% Move the Segments to each area

for(i = 1 : 2 : size(Segments,2))
    for(j = 1 : size(Segments,1))
        if( Segments (j , i) == 0)
            break;
        end
        Segments(j , i) = Segments(j , i) + Location_of_segments(round(i/2) , 1);
        Segments(j , i+1) = Segments(j , i+1) + Location_of_segments(round(i/2) , 2);
    end
end
% Plotting 
for(i=1 : 2 : size(Segments,2))
     plot(Segments(:,i),Segments(:,i+1),'+')
     hold all
end
n = 1 ;
for(i=1 : size(Ri,1))
     plot(Segments(Ri(i,1),n),Segments(Ri(i,1),n+1),'*r')
     n = n + 2 ;
     hold all
end

