function [dataSVD,variables]=doSVD(data,reshapingTo,precision)
dataSVD=reshape(data,[],reshapingTo);
[Uc,Sc,Vc]=svd(dataSVD);
plotsc(Sc);
n=cut(diag(Sc),precision);
%n=2;
[dataSVD,variables]=restoreSVD(n,Uc,Sc,Vc);
dataSVD=reshape(dataSVD,[],size(data,2));