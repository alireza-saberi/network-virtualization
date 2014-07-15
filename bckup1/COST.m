function  final = COST(shortestPaths,i,cp)
Links= xlsread('VirtualResources.xlsx','Links');
[LRow,LCol] = size(Links);
source = Links(:,5);
destination = Links(:,6);
BW = Links(:,2);
BW1 = [];
N= xlsread('VirtualResources.xlsx','Nodes');
[NRow,NCol] = size(N);
CPU = N(:,10);

nodes = shortestPaths{i};
L_node_numbers = length(nodes);
CPU1 = CPU(nodes);
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
    BW1 =  [BW1 BW(index_1)];
end
final_cost = sum(BW1)+sum(CPU1);
if (final_cost > cp )
    final = -1;
end    
    final = 0;
end