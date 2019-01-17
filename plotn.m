function plotn(data)
k=size(data,2);
figure()
for i = 1:k
    subplot(1,k,i);
    plot(data(:,i),'.-');
    camroll(-90);
    axis off
end