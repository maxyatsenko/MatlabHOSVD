function plotsc(Sc)
figure()
plot(diag(Sc./Sc(1,1)))
title('Graph of Normalized Values of Sc')
% figure()
% semilogy(diag(Sc./Sc(1,1)))
% title('Semi-log Graph of Normalized Values of Sc')