function NetworkMaker(NodeNumber)
% Function NetworkMaker(NodeNumber) makes our network
% NodeNumber is the number of nodes in the network
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
% Alireza Saberi
% Concordia University, Montreal, QC, Canada
% 2009-2011
%==============================================================
%  DATE :            October 2011                                 
%  Last Updated:    
%  ---- Changes month day year: ----
%  
%==============================================================
Base = struct('NodeType', '--', 'InterfaceType', '--', 'OSType', '--', 'VirtualEnvironmentType', '--', 'NetworkStackType','--','StorageType','--','LinkVirTechnique','--','LinkType','--');
Network = [];
for (i = 1:1:NodeNumber)
    Network = [Network Base];
end

for (j = 1:1:NodeNumber)
    display(sprintf('Node Number %d ... ',j));
    Network(j).NodeType = input('Node Type: ');
    Network(j).InterfaceType = input('Interface Type: ');
    Network(j).OSType = input('OS Type: ');
    Network(j).VirtualEnvironmentType = input('Virtual Environment Type: ');
    Network(j).NetworkStackType = input('Network Stack Type: ');
    Network(j).StorageType = input('Storage Type: ');
    Network(j).LinkVirTechnique = input('Link Vir Technique: ');
    Network(j).LinkType = input('Link Type: ');
    
end
save('NetWork.mat','Network')
% FileName = 'NetWork.xlsx';
% struct2xls(FileName,Network,'Col','A');
%xlswrite(FileName,Network);
end