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
% create 4D tensor out of the data
% ni - i-th source is at position ni of the 4Dtensor
n2=2;
n3=4;
n4=4;
n5=5;
nend=n5;
nochange=false;
nothird=false;
nofourth=true;
nofifth=true;
% which one to pick if no change in time?
source=source2;
tensor4D=zeros(1000,10,3,nend);
if nochange==false
    for i=1:n2-1
        tensor4D(:,:,:,i)=source1;
    end
    for i=n2:n3-1
        tensor4D(:,:,:,i)=source2;
    end
    if nothird==false
        for i=n3:n4-1
            tensor4D(:,:,:,i)=source3;
        end
        if nofourth==false
            for i=n4:n5-1
                tensor4D(:,:,:,i)=source4;
            end
            if nofifth==false
                for i=n5:nend
                    tensor4D(:,:,:,i)=source5;
                end
            else
                for i=n5:nend
                    tensor4D(:,:,:,i)=source4;
                end
            end
        else
            for i=n4:nend
                tensor4D(:,:,:,i)=source3;
            end
        end 
    else
        for i=n3:nend
            tensor4D(:,:,:,i)=source2;
        end
    end
else
    for i=1:nend
        tensor4D(:,:,:,i)=source;
    end
end
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
