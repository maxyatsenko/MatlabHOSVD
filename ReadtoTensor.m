%% Creating a data tensor
clear all
close all
clc
%% Reading to tensor
'Reading...'
tensor=zeros(2000,36,24);
tensor(:,:,1)=readdata('st2p0001.txt','%f');
tensor(:,:,2)=readdata('st2p002.txt','%f');
tensor(:,:,3)=readdata('st2p013.txt','%f');
tensor(:,:,4)=readdata('st2p025.txt','%f');
tensor(:,:,5)=readdata('st4p001.txt','%f');
tensor(:,:,6)=readdata('st4p002.txt','%f');
tensor(:,:,7)=readdata('st4p013.txt','%f');
tensor(:,:,8)=readdata('st4p025.txt','%f');
tensor(:,:,9)=readdata('st5p001.txt','%f');
tensor(:,:,10)=readdata('st5p002.txt','%f');
tensor(:,:,11)=readdata('st5p013.txt','%f');
tensor(:,:,12)=readdata('st5p025.txt','%f');
tensor(:,:,13)=readdata('st6p001.txt','%f');
tensor(:,:,14)=readdata('st6p005.txt','%f');
tensor(:,:,15)=readdata('st6p010.txt','%f');
tensor(:,:,16)=readdata('st6p015.txt','%f');
tensor(:,:,17)=readdata('st7p003.txt','%f');
tensor(:,:,18)=readdata('st7p011.txt','%f');
tensor(:,:,19)=readdata('st7p013.txt','%f');
tensor(:,:,20)=readdata('st7p015.txt','%f');
tensor(:,:,21)=readdata('st7p019.txt','%f');
tensor(:,:,22)=readdata('145.txt','%f');
tensor(:,:,23)=readdata('245.txt','%f');
tensor(:,:,24)=readdata('data.txt','%f');
'Done!'
%% Getting x,y,z tensor
'Getting xyz tensor...'
xyztensor=zeros(2000,12,72);
xyztensor(:,:,1)=getx(tensor(:,:,1));
xyztensor(:,:,2)=gety(tensor(:,:,1));
xyztensor(:,:,3)=getz(tensor(:,:,1));
for i=2:24
    xyztensor(:,:,3*(i-1)+1)=getx(tensor(:,:,i));
    xyztensor(:,:,3*(i-1)+2)=gety(tensor(:,:,i));
    xyztensor(:,:,3*(i-1)+3)=getz(tensor(:,:,i));
end
'Done!'
%% Saving
'Saving...'
save('tensor24.mat','tensor', 'xyztensor');
'Done!'