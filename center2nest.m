function [track, feeder] = center2nest(track, feeder, nest)
track = track - nest;
feeder = feeder - nest;
