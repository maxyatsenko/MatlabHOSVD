function datay=gety(data)
datay=zeros(size(data,1),size(data,2)/3);
y=2;
for i = 1:size(data,2)/3
    datay(:,i)=data(:,y);
    y=y+3;
end