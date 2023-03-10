close all
clear all
format bank

% Crate random number of segmet's
Size = 0;
while Size < 4 || Size > 15 
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
     plot(Segments(:,i),Segments(:,i+1),'+','DisplayName','Sensor')
     hold all
end
n = 1 ;
m=1;
for(i=1 : size(Ri,1))
     plot(Segments(Ri(i,1),n),Segments(Ri(i,1),n+1),'*r','DisplayName','Representative sensor')
     R_N(m,1) = Segments(Ri(i,1),n);
     R_N(m,2) = Segments(Ri(i,1),n+1);
     m = m + 1;
     n = n + 2 ;
     hold all
end

% Generate Mobile Well initial location position
MW_X = round((rand*Size)*5000);
MW_Y = round((rand*Size)*5000);

% Plot Mobile well
plot(MW_X,MW_Y,'--gs',...
    'LineWidth',5,...
    'MarkerSize',15,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',[0.5,0.5,0.5],...
    'DisplayName','Mobile well')

% Find the road map of mobile well
R_N_TEMP = R_N;
MW_TEMP(1,1) = MW_X;
MW_TEMP(1,2) = MW_Y;
n = 1;
NEW_R_N(n,1) = MW_X;
NEW_R_N(n,2) = MW_Y;

for(i = 1 : size(R_N,1))
        min =  100000000 ;
        for(j = 1 : size(R_N,1))
            if (R_N_TEMP(j,1) ~= 0)
               if ( abs ( R_N_TEMP(j,1) - MW_TEMP(1,1) ) +  abs ( R_N_TEMP(j,2) - MW_TEMP(1,2) ) ) < min
                    min = ( abs ( R_N_TEMP(j,1) - MW_TEMP(1,1) ) +  abs ( R_N_TEMP(j,2) - MW_TEMP(1,2) ) );
                    Index = j;
               end
            end
        end
        n = n + 1;
        NEW_R_N(n,1) = R_N_TEMP(Index,1);
        NEW_R_N(n,2) = R_N_TEMP(Index,2);
        MW_TEMP(1,1) = R_N_TEMP(Index,1);
        MW_TEMP(1,2) = R_N_TEMP(Index,2);
        R_N_TEMP(Index,1) = 0;
        R_N_TEMP(Index,2) = 0;
           
end
NEW_R_N(end+1,1) = NEW_R_N(1,1);
NEW_R_N(end,2) = NEW_R_N(1,2);
% Plot step by step road map of mobile well
for(i = 1 : size(NEW_R_N,1)-1)
    w = waitforbuttonpress;    
    plot(NEW_R_N(i:i+1,1),NEW_R_N(i:i+1,2),'DisplayName',string(i)+'st Step of moving M_W')
end
legend

