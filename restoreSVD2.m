function [dataSVD,variables]=restoreSVD2(n, Uc, Sc, Vc)
%% Removing the first (valuable) part
Uc=Uc(:,(size(Uc,2)-n+1):size(Uc,2));
a=min(size(Sc,1),size(Sc,2));
Sc=Sc((a-n+1):a, (a-n+1):a);
Vc=Vc(:,(size(Vc,2)-n+1):size(Vc,2));
variables=(size(Uc,1)*size(Uc,2))+(size(Vc,1)*size(Vc,2))+(size(diag(Sc),1));
dataSVD=Uc*Sc*Vc';
%% Removing the middle
% Uc=Uc(:,((size(Uc,2)/2)-n/2):(((size(Uc,2)/2)+n/2)-1));
% a=min(size(Sc,1),size(Sc,2));
% Sc=Sc((a/2)-n/2:(((a/2)+n/2)-1),((a/2)-n/2):(((a/2)+n/2)-1));
% Vc=Vc(:,((size(Vc,2)/2)-n/2):(((size(Vc,2)/2)+n/2)-1));
% variables=(size(Uc,1)*size(Uc,2))+(size(Vc,1)*size(Vc,2))+(size(diag(Sc),1));
% dataSVD=Uc*Sc*Vc';