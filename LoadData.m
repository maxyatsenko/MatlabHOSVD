close all;
clear all;
clc;
%% Load Data
%data10=readdata('st5p013.txt','%f');
%save('10.mat','data10');
load('tensor24.mat');
data=tensor(:,:,1);
%distrcheck(data, 0);
%data=reshape(data,[],36);
%% Plot
% datay=gety(data);
plotn(data);
% plotn(datay);
%% SVD
%if closer to a square -> 96
[dataSVDy,varY96]=doSVD(data,96,0.95);
plotn(dataSVDy);
err=errors(datay,dataSVDy,900);
%% Exporting
% save('dataSVD.mat','Uc','Sc','Vc');
% save('dataMLSVD.mat','Ue','Se');
% fileID = fopen('data.txt','w');
% formatSpec = '%.15f\n';
% fprintf(fileID,formatSpec,data);
% fclose(fileID);