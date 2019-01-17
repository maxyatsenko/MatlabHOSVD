function dataz=getz(data)
dataz=zeros(2000,12);
y=3;
for i = 1:12
    dataz(:,i)=data(:,y);
    y=y+3;
end