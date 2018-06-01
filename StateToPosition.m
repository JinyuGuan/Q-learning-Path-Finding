function [py px] = StateToPosition(state, AMap)
AMapsize = size(AMap);
px = mod(state, AMapsize(2));
py = fix(state/AMapsize(2)) + 1;
if(px == 0)
    px = 20;
    py = py - 1;
end
end