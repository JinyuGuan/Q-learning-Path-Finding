clc
clear
m = 0;
Blackline = [1:2];

for i = 1:482
    if(find(Blackline == mod(i, 24)))
        for j = 1:482
            A(i, j) = 1;
        end
    else
        for j = 1:482
            if(find(Blackline == mod(j, 24)))
                A(i, j) = 1;
            else
                A(i, j) = 255;
            end
        end
    end
end

colormap('gray');
imshow(int8(A));
A = uint8(A);
axis equal

imwrite(A, 'Map.png');