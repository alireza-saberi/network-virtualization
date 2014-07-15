function result =NodeSearch()
% Function NodeSearch() reseraches nodes to our network
% The result is the node number
% Search is based on node specification that user gives to it
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




diplay('Please enter the required specification')
request = struct('NodeType', '--', 'InterfaceType', '--', 'OSType', '--', 'VirtualEnvironmentType', '--', 'NetworkStackType','--','StorageType','--','LinkVirTechnique','--','LinkType','--');

    request.NodeType = input('Node Type: ');
    request.InterfaceType = input('Interface Type: ');
    request.OSType = input('OS Type: ');
    request.VirtualEnvironmentType = input('Virtual Environment Type: ');
    request.NetworkStackType = input('Network Stack Type: ');
    request.StorageType = input('Storage Type: ');
    request.LinkVirTechnique = input('Link Vir Technique: ');
    request.LinkType = input('Link Type: ');
    
    
    load('SabaNetWork.mat')
    Nodes = Network;
    
    counter_NodeType = [];
    counter_InterfaceType  = [];
    counter_OSType  = []; 
    counter_VirtualEnvironmentType = [];
    counter_NetworkStackType  = []; 
    counter_StorageType = [];
    counter_LinkVirTechnique = [];
    counter_LinkType = [];
    
    
    for k=1:length(Nodes)
        
    if (request.NodeType == Nodes.NodeType(k)
        counter_NodeType = [counter_NodeType k];
    end    
     
    if (request.InterfaceTyp == Nodes.InterfaceType(k)
        counter_InterfaceType = [counter_InterfaceType k];
    end     
    
    if (request.OSType == Nodes.OSType(k)
        counter_OSType = [counter_OSType k];
    end  
    
    if (request.VirtualEnvironmentType == Nodes.VirtualEnvironmentType(k)
        counter_VirtualEnvironmentType = [counter_VirtualEnvironmentType k];
    end  
    
    if (request.NetworkStackType == Nodes.NetworkStackType(k)
        counter_NetworkStackType = [counter_NetworkStackType k];
    end 
    if (request.StorageType == Nodes.StorageType(k)
        counter_StorageType = [counter_StorageType k];
    end  
    
    if (request.LinkVirTechnique == Nodes.LinkVirTechnique(k)
        counter_LinkVirTechnique = [counter_LinkVirTechnique k];
    end
    
     if (request.LinkType == Nodes.LinkType(k)
        counter_LinkType = [counter_LinkType k];
    end  
         
    end
 temp = intersect(intersect(intersect(counter_NodeType,counter_InterfaceType),counter_OSType),counter_VirtualEnvironmentType);
 result = intersect(intersect(intersect(intersect(temp,counter_NetworkStackType),counter_StorageType),counter_LinkVirTechnique),counter_LinkType);
end