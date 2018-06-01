function NewAMap = LearningProgressImage(state, NewAMap, Map, N)

[AMap Mapdir] = MapMinimize(Map);
AMap = AMap./max(AMap);

%NewAMap = AMap;
%for i = 1:400
%    if(max(Q(i, :)) ~= 0)
%        [x y] = StateToPosition(i, AMap);
%        NewAMap(x, y) = 50;
%        NewMap = MapRecharge(NewAMap, Map, Mapdir);
%    end
%end
%figure
%colormap('gray')
%image(NewMap)
%axis equal

[r c] = find(NewAMap == 50);
NewAMap(r, c) = 150;

[x y] = StateToPosition(state, AMap);
NewAMap(x, y) = 50;
NewMap = MapRecharge(NewAMap, Map, Mapdir);

path = 'C:\Users\guanj\OneDrive\Documents\MATLAB\Qlearning\Barrier\LearningProgressMaps\map';

b = fix(log10(N)) + 1;
num = num2str(N);
while(1)
    if(5 - b == 0)
        break
    else
        num = ['0', num];
    end
    b = b + 1;
end

imwrite(uint8(NewMap), [path, num, '.png'])

end