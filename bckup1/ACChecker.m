function Path_index = ACChecker(Path_Link_property,AC_Min)
% Function Path_index=ACChecker(Father,AC_Min) calculats different pathes
% AC, selects the one that is needed,then updates it with new AC

% AC = Available Capacity
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
L1=length(Path_Link_property);
% L1 is the number of paths
Path_index = [];
for i=1:L1
    Path_AC = [];
    % AC  is used to keep trak
    Path = Path_Link_property(i);
    L2 = length(Path);
    for ii = 1:L2
        Link = Path{ii};
        LOLO = Link{1};
        Path_AC = [Path_AC LOLO(5)];
    end
    AC = min(Path_AC);
    if AC < AC_Min
        %display(sprintf('Path %d doesnt have enough available capacity',i));
        Path_index = -1;
        
    else
        Path_index = [Path_index i];
    end    
end

end
