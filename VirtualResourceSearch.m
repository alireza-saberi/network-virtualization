function result = VirtualResourceSearch(Specs)
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

% NodeType: 1 = Virtual Router, 2 = Virtul Switch, 3 = Virtual Access point,
% 4 = Virtual Base Station 

% InterfaceType: 1 = Ethernet, 2 = Optical/Fiber, 3 = Radio(Wifi,WiMax), 4
% = ATM, % 5 = FrameRelay

% Operating Sytem : 1 = Linux, 2 = Windows, 3 = Solaris, 4 = UNIX

% Virtual Environment Type: 1 = VMWare, 2 = ZEn, 3 = KVM

% Network Stack Type: 1 = TCL/IP, 2 = UDP/IP, 3 = IP/ATM, 4= IP/Ethernet

%  Storage Type: 1 = SSD , 2 = HDD

% Link Virtual Technique : 1 = ATM, 2 = MPLS, 3 = Ethernet 802.1g, 4= VLAN

% Link Type : 1 = VLAN, 2 = SONET , 3 = 802.11
%==============================================================
% Alireza Saberi
% Concordia University, Montreal, QC, Canada
% 2009- 2011
%==============================================================
%  DATE :            October 2011                                
%  Last Updated:    
%  
%==============================================================

%display('Please enter the required specification')
%request = struct('NodeType', '--', 'InterfaceType', '--', 'OSType', '--', 'VirtualEnvironmentType', '--', 'NetworkStackType','--','StorageType','--','LinkVirTechnique','--','LinkType','--');

    NodeType = Specs(7);
    %input('Node Type:(1-4) ');
    InterfaceType = Specs(8);
    %input('Interface Type:(1-5) ');
    OSType = Specs(9);
    %input('OS Type:(1-4) ');
    VirtualEnvironmentType = Specs(10);
    %input('Virtual Environment Type:(1-3) ');
    NetworkStackType = Specs(11);
    %input('Network Stack Type:(1-4) ');
    StorageType = Specs(12);
    %input('Storage Type:(1-2) ');
    LinkVirTechnique = Specs(13);
    %input('Link Vir Technique:(1-4) ');
    LinkType = Specs(14);
    %input('Link Type:(1-3) ');
    
    Net= xlsread('VirtualResources.xlsx','Nodes');
 
    
    temp = Net(:,2);
    counter_NodeType = find(temp == NodeType);
       
    temp = Net(:,3);
    counter_InterfaceType = find(temp == InterfaceType);       
        
    temp = Net(:,4);
    counter_OSType = find(temp == OSType);
    
    temp = Net(:,5);
    counter_VirtualEnvironmentType = find(temp == VirtualEnvironmentType);
    
    temp = Net(:,6);
    counter_NetworkStackType = find(temp == NetworkStackType);
    
    temp = Net(:,7);
    counter_StorageType = find(temp == StorageType);
    
    temp = Net(:,8);
    counter_LinkVirTechnique = find(temp == LinkVirTechnique);
    
    temp = Net(:,9);
    counter_LinkType = find(temp == LinkType);
    
 temp = intersect(intersect(intersect(counter_NodeType,counter_InterfaceType),counter_OSType),counter_VirtualEnvironmentType);
 result = intersect(intersect(intersect(intersect(temp,counter_NetworkStackType),counter_StorageType),counter_LinkVirTechnique),counter_LinkType);
end