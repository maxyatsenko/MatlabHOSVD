function datay=gety(data)
datay=zeros(2000,12);
y=2;
for i = 1:12
    datay(:,i)=data(:,y);
    y=y+3;
end