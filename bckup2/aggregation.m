function aggregation()
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
New_Source = Links(:,7);
New_destination = Links(:,8);
BW = Links(:,2);
Delay = Links(:,3);
PacketLoss = Links(:,4);

Cost = AdjacencyGraph();

%default value of K in KShortestPasht is 4
default_value_K = 4;
D = [];

for i=1:length(New_Source)
    display(sprintf('Working on link no. %d from request',i));
    if (New_Source(i) == -1 || New_destination(i)== -1 )
        display('This link doesnt exist, No source or destination nodes are found.');
        display('================================ ');
        continue;
    end    
[shortestPaths, totalCosts] = kShortestPath(Cost, New_Source(i), New_destination(i), default_value_K);

% Middle function is responsible for taking shortest path cell and
% delivering new cell, with all of links properties
Path_Link_property = LinkPropertyMaker(shortestPaths);

AC_Min = BW(i);
display('AC check');
index1 = ACChecker(Path_Link_property,AC_Min);
    if index1 == -1 
        display('Link doesnt match with link AC requirements!');
%         NN(kk,6)=-1;
%         LL(index_temp1,7) = -1;
%         LL(index_temp2,8) = -1;
    end

delay_Min = Delay(i);
display('Delay check')
index2 = DelayChecker(Path_Link_property,delay_Min);
    if index2 == -1 
        display('Link doesnt match with delay requirements!');
%         NN(kk,6)=-1;
%         LL(index_temp1,7) = -1;
%         LL(index_temp2,8) = -1;
    end

PPKLoss_Min = PacketLoss(i);
display('Packeloss check')
index3 = PacketLossChecker(Path_Link_property,PPKLoss_Min);
    if index3 == -1 
        display('Link doesnt match with packet loss requirements!');
%         NN(kk,6)=-1;
%         LL(index_temp1,7) = -1;
%         LL(index_temp2,8) = -1;
    end

Selected_index = intersect(intersect(index1,index2),index3)

    if (isempty(Selected_index)) 
        Selected_index = -1;
    end  
    if (Selected_index == -1)
        display(sprintf('No Paths for link no. %d is found! ',i));
        display('================================ ');
    else
 if(Selected_index ~= -1 )
        display(sprintf('Path %d is candidate from our virtual resource to build our virtual network ',Selected_index(1)));
        display('Its nodes are: ')
        display(sprintf('%d ', shortestPaths{Selected_index(1)}));
        ACUpdater(shortestPaths, Selected_index, AC_Min)

        compare_cost = 1; 
        %expected final value
        final = COST(shortestPaths,Selected_index,compare_cost);
         if (final == -1)
             display('Final costs is more than expected value');
         else
             display('Final costs satisfy our expectations and its value is ....');
             final
         end
        display('================================ ');
        d = DelayRanking(shortestPaths,Selected_index);
        D = [D; d i];
        %throughput = ThroughputRanking(shortestPaths,Selected_index);
        %Throughput = [Throughput;throughput i];
 end
    end
end
D
[m1,m2] = min(D(:,1));
display(sprintf('Based on our ranking function link %d has the minimum delay with delay of %d MSec.',D(m2,2),m1));
%display(sprintf('Based on our ranking function link %d has the best throughput with %d',Throughput,T_index));

end