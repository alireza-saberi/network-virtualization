warning('off','MATLAB:dispatcher:InexactCaseMatch')
clc
clear all;
close all;
%Setting of our excel files
display('Setting up our database ... ')
tic
setup_func()
toc
display('================================ ')

% getting desire specifications
display('Searching for functional attribute ...')
tic
Specs = xlsread('VNRnetwork.xlsx','Nodes');
[xSpec,ySpec] = size(Specs);
%n = input('How many nodes would like to check? ')
%functional_atribute_selected_nodes = [];
for i=1:xSpec
DN = VirtualResourceSearch(Specs(i,:)); 

% Part 2 
display(sprintf('Check the AC of the nodes/links, locations of the request node %d',i));
Filtering(DN,i);
display('================================ ')
%functional_atribute_selected_nodes = union(functional_atribute_selected_nodes,DN);
end
% functional_atribute_selected_nodes
toc

 display('================================ ')
 % % Part3
 tic
 display('Check the AC/delay/packetloss of the links of k-shortest path,and return the best one')
 aggregation()
 toc
 
