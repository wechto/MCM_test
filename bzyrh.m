%% 标准阴燃火
clc;clear
out_tp=[]%温度
out_ma=[]%烟雾
out_co=[]%co
hold on;
%% 标准阴燃火-温度
% 温度
clc;clear II I x y i j out temp
II=imread('tp2.png');
I=II(:,:,1);
[x y]=size(I);
for j=1:y
    for i=1:x
        if I(i,j)<100
            I(i,j)=0;
        end
    end
end
% imshow(I);
out=zeros(1,y);
for j=1:y
    for i=1:x
        if I(i,j)<200
            out(j)=i;
            continue;
        end
    end
end
% hold on
% plot(out,'r');
temp=out(50);
for i=1:y
    out(i)=100-out(i)+temp;
end
plot(out,'r');
ylim([0 300])
out_tp=out;
%% 标准阴燃火-烟雾
% 延误
clc;clear II I x y i j out temp
II=imread('ma2.png');
I=II(:,:,1);
[x y]=size(I);
for j=1:y
    for i=1:x
        if I(i,j)<100
            I(i,j)=0;
        end
    end
end
% imshow(I);
out=zeros(1,y);
for j=1:y
    for i=1:x
        if I(i,j)<200
            out(j)=i;
            continue;
        end
    end
end
hold on
% plot(out,'r');
temp=out(50);
for i=1:y
    out(i)=55-out(i)+temp;
end
plot(out,'b');
ylim([0 300])
out_ma=out;
%% 标准阴燃火-CO
% CO
clc;clear II I x y i j out temp
II=imread('co2.png');
I=II(:,:,1);
[x y]=size(I);
for j=1:y
    for i=1:x
        if I(i,j)<100
            I(i,j)=0;
        end
    end
end
% imshow(I);
out=zeros(1,y);
for j=1:y
    for i=1:x
        if I(i,j)<200
            out(j)=i;
            continue;
        end
    end
end
hold on
% plot(out,'r');
temp=out(50);
for i=1:y
    out(i)=55-out(i)+temp;
end
plot(out,'g');
ylim([0 300])
out_co=out;
%% out
min=50;max=707;
tp=out_tp(min:max);
ma=out_ma(min:max);
co=out_co(min:max);
figure
hold on
plot(tp,'r');plot(ma,'b');plot(co,'g');
legend('温度','烟雾','CO');
title('标准阴燃火 SH1')
%% deal
%温度均值、方差
mean(tp)
sqrt(var(tp))