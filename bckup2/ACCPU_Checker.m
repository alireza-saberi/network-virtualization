function result = ACCPU_Checker(Net,input_nodes,required_AC)
% Function ACCPU_Checker(Net,required_AC) checks our network nodes, based on
% available capacity, new row vector of nodes
% Net is our input network of nodes
% Required_AC is our desirable CPU available capacity
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
%CPU = Net(:,11);
CPU = Net(:,11);
R = find(CPU >= required_AC);
R2 = intersect(R,input_nodes);
if (isempty(R2))
    %display('No proper CPU is availavle for this AC!');
    result = -1;
else
    
    result = Net(R2);
end    
end