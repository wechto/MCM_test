%% 标准明火
clc;clear
out_tp=[]%温度
out_ma=[]%烟雾
out_co=[]%co
hold on;
%% 标准明火-温度
% 温度
clc;clear II I x y i j out temp
II=imread('tp1.png');
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
temp=out(3);
for i=1:y
    out(i)=16.5/18*100+100-out(i)+temp;
end
plot(out,'r');
ylim([0 300])
out_tp=out;
%% 标准明火-烟雾
% 延误
clc;clear II I x y i j out temp
II=imread('ma1.png');
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
temp=out(3);
for i=1:y
    out(i)=45-out(i)+temp;
end
plot(out,'b');
ylim([0 300])
out_ma=out;
%% 标准明火-CO
% CO
clc;clear II I x y i j out temp
II=imread('co1.png');
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
temp=out(3);
for i=1:y
    out(i)=4.6/18*100-out(i)+temp;
end
plot(out,'g');
ylim([0 300])
out_co=out;
%% out
max=666;
tp=out_tp(1:max);
ma=out_ma(1:max);
co=out_co(1:max);
figure
hold on
plot(tp,'r');plot(ma,'b');plot(co,'g');
legend('温度','烟雾','CO');
title('标准明火 SH4')
%% deal
%温度均值、方差
mean(tp)
sqrt(var(tp))
