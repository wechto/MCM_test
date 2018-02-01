%% ¶ÁÈ¡Í¼Æ¬´óÐ¡
clc;clear
I=imread('size_1.jpg');
[x y k]=size(I);
index1=0;
for j=1:y
    for i=1:x
        if I(i,j,1)>200 && I(i,j,2)<100 && I(i,j,3)<100
            index1=index1+1;
        end
    end
end
index1
clc;clear i j x y k I
I=imread('size_2.jpg');
[x y k]=size(I);
index2=0;
for j=1:y
    for i=1:x
        if I(i,j,1)>200 && I(i,j,2)<100 && I(i,j,3)<100
            index2=index2+1;
        end
    end
end
index2

[index1/(index1+index2) index2/(index1+index2)]/4


