function h = plotone(track, strack, feeder, ind, turning_point, distance2tp, speed, path_length, cum_delta_angle)
h = figure;
n = size(track, 1);
l = min(n, ind + 30);
scatter(track(1:l,1), track(1:l,2), 10, 1:l, 'filled')
hold on
plot(strack(1:l, 1), strack(1:l, 2), 'm')
scatter(feeder(1), feeder(2), 'c', 'filled', 's')
scatter(turning_point(1), turning_point(2), 'r', 'filled', 'd')
scatter(0, 0, 'g', 'filled', 'p')
legend('track', 'smooth', 'feeder', 'search', 'nest', 'Location','northeastoutside')
xlabel('cm')
ylabel('cm')
title(sprintf('Search-nest= %i cm', round(norm(turning_point))))
axis equal
% %% speed
% figure
% scatter(strack(:,1), strack(:,2), 10, smooth(speed, 100), 'filled')
% hold on
% c = colorbar;
% c.Label.String = 'Speed (cm/s)';
% h1 = scatter(feeder(1), feeder(2), 'c', 'filled', 's');
% h2 = scatter(turning_point(1), turning_point(2), 'r', 'filled', 'd');
% h3 = scatter(0, 0, 'g', 'filled', 'p');
% legend([h1, h2, h3], 'feeder', 'search', 'nest', 'Location','northeastoutside')
% xlabel('cm')
% ylabel('cm')
% title('Speed profile')
% axis equal
%% search density
% figure
% h = scatterhist(xs, ys, 'Location','SouthEast', 'Direction','out', 'Kernel','on');
% axis(h(1), 'equal')
% xlabel(h(1), 'cm')
% ylabel(h(1), 'cm')
% xlim = get(h(1), 'xlim');
% ylim = get(h(1), 'ylim');
% h(1).Children.XData = [];
% h(1).Children.YData = [];
% set(h(1), 'xlim', xlim)
% set(h(1), 'ylim', ylim)
% dat = [ys xs];
% nbins = 25;
% xbins = linspace(xlim(1), xlim(2), nbins);
% ybins = linspace(ylim(1), ylim(2), nbins);
% n = hist3(dat, 'Edges', {ybins, xbins}); % default is to 10x10 bins
% hold on
% pcolor(xbins,ybins,n);
% h1 = scatter(xf, yf, 'c', 'filled', 's');
% h2 = scatter(xt, yt, 'r', 'filled', 'd');
% h3 = scatter(xbc, ybc, 'g', 'filled', 'p');
% legend([h1, h2, h3], 'feeder', 'search', 'nest','Location','northoutside')
% hold off
end
