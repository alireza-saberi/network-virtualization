function [BW, Delay, PacketLoss,index,AC]= QoSAtribute(source, desination)
% Function [BW, Delay, PacketLoss,index,AC]= QoSAtribute(source, desination)
% is responsible for taking source node, and destination node and returning
% BW, Delay, PacketLoss, and Available Capacity
% path cell and delivering new cell, with all of links properties
%==============================================================
% Links Behrouznia
% Concordia University, Montreal, QC, Canada
% 2011- 2013
%==============================================================
%  DATE :            October 2013                                 
%  Last Updated:    
%  ---- Changes month day year: ----
%  
%============================================================== 
 Links=xlsread('VirtualResources.xlsx','Links');
 index1 = find(Links(:,5) == source );
 index2 = find(Links(:,6) == desination);
 index = intersect(index1,index2);
 
 if isempty(index) == 1
      index1 = find(Links(:,5) == desination );
      index2 = find(Links(:,6) == source);
      index = intersect(index1,index2);
 end    

 BW = Links(index,2);
 Delay = Links(index,3);
 PacketLoss = Links(index,4);
 AC = Links(index,8);
end