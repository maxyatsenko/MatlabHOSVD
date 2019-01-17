function plotsve(sve)
figure()
for i = 1:size(sve,2)
    subplot(1,size(sve,2),i);
    plot(sve{i}./sve{i}(1,1),'.-');
    xlim([1 length(sve{i})])
    set(gca, 'FontSize', 14)
end
%suptitle('Graph of Normalized Values of Sve')