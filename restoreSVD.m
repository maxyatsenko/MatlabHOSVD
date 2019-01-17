function [dataSVD,variables]=restoreSVD(n, Uc, Sc, Vc)
Uc=Uc(:,1:n);
Sc=Sc(1:n, 1:n);
% Sc=diag(Sc);
Vc=Vc(:, 1:n);
%Vc=Vc(:, (size(Vc,2)-n+1):size(Vc,2));
variables=(size(Uc,1)*size(Uc,2))+(size(Vc,1)*size(Vc,2))+(size(diag(Sc),1));
%dataSVD=Uc(:,1:n)*Sc(1:n, 1:n)*Vc(:, 1:n)';
dataSVD=Uc*Sc*Vc';