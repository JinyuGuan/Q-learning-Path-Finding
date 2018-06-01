function NewAMap = LearningProgressImage(state, NewAMap, Map, N)

[AMap Mapdir] = MapMinimize(Map);
AMap = AMap./max(AMap);


[r c] = find(NewAMap == 50);
NewAMap(r, c) = 150;

[x y] = StateToPosition(state, AMap);
NewAMap(x, y) = 50;
NewMap = MapRecharge(NewAMap, Map, Mapdir);


path = 'C:\...\map';
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
