%% Project SVD wavelets search
close all
clear all
clc
%% Load Data
load('data.mat');
data=reshape(data,[],36);
%% Plot
datay=gety(data);
plotnarrive(datay,0);
%% SVD
waveletsizes=wavelet(datay,50);
plotnarrive(datay,waveletsizes);