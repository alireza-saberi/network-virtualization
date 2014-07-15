function VirtualResourceAdder(NodeNumber)
% Function VirtualResourceAdder(NodeNumber) adds nodes to our network
% NodeNumber is the number of nodes which we like to add to our network
% 1- The result is saved into a MATLAB file called Network.mat
% Each node has the following leyer of specificayion ; 8 layers
% Layer 1:  NodeType:
% Layer 2:  InterfaceType:
% Layer 3:  Operating Sytem: 
% Layer 4:  Virtual Environment Type:
% Layer 5:  Network Stack Type:
% Layer 6:  Storage Type:
% Layer 7:  Link Virtual Technique:
% Layer 8:  Link Type:

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

load('NetWork.mat')
Base = struct('NodeType', '--', 'InterfaceType', '--', 'OSType', '--', 'VirtualEnvironmentType', '--', 'NetworkStackType','--','StorageType','--','LinkVirTechnique','--','LinkType','--');
Network2 = [];
for (i = 1:1:NodeNumber)
    Network2 = [Network2 Base];
end

for (j = 1:1:NodeNumber)
    display(sprintf('New Node Number %d ... ',j));
    
    Network2(j).NodeType = input('Node Type: ');
    Network2(j).InterfaceType = input('Interface Type: ');
    Network2(j).OSType = input('OS Type: ');
    Network2(j).VirtualEnvironmentType = input('Virtual Environment Type: ');
    Network2(j).NetworkStackType = input('Network Stack Type: ');
    Network2(j).StorageType = input('Storage Type: ');
    Network2(j).LinkVirTechnique = input('Link Vir Technique: ');
    Network2(j).LinkType = input('Link Type: ');
    
end

Network = [Network Network2];
save('NetWork.mat','Network')

end
