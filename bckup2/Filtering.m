function Filtering(input_nodes,kk)% change = input_nodes
% Function Filtering(input_nodes) filters our network nodes, based on
% available capacity, and distances of the nodes, and then gives new row
% vector of nodes
%==============================================================
% Saba Behrouznia
% Concordia University, Montreal, QC, Canada
% 2011- 2013
%==============================================================
%  DATE :            October 2013                                 
%  Last Updated:    
%  ---- Changes month day year: ----
%  Nobmber 2013
%==============================================================
Net= xlsread('VirtualResources.xlsx','Nodes');
NN = xlsread('VNRnetwork.xlsx','Nodes');
LL = xlsread('VNRnetwork.xlsx','Links');
source = LL(:,5);
destination = LL(:,6);
    
%[R1, C1] = size(NN);
%for kk = 1:R1
    
    index_temp1 = find(source == kk);
    index_temp2 = find(destination == kk);
    
    %display(sprintf('Reading the request of node no. %d from virtial network ....',kk));
    
    required_AC = NN(kk,2);
    display('AC check')
    index1 = ACCPU_Checker(Net,input_nodes,required_AC);
    if index1 == -1 
        display('Node doesnt match with node AC requirements!');
        NN(kk,6)=-1;
        LL(index_temp1,7) = -1;
        LL(index_temp2,8) = -1;
    end
    
%     required_X = input('Required X is: ');
%     required_Y = input('Required Y is: ');
%     required_D = input('Required tolarable distance is: ');
    required_X = NN(kk,3);
    required_Y = NN(kk,4);
    required_D = NN(kk,5);
%     index2 = Distance_Checker(Net,required_X,required_Y,required_D);
    display('Distance check')
    index2 = Distance_Checker(Net,input_nodes,required_X,required_Y,required_D);
    if index2 == -1 
        display('Node doesnt match with node distance requirements!');
        NN(kk,6)=-1;
        LL(index_temp1,7) = -1;
        LL(index_temp2,8) = -1;
    end
    index3 = intersect(index1,index2);
    if (isempty(index3)) 
        index3 = -1;
        LL(index_temp1,7) = -1;
        LL(index_temp2,8) = -1;      
    end    
    if (index3 == -1)
        display('Node doesnt match with node AC and distance requirements!');
    end 
    
    display('AR check');
    if(index3 ~= -1 )
        result = ARChecker(Net,index3)
        display(sprintf('Node %d is selected from our virtual resource to build our virtual network ',result))
        NN(kk,6)= result;
        LL(index_temp1,7) = result;
        LL(index_temp2,8) = result;
        Net = ACCPU_Updater(Net,result,required_AC);
        [m2,n2] = size(Net);
        s1 = sprintf('A2:M%d',m2+1);
        xlswrite('VirtualResources.xlsx',Net,'Nodes',s1);
    end     
 % end   


    [m3,n3] = size(NN);
    s2 = sprintf('A2:N%d',m3+1);
    xlswrite('VNRnetwork.xlsx',NN,'Nodes',s2);
    [m4,n4] = size(LL);
    s3 = sprintf('A2:H%d',m4+1);
    xlswrite('VNRnetwork.xlsx',LL,'Links',s3);
 
end