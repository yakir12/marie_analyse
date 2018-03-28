function [track, feeder, strack, ind, turning_point, distance2tp, speed, path_length, cum_delta_angle] = analys_simple(track_file, calib_file, track_column, feeder_column, nest_column, step_length)
%% calibrate the data
[delta_time, track, feeder, nest] = get_calibrate(track_file, calib_file, track_column, feeder_column, nest_column);
%% center the track on the nest
[track, feeder] = center2nest(track, feeder, nest);
%% rotate to the feeder
[track, feeder] = rotate2feeder(track, feeder);
%% smooth the track
strack = smooth_track(track, step_length);
%% get path length and directions
[path_steps, path_length, cum_delta_angle] = pathlen_cumdelangle(strack);
%% detect the search point
theta_in_degrees = 45;
ind = search_turning_point(cum_delta_angle, theta_in_degrees);
turning_point = strack(ind,:);
%% distance to turnnig point -> speed
speed = path_steps(1:ind)./delta_time;
distance2tp = rssq(strack(1:ind,:) - turning_point, 2);
end