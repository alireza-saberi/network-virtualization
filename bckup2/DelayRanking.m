function TotalDelay = DelayRanking(shortestPaths,Selected_index)
% Function [Delay, Delay, PacketLoss,index,AC]= QoSAtribute(source, desination)
% is responsible for taking source node, and destination node and returning
% Delay, Delay, PacketLoss, and Available Capacity
% path cell and delivering new cell, with all of links properties
%==============================================================
% Links Behrouznia
% Concordia University, Montreal, QC, Canada
% 2011- 2013
%==============================================================
%  DATE :            December 2013                                 
%  Last Updated:    
%  ---- Changes month day year: ----
%  
%============================================================== 
Links= xlsread('VirtualResources.xlsx','Links');
[LRow,LCol] = size(Links);
source = Links(:,5);
destination = Links(:,6);
Delay = Links(:,3);
Delay1 = [];

nodes = shortestPaths{Selected_index(1)};
L_node_numbers = length(nodes);

for j=1:L_node_numbers-1
    S = nodes(j:j+1);
    if (S(1)> S(2))
       temp_S = S(1);
       S(1) = S(2);
       S(2) = temp_S;
    end 
    index_temp1 = find(source == S(1));
    index_temp2 = find(destination == S(2));
    index_1 = intersect(index_temp1,index_temp2);
    Delay1 =  [Delay1 Delay(index_1)];
end

    TotalDelay = sum(Delay1);


end