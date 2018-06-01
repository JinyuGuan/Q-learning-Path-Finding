function Q = Qlearning(RewardMatrix, paction, Map, N)

[AMap Mapdir] = MapMinimize(Map);
AMap = AMap./max(AMap);
NewAMap = AMap;

%target_state = 303;
alpha = 0.5;
%N = 20000;
state = 1;
Q = zeros(400, 4);
QmaxM = 0;
S = 0;
R = RewardMatrix;

for i = 1:N
    actions = find(paction(state, :) == 1);
    S = 0;
    Qmax = 0;
    QmaxM = 0;
    for j = 1:length(actions)
        S(j) = ActiontoState(state, actions(j), AMap);
        Qmax = max(Q(S(j), :));
        Q(state, actions(j)) = 0.7*Q(state, actions(j)) + 0.3*(R(state, actions(j)) + 0.8*Qmax);
        QmaxM = [QmaxM Qmax];
    end
    %%%%%%%%%%%%%%%%%%%%
    % Generate New State
    [m n] = max(QmaxM);
    if(max(max(Q)) > 180)
        alpha = 0.99;
    else
        if(alpha ~=0.99)
            alpha = 0.9;
        end
    end
    if(rand(1) < alpha | n == 1)
        %state_old = state;
        a = unidrnd(length(actions));
        state = S(a);
    else
        %state_old = state;
        state = S(n - 1);
        %if(abs(state - target_state) < 20)
        %    R(state_old, actions(a)) = 10;
        %end
    end
    %%%%%%%%%%%%%%%%%%%%
    plot(i, max(max(Q)), 'bo')
    hold on
    %NewAMap = LearningProgressImage(state, NewAMap, Map, i);
end

end