function [AMap, Mapdir]= MapMinimize(Map)

sizeM = size(Map);
counti = 1;

for i = 1: sizeM(1)
    if(mod(i, 24) == 13)
        countj = 1;
        Mapdir(counti) = i;
        for j = 1: sizeM(2)
            if(mod(j, 24) == 13)
                AMap(counti, countj) = Map(i, j);
                countj = countj + 1;
            end
        end
        counti = counti + 1;
    end
end
