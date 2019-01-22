clear all
h=[0 10 20 30 40 50 60 70 80 90];
xp=[-10 -20 -30 -40 -50];
yp=[-2 -1 0 1 2];
zp=[21 22 23 24 25];
br=1;
for i=1:5
    for j=1:5
        for k=1:5
            p=zeros(10,3);
            r=zeros(10,1);
            trc=zeros(1000,30);
            for l=1:10
                vec=[-xp(i) -yp(j) h(l)-zp(k)];
                r(l)=norm(vec);
                p(l,1:3)=vec/r(l);
                ps=cross(p(l,1:3),[0 1 0]);
                for t=1:1000
                    trc(t,1+(l-1)*3)=pwf(t/10-r(l)/2)*p(l,1)*(r(l)/10)^(-2)+swf(t/10-r(l))*ps(1)*(r(l)/10)^(-2);
                    trc(t,2+(l-1)*3)=pwf(t/10-r(l)/2)*p(l,2)*(r(l)/10)^(-2)+swf(t/10-r(l))*ps(2)*(r(l)/10)^(-2);
                    trc(t,3+(l-1)*3)=pwf(t/10-r(l)/2)*p(l,3)*(r(l)/10)^(-2)+swf(t/10-r(l))*ps(3)*(r(l)/10)^(-2);
                end
            end
            P{br}=p;
            R{br}=r;
            T{br}=trc;
            br=br+1;
        end
    end
end

eventtensor=zeros(1000,30,125);

for i=1:125
    eventtensor(:,:,i)=T{1,i};
end

ph=T{10};
for i=0:0.1:10
    plt=ph(1:1000,5*3+1);
end
plot(plt);
