function result = Distance_Checker(Net,input_nodes,required_X,required_Y,required_D)
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
% X = Net(:,12);
% Y = Net(:,13);

X = Net(:,12);
Y = Net(:,13);

D = sqrt((X-required_X).^2 + (Y-required_Y).^2);
Distance_index = find(D <= required_D);
R2 = intersect(Distance_index,input_nodes);


if (isempty(R2))
    %display('No proper CPU is availavle at this location! ');
    result = -1;
else
    
    result = Net(R2);
end    

end