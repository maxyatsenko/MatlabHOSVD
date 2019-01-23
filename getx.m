function datax=getx(data)
datax=zeros(size(data,1),size(data,2)/3);
y=1;
for i = 1:size(data,2)/3
    datax(:,i)=data(:,y);
    y=y+3;
end