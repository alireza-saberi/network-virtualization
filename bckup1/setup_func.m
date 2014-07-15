function setup_func()

Net= xlsread('VirtualResources.xlsx','Nodes');
[x1,y1] = size(Net);
Net(:,11)=Net(:,10);
s1 = sprintf('A2:M%d',x1+1);
xlswrite('VirtualResources.xlsx',Net,'Nodes',s1);

link= xlsread('VirtualResources.xlsx','Links');
[x2,y2] = size(link);
link(:,8) = link(:,2);
s2 = sprintf('A2:H%d',x2+1);
xlswrite('VirtualResources.xlsx',link,'Links',s2);

Net2= xlsread('VNRnetwork.xlsx','Nodes');
[x1,y1] = size(Net2);
Net2(:,6)=zeros(x1,1);
s12 = sprintf('A2:N%d',x1+1);
xlswrite('VNRnetwork.xlsx',Net2,'Nodes',s12);

Net3= xlsread('VNRnetwork.xlsx','Links');
[x1,y1] = size(Net3);
Net3(:,7)=zeros(x1,1);
Net3(:,8)=zeros(x1,1);
s13 = sprintf('A2:H%d',x1+1);
xlswrite('VNRnetwork.xlsx',Net3,'Links',s13);



end