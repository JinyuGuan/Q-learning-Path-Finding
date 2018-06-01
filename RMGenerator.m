function RewardMatrix = RMGenerator(paction, target, AMap)
AMapsize = size(AMap);

px = target(1);
py = target(2);

A = paction;
R = A - 1;

target_state = (py - 1)*AMapsize(1) + px;

for i = 1:length(A)
    actions = find(A(i, :) == 1);
    for j = 1: length(actions)
        S = ActiontoState(i, actions(j), AMap);
        if(S ~= target_state)
           % Newstate(i, S + 1) = 1;
            R(i, actions(j)) = 0;
        else
           % Newstate(i, S + 1) = 1;
            R(i, actions(j)) = 100;
        end
    end
end

RewardMatrix = R;

end