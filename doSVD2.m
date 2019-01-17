function [dataSVD,variables]=doSVD2(data,reshapingTo,precision)
dataSVD=reshape(data,[],reshapingTo);
[Uc,Sc,Vc]=svd(dataSVD);
plotsc(Sc);
n=cut(diag(Sc),precision);
[dataSVD,variables]=restoreSVD2(n,Uc,Sc,Vc);
dataSVD=reshape(dataSVD,[],size(data,2));