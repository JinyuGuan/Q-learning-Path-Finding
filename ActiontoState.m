function NewState = ActiontoState(state, action, AMap)
AMapsize = size(AMap);
if(action == 1)
    NewState = state - AMapsize(1);
end

if(action == 2)
    NewState = state + AMapsize(1);
end

if(action == 3)
    NewState = state - 1;
end

if(action == 4)
    NewState = state + 1;
end

end