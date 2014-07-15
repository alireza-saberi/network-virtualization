function Cost = AdjacencyGraph()
% Function Cost=AdjacencyGraph(n) makes the adjacency graph for our
% Substrate Network
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
 Nodes = xlsread('VirtualResources.xlsx','Nodes');
 Links = xlsread('VirtualResources.xlsx','Links');
 [m,n]= size(Nodes);
 AdjancencyMatrix = zeros(m,m);
 source = Links(:,5);
 destination = Links(:,6);
 for i=1:m
     index1= find(source == i);
     index2 = destination(index1);
     AdjancencyMatrix(i,index2)=1;
     AdjancencyMatrix(index2,i)=1;
     index3 = find(AdjancencyMatrix(i,:) < 1);
     AdjancencyMatrix(i,index3)= inf;
 end    
 Cost =AdjancencyMatrix;
end