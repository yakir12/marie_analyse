function xys = smooth_track(xy, step)
factor = 10;
n = min(round(0.3*length(xy)), 100);
mean_length = mean(rssq(diff(xy(1:n, :), 1, 1), 2));
% the smoothing window, bigger is smoother
win = factor*ceil(mean_length/step);
if mod(win, 2) == 0
    win = win-1;
end
% the order of the polynomial fit, bigger is more complex
o = min(3, win-1);
% smooth it
xl = sgolayfilt(xy(:,1), o, win);
yl = sgolayfilt(xy(:,2), o, win);
xys = [xl, yl];
end