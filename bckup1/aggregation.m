function aggregation()
% Function Filtering(input_nodes) filters our network nodes, based on
% available capacity, and distances of the nodes, and then gives new row
% vector of nodes
%==============================================================
% Saba Behrouznia
% Concordia University, Montreal, QC, Canada
% 2011- 2013
%==============================================================
%  DATE :            October 2013                                 
%  Last Updated:    
%  ---- Changes month day year: ----
%  
%==============================================================
Links= xlsread('VNRnetwork.xlsx','Links');
Source = Links(:,5);
destination = Links(:,6);
BW = Links(:,2);
Delay = Links(:,3);
PacketLoss = Links(:,4);

Cost = AdjacencyGraph();

%default value of K in KShortestPasht is 4
default_value_K = 4;
for i=1:length(Source)
    if (Source(i) == -1 || destination(i)== -1 )
        continue;
    end    
[shortestPaths, totalCosts] = kShortestPath(Cost, Source(i), destination(i), default_value_K);

% Middle function is responsible for taking shortest path cell and
% delivering new cell, with all of links properties
Path_Link_property = LinkPropertyMaker(shortestPaths);

AC_Min = BW(i);
index1 = ACChecker(Path_Link_property,AC_Min);
    if index1 == -1 
        display('Link doesnt match with link AC requirements!');
%         NN(kk,6)=-1;
%         LL(index_temp1,7) = -1;
%         LL(index_temp2,8) = -1;
    end

delay_Min = Delay(i);
index2 = DelayChecker(Path_Link_property,delay_Min);
    if index2 == -1 
        display('Link doesnt match with delay requirements!');
%         NN(kk,6)=-1;
%         LL(index_temp1,7) = -1;
%         LL(index_temp2,8) = -1;
    end

PPKLoss_Min = PacketLoss(i);
index3 = PacketLossChecker(Path_Link_property,PPKLoss_Min);
    if index3 == -1 
        display('Link doesnt match with packet loss requirements!');
%         NN(kk,6)=-1;
%         LL(index_temp1,7) = -1;
%         LL(index_temp2,8) = -1;
    end

Selected_index = intersect(intersect(index1,index2),index3);
    if (Selected_index == -1)
        display(sprintf('No Paths for link no. %d is found! ',i)) ;
    else
    
        display(sprintf('Path %d is candidate from our virtual resoure to build our virtual network ',i));
        display('Its nodes are: ')
        display(sprintf('%d ', shortestPaths{i}));
        ACUpdater(shortestPaths,i, AC_Min);
%         compare_cost = 1;
%         final = COST(shortestPaths,i,compare_cost);
%         if (final == -1)
%             display('Agha ridirm!!');
%         else
%             display('Succeeded!');
%         end
      
    end
end
end