clear all
h=[0 10 20 30 40 50 60 70 80 90];
c=1;
er0=100;

i1u=1;
i2u=1;
i3u=5;

trc=zeros(i1u*i2u*i3u,1000,10,3);

for i1=1:i1u
    for i2=1:i2u
        for i3=1:i3u
            er=er0+rand*1000;
            
            xp=-i1-29;
            yp=i2-1;
            zp=3+7*i3;
            
            pa=rand;
            spr=rand;
            
            for i=1:10
                vec=[-xp -yp h(i)-zp];
                r(i)=norm(vec);
                p(i,1:3)=vec/r(i);
                vecn=[0 h(i)-zp yp];
                if norm(vecn)==0
                    ps=[0 0 0];
                else
                    ps=cross(p(i,1:3),vecn);
                    ps=ps/norm(ps);
                end
                rn=(20/r(i))^0.5;
                angv=dot(p(i,1:3),[1 0 0]);
                rp=pa*angv;
                rs=rp*spr*sqrt(1-angv^2);
                for t=1:1000
                    trt(t,i,1)=rp*pwf(t/10-r(i)/2,rn)*p(i,1)*(r(i)/10)^(-2)+rs*swf(t/10-r(i),rn)*ps(1)*(r(i)/10)^(-2)+(rand-0.5)/er;
                    trt(t,i,2)=rp*pwf(t/10-r(i)/2,rn)*p(i,2)*(r(i)/10)^(-2)+rs*swf(t/10-r(i),rn)*ps(2)*(r(i)/10)^(-2)+(rand-0.5)/er;
                    trt(t,i,3)=rp*pwf(t/10-r(i)/2,rn)*p(i,3)*(r(i)/10)^(-2)+rs*swf(t/10-r(i),rn)*ps(3)*(r(i)/10)^(-2)+(rand-0.5)/er;
                end
            end
            trc(i3+(i2-1)*i3u+(i1-1)*i3u*i2u,:,:,:)=trt;
        end
    end
end




