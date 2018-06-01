function NewMap = MapRecharge(AMap, Map, Mapdir)

[row col] = find(AMap > 10 & AMap < 250);

for i = 1:length(row)
    if(AMap(row(i), col(i)) == 50)
        Map(Mapdir(row(i)) - 12: Mapdir(row(i)) + 12, Mapdir(col(i)) - 12: Mapdir(col(i)) + 12) = 50;
    else
        Map(Mapdir(row(i)) - 12: Mapdir(row(i)) + 12, Mapdir(col(i)) - 12: Mapdir(col(i)) + 12) = 150;
    end
end
NewMap = Map;

end