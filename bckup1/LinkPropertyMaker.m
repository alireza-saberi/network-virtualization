function Path_Link_property = LinkPropertyMaker(shortestPaths)
% Function Father = LinkPropertyMaker(shortestPaths) is responsible for taking shortest 
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

L_path = length(shortestPaths);
Path_Link_property = cell(1,L_path);
for i=1:L_path

   Temp= shortestPaths{i};
   L_node_numbers = length(Temp);
   Link_property = cell(1,L_node_numbers-1);
   
   for j=1:L_node_numbers-1
    
    S = Temp(j:j+1);
    if (S(1)> S(2))
       temp_S = S(1);
       S(1) = S(2);
       S(2) = temp_S;
    end  
   [BW, Delay, PacketLoss,index, AC] = QoSAtribute(S(1),S(2));
    Link_property{j}=[BW, Delay, PacketLoss,index, AC];
    
   end
   Path_Link_property{i}= Link_property;
   
end    

% Father= Path_Link_property;
end