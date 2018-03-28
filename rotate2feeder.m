function [track, feeder] = rotate2feeder(track, feeder)
alpha = -atan2(feeder(2), feeder(1))-pi/2;
rotmat = [cos(alpha), -sin(alpha); sin(alpha), cos(alpha)];
for i = 1:length(track)
    track(i, :) = rotmat*track(i, :)';
end
feeder = rotmat*feeder';
