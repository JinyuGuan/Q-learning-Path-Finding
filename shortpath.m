clc
clear
%% Initial Work
Map = imread('Map1.jpg');
Map = double(rgb2gray(Map));

[AMap Mapdir] = MapMinimize(Map);
AMap = AMap./max(AMap);

%action = ActionScanner(px, py, AMap);
i = 1;
for py = 1:20
    for px = 1:20
        paction(i, :) = ActionScanner(px, py, AMap);
        i = i + 1;
    end
end
target = [10 10];
RewardMatrix = RMGenerator(paction, target, AMap);
%% Q-learning
N = 8000;
Q = Qlearning(RewardMatrix, paction, Map, N);
%% Results Print
action = 0;
state = 313;
StartState = state;
stateM = 0;
py = 10;
px = 10;
target_state = (py - 1)*20 + px;

while(1)
    if(state == target_state)
        break;
    end
    stateM = [stateM state];
    [m action] = max(Q(state, :));
    state = ActiontoState(state, action, AMap);
end
%% PossibleStartPoint Pattern
NewAMap = AMap;
for i = 1:400
    if(max(Q(i, :)) ~= 0)
        [x y] = StateToPosition(i, AMap);
        NewAMap(x, y) = 50;
        NewMap = MapRecharge(NewAMap, Map, Mapdir);
    end
end
figure
colormap('gray')
image(NewMap)
axis equal

path = 'C:\Users\guanj\OneDrive\Documents\MATLAB\Qlearning\Barrier\TestMaps\map';
imwrite(uint8(NewMap), [path, num2str(1), '.jpg'])
%% Q-Table Pattern
colora(1) = 0;
Qmax = max(max(Q));
NewBMap = 255  - AMap*255;
for i = 1:400
    colora(i) = uint8(mean(Q(i, :))/Qmax/2*255);
    [x y] = StateToPosition(i, AMap);
    if(NewBMap(x, y) ~= 255)
        NewBMap(x, y) = colora(i);
    end
end
figure
colormap('gray')
image(NewBMap)
axis equal
%% Show Results
NewCMap = AMap;
for i = 2: length(stateM)
    [x y] = StateToPosition(stateM(i), AMap);
    NewCMap(x, y) = 150;
    NMap =  MapRecharge(NewCMap, Map, Mapdir);
    
    path = 'C:\Users\guanj\OneDrive\Documents\MATLAB\Qlearning\Barrier\TestMaps\map';
    imwrite(uint8(NMap), [path, num2str(i + 2), '.jpg'])
    
end

figure
colormap('gray')
image(NMap)
axis equal