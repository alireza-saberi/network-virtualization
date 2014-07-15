function Path_index = PacketLossChecker(Father,PPKLoss_Min)
% Function PacketLossChecker(Father,PPKLoss_Min) calculats different pathes
% PcketLoss, selects the one that is needed,then updates it with new AC
% AC = Available Capacity
%==============================================================
% Alireza Saberi
% Concordia University, Montreal, QC, Canada
% 2009-2011
%==============================================================
%  DATE :            October 2011                                 
%  Last Updated:    
%  ---- Changes month day year: ----
%  
%==============================================================
L1 = length(Father);
% L1 is the number of paths
Path_index = [];
for i = 1:L1
    Path_pkloss = [];
    Path = Father(i);
    L2 = length(Path);
    for ii = 1:L2
        Link = Path{ii};
        LOLO = Link{1};
        Path_pkloss = [Path_pkloss LOLO(3)];
    end
    PacketLoss = sum(Path_pkloss);
    if PacketLoss < PPKLoss_Min
        %display(sprintf('Path %d has more packet loss than expected',i));
        Path_index = -1;
    else
        Path_index = [Path_index i];
    end    
end

end