function plotnarrive(data,temp2)
if temp2==0
    k=size(data,2);
    temp=[1039 1029 1020 1019 1003 992 984 970 961 955 942 939];
    figure()
    for i = 1:k
    subplot(1,k,i);
    plot(data(:,i),'.-');
    camroll(-90);
    axis off
    hold on
    scatter(temp(1,i),0,100,'MarkerFaceColor',[0 .7 1],'LineWidth',5)
    hold off
    end
else
    k=size(data,2);
    temp=[1039 1029 1020 1019 1003 992 984 970 961 955 942 939];
    figure()
    for i = 1:k
    subplot(1,k,i);
    plot(data(:,i),'.-');
    camroll(-90);
    axis off
    hold on
    scatter(temp(1,i),0,100,'MarkerFaceColor',[0 .7 1],'LineWidth',5)
    hold on
    scatter(temp2(1,i),0,100,'MarkerFaceColor',[0 .7 1],'LineWidth',5)
    hold off
    end
end