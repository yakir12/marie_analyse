function plot_search_density(x, y, filename)
delta = 5;
w = 50;
dat = [x y];
M = ((0.5 + ceil((w - delta/2)/delta))*delta);
bins = delta/2:delta:M;
bins = [fliplr(-bins), bins];
N = hist3(dat, 'Edges', {bins, bins});
hf = figure('color','w');
pcolor(bins,bins,N)
box on
hold on
shading flat
h1 = gca;
set(h1, 'XAxisLocation', 'top', 'YAxisLocation', 'left', 'xtick', linspace(-w, w, 5), 'ytick', linspace(-w, w, 5))
title('Search density centered on nest')
extrema = [min(bins), max(bins)];
plot(h1, extrema, zeros(1,2), 'color', 'w')
plot(h1, zeros(1,2), extrema, 'color', 'w')
xlim([-w,w])
ylim([-w,w])
xlabel('X (cm)')
ylabel('Y (cm)')
clim1 = get(h1, 'clim');
hc = colorbar(h1, 'Location', 'westoutside', 'ticks', linspace(clim1(1), clim1(2), 3), 'ticklabels', {'0','0.5','1'});
ylabel(hc, 'Relative frequency of search')
set(h1,'units','pix') 
p = get(h1,'position');
height = 80;
p(2) = p(2) - 1.1*height;
p(4) = height;
h2 = axes;
y = sum(N,1);
plot(h2, bins, y, 'k', 'linewidth',2)
hold on
f = createFit(bins, y);
fwhmx = 2*sqrt(2*log(2))*f.c1/sqrt(2);
yhat = feval(f,bins);
plot(h2, bins, yhat, 'r', 'linewidth',2)
plot([-fwhmx, fwhmx]/2 + f.b1, [f.a1, f.a1]/2, 'color', [0.5,0.5,0.5])
text(f.b1, f.a1/2, sprintf('%icm', round(fwhmx)), 'HorizontalAlignment', 'center', 'BackgroundColor', 'w', 'fontsize',8, 'margin',1)
set(h2, 'units', 'pix', 'Position', p, 'ydir', 'reverse', 'visible','off', 'xlim', [-w,w])
p = get(h1,'position');
p(1) = p(1) + p(3) + 0.1*height;
p(3) = height;
h2 = axes;
y = sum(N,2)';
plot(h2, y, bins, 'k', 'linewidth',2)
hold on
f = createFit(bins, y);
fwhmx = 2*sqrt(2*log(2))*f.c1/sqrt(2);
y = feval(f, bins);
plot(h2, y, bins, 'r', 'linewidth',2)
plot([f.a1, f.a1]/2, [-fwhmx, fwhmx]/2 + f.b1, 'color', [0.5,0.5,0.5])
text(f.a1/2, f.b1, sprintf('%icm', round(fwhmx)),'Rotation', -90, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'BackgroundColor', 'w', 'fontsize',8, 'margin',1)
set(h2, 'units', 'pix', 'Position', p, 'visible','off', 'ylim', [-w,w])
saveas(hf, fullfile('img', filename))
end