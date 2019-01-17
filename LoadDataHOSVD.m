close all;
clear all;
clc;
%% Load Data HOSVD
load('tensor24.mat');
%distrcheck(tensor, 0);
%tensor4D=zeros(1000,36,2,24);
% for i=1:24
%     tensor4D(:,:,1,i)=tensor(1:1000,:,i);
%     tensor4D(:,:,2,i)=tensor(1001:2000,:,i);
% end
%% Plot
plotn(tensor(:,:,3));
plotn(xyztensor(:,:,7));
figure();
slice3(10000.*tensor);
caxis([-10 10])
%% HOSVD
%dataMLSVD=reshape(datapy,[],96);
%[Ue,Se,sve]=mlsvd(dataMLSVD,[n,n]);
[Ue,Se,sve]=mlsvd(tensor);
plotsve(sve);
[Uetrunc, Setrunc,ntensor]=truncate(Ue,Se,sve,0.005);
[Uexyz,Sexyz,svexyz]=mlsvd(xyztensor);
plotsve(svexyz);
[Uetruncxyz, Setruncxyz,nxyztensor]=truncate(Uexyz,Sexyz,svexyz,0.005);
newtensor=lmlragen(Uetrunc,Setrunc);
newxyztensor=lmlragen(Uetruncxyz,Setruncxyz);
tensor3D=zeros(2000,36,24);
% for i=1:24
%     tensor3D(1:1000,:,i)=newtensor(:,:,1,i);
%     tensor3D(1001:2000,:,i)=newtensor(:,:,2,i);
% end
%% Error
err1=1-(frob(newtensor)/frob(tensor));
var1=(size(Uetrunc{1},1)*size(Uetrunc{1},2))+(size(Uetrunc{2},1)*...
size(Uetrunc{2},2))+(size(Uetrunc{3},1)*size(Uetrunc{3},2))+...
(size(Setrunc,1)*size(Setrunc,2)*size(Setrunc,3));
reduction1=1-(var1/(size(tensor,1)*size(tensor,2)*size(tensor,3)));
err2=1-(frob(newxyztensor)/frob(xyztensor));
var2=(size(Uetruncxyz{1},1)*size(Uetruncxyz{1},2))+...
(size(Uetruncxyz{2},1)*size(Uetruncxyz{2},2))+(size(Uetruncxyz{3},1)*...
size(Uetruncxyz{3},2))+(size(Setruncxyz,1)*size(Setruncxyz,2)*...
size(Setruncxyz,3));
reduction2=1-(var2/(size(xyztensor,1)*size(xyztensor,2)*...
size(xyztensor,3)));
%% Exporting
% save('dataSVD.mat','Uc','Sc','Vc');
% save('dataMLSVD.mat','Ue','Se');
% fileID = fopen('data.txt','w');
% formatSpec = '%.15f\n';
% fprintf(fileID,formatSpec,data);
% fclose(fileID);