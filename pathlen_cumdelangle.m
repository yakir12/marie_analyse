function [l, path_length, int_a] = pathlen_cumdelangle(xy)
dxy = diff(xy, 1, 1);
dxy = [dxy(1,:); dxy];
l = rssq(dxy, 2);
a = atan2(dxy(:,2), dxy(:,1));
delta = [0; angdiff(a)];
path_length = cumsum(l);
delta(path_length < 25) = 0;
int_a = cumsum(delta);
end