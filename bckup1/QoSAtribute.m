function [BW, Delay, PacketLoss,index,AC]= QoSAtribute(source, desination)
% Function [BW, Delay, PacketLoss,index,AC]= QoSAtribute(source, desination)
% is responsible for taking source node, and destination node and returning
% BW, Delay, PacketLoss, and Available Capacity
% path cell and delivering new cell, with all of links properties
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
 Saba=xlsread('VirtualResources.xlsx','Links');
 index1 = find(Saba(:,5) == source );
 index2 = find(Saba(:,6)== desination);
 index = intersect(index1,index2);

 BW = Saba(index,2);
 Delay = Saba(index,3);
 PacketLoss = Saba(index,4);
 AC = Saba(index,8);
end