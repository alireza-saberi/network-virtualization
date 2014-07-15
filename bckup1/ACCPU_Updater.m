function Net = ACCPU_Updater(Net,result,required_AC)

% Function ACCPU_Updater(result) updates our network nodes availble
% capacity
% result is the input node number matrix

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
AC_old= Net(:,11);
AC_New = AC_old(result)- required_AC;
Net(result,11) = AC_New;

end