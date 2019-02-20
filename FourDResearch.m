%% 4D matrix research
close all;
clear all;
clc;
%% Load Data
% load synthetic data tensor
load('SynthGoUp.mat');
% get 5 different sources (go up 1 meter every time)
source1=zeros(1000,10,3);
source2=zeros(1000,10,3);
source3=zeros(1000,10,3);
source4=zeros(1000,10,3);
source5=zeros(1000,10,3);
source1(:,:,:)=trc(1,:,:,:);
source2(:,:,:)=trc(2,:,:,:);
source3(:,:,:)=trc(3,:,:,:);
source4(:,:,:)=trc(4,:,:,:);
source5(:,:,:)=trc(5,:,:,:);
% visualize 3D
figure();
slice3(source1);
caxis([-0.001 0.001])
% create 4D tensor out of the data (no changes)
k=3;
n=12;
tensor4D=zeros(1000,10,3,n);
for i=1:k
    tensor4D(:,:,:,i)=oneeventtens;
end
for i=k+1:n
    tensor4D(:,:,:,i)=twoeventtens;
end
%% Plot
% select x, y, z components of the data
% datax=getx(data);
% datay=gety(data);
% dataz=getz(data);
% plot the whole data matrix
plotn(oneeventtens(:,:,1))
plotn(twoeventtens(:,:,1))
% plot just the x component of the data matrix
% plotn(datax);
% visualize the whole tensor of data (experimental)
% figure();
% slice3(eventtensor);
% caxis([-1 1])
%% Tensorization
% combine separated matrices of x, y, z into one 3D tensor here
% datatensor=zeros(size(datax,1),size(datax,2),3);
% datatensor(:,:,1)=datax;
% datatensor(:,:,2)=datay;
% datatensor(:,:,3)=dataz;
%% SVD
% [dataSVDy,varY96]=doSVD2(datay,96,0.95);
% plotn(dataSVDy);
% err=errors(datay,dataSVDy,900);
%% HOSVD
%dataMLSVD=reshape(datapy,[],96);
%[Ue,Se,sve]=mlsvd(dataMLSVD,[n,n]);
[Ue,Se,sve]=mlsvd(tensor4D);
plotsve(sve);
%plot the fourth matrix
figure()
image(Ue{1,4},'CDataMapping','scaled')
colorbar
title('Pressure Distribution in Layer ')
set(gca,'FontSize', 12)
% [Uetrunc, Setrunc,ntensor]=truncate(Ue,Se,sve,0.005);
% [Uexyz,Sexyz,svexyz]=mlsvd(xyztensor);
% plotsve(svexyz);
% [Uetruncxyz, Setruncxyz,nxyztensor]=truncate(Uexyz,Sexyz,svexyz,0.005);
% newtensor=lmlragen(Uetrunc,Setrunc);
% newxyztensor=lmlragen(Uetruncxyz,Setruncxyz);
% tensor3D=zeros(2000,36,24);
% for i=1:24
%     tensor3D(1:1000,:,i)=newtensor(:,:,1,i);
%     tensor3D(1001:2000,:,i)=newtensor(:,:,2,i);
% end
%% Error
% err1=1-(frob(newtensor)/frob(tensor));
% var1=(size(Uetrunc{1},1)*size(Uetrunc{1},2))+(size(Uetrunc{2},1)*...
% size(Uetrunc{2},2))+(size(Uetrunc{3},1)*size(Uetrunc{3},2))+...
% (size(Setrunc,1)*size(Setrunc,2)*size(Setrunc,3));
% reduction1=1-(var1/(size(tensor,1)*size(tensor,2)*size(tensor,3)));
% err2=1-(frob(newxyztensor)/frob(xyztensor));
% var2=(size(Uetruncxyz{1},1)*size(Uetruncxyz{1},2))+...
% (size(Uetruncxyz{2},1)*size(Uetruncxyz{2},2))+(size(Uetruncxyz{3},1)*...
% size(Uetruncxyz{3},2))+(size(Setruncxyz,1)*size(Setruncxyz,2)*...
% size(Setruncxyz,3));
% reduction2=1-(var2/(size(xyztensor,1)*size(xyztensor,2)*...
% size(xyztensor,3)));
%% Exporting
% save('HOSVDresults.mat','Ue','Se','sve');
% save('dataSVD.mat','Uc','Sc','Vc');
% fileID = fopen('data.txt','w');
% formatSpec = '%.15f\n';
% fprintf(fileID,formatSpec,data);
% fclose(fileID);