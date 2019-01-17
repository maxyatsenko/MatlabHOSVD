function datax=getx(data)
datax=zeros(2000,12);
y=1;
for i = 1:12
    datax(:,i)=data(:,y);
    y=y+3;
end