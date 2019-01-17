%% HOSVD Project
close all;
clear all;
clc;
%% Load Data
%data10=readdata('st5p013.txt','%f');
%save('10.mat','data10');
load('datatensor10.mat');
%data=reshape(data,[],36);
%% Plot
%datay=gety(data);
%plotn(T(:,:,1));
%plotn(datay);
%% SVD
%if closer to a square -> 96
% [dataSVDy,varY96]=doSVD2(datay,96,0.95);
% plotn(dataSVDy);
% err=errors(datay,dataSVDy,900);
%% HOSVD
%dataMLSVD=reshape(datapy,[],96);
%[Ue,Se,sve]=mlsvd(T,[n,n]);
[Ue,Se,sve]=mlsvd(T);
figure()
for i = 1:3
    subplot(1,3,i);
    plot(sve{i},'.-');
    xlim([1 length(sve{i})])
end
Uetrunc{1} = Ue{1}(:,1:100);
Uetrunc{2} = Ue{2}(:,1:36);
Uetrunc{3} = Ue{3}(:,1:10);
Setrunc = Se(1:100, 1:36, 1:10);
%dataMLSVD=lmlragen(Ue,Se);
dataMLSVD=lmlragen(Uetrunc,Setrunc);
Error=T-dataMLSVD;
% dataMLSVD=reshape(dataMLSVD,[],12);
% figure()
% for i = 1:12
%     subplot(1,12,i);
%     plot(dataMLSVD(:,i),'.-');
%     camroll(-90);
%     axis off
% end
%% Exporting
% save('dataSVD.mat','Uc','Sc','Vc');
% save('dataMLSVD.mat','Ue','Se');
% fileID = fopen('data.txt','w');
% formatSpec = '%.15f\n';
% fprintf(fileID,formatSpec,data);
% fclose(fileID);