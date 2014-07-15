VR=xlsread('VirtualResources.xlsx','Links');
[m,n]=size(VR);
packet_loss = 0.01+(0.02*rand(m,1));
s = sprintf('D2:D%d',m+1);
xlswrite('VirtualResources.xlsx',packet_loss,'Links',s);

