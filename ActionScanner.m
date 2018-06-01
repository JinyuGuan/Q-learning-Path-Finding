function paction = ActionScanner(px, py, AMap)

% paction = 1 open
% paction = 0 close

% paction = [1 1 0 1]
% paction(action = 1) up
% paction(action = 2) down
% paction(action = 3) left
% paction(action = 4) right

p = [px py - 1;px py + 1; px - 1, py; px + 1, py];

i = 1;
paction(1) = 0;
while(1)
    try
       paction(i) = AMap(p(i, 2), p(i, 1));
    catch
        if(i > 3)
            if(i == 4)
                paction(i) = 0;
            end
            break
        end
        paction(i) = 0;
    end
    i = i + 1;
end

end