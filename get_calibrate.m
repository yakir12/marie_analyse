function [time, track, feeder, nest] = get_calibrate(track_file, calib_file, track_column, feeder_column, nest_column)
a = load(track_file, '-mat');

    function xy = calibrate(column)
        x = nonzeros(a.xdata(:,column));
        y = nonzeros(a.ydata(:,column));
        xy = dtrack_calibrate([x, y], calib_file)/10; % dividing by 10 because the calibration resulted into mm
        xy(:,3) = [];
    end

track = calibrate(track_column);
feeder = calibrate(feeder_column);
nest = calibrate(nest_column);
time = a.para.gui.stepsize/a.status.FrameRate;
% time = 0:t:(size(track,1) - 1)*t;
% time = nonzeros(a.tdata(:,4).*(1:length(a.tdata(:,4)))'/a.status.FrameRate);
end
