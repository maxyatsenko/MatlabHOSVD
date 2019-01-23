function dataz=getz(data)
dataz=zeros(size(data,1),size(data,2)/3);
y=3;
for i = 1:size(data,2)/3
    dataz(:,i)=data(:,y);
    y=y+3;
end