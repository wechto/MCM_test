clc;clear
disp('**************  welcome  **************');
%% �ڶ���Ԫ���Զ���������� ������(���� �¶�)
%     properties
%         T;loseQ;
%         state;%0��ʾ��ȼ�ꣻ1��ʾ����ȼ��2��ʾ��û�п�ʼ
%         Qpre;%��ʵ�ǻ���������� С��0��ʾ����ȼ��
%         Qall;%��ʵ�ǻ�ʣ�¶������� С��0��ʾ����Ϩ����

%init
R=50;C=50;
QALL=12.3999;QPRE=0.63;
T=5;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
Map = [128,118,105;
    237,145,33;
    255,99,71;
    255,0,0;
    255,99,71 ;
    255,127,80;
    0 255 0]/255;
colormap(Map);
for i=1:R
    for j=1:C
        info=[2 QPRE QALL , 10  QALL/T];
        arr(i,j)=struct('state',info(1),'Qpre',info(2),'Qall',info(3), ...
            'T',info(4),'loseQ',info(5));
    end
end
arr(R/2,C/2).state=1;
% for i=27:63
%     for j=18:23
% arr(i,j).state=0;
%     end
% end
% for i=67:82
%     for j=55:67
% arr(i,j).state=0;
%     end
% end
% for i=64:66
%     for j=55:57
% arr(i,j).state=1;
%     end
% end
out=false;Num=0;
arr_=arr;
% T=5;
% loseQ=1;;%ÿ���ٵ�����
% preQ=1;%ÿ��Ԥ�ȵ�����
around=[-1 -1;0 -1;1 -1;
    -1 0;0 0;1 0;
    -1 1;0 1;1 1];
PI=0.0887;PII=0.1613;%����ı�ֵ
losePercent=[PI PII PI , PII 0 PII , PI PII PI];
disp(sprintf('Ԫ����С��%d * %d \n���ֲ�����T=%d \n Qall=%d \n Qpre=%d ', ... 
    R,C,T,QALL,QPRE));
while true
    for i=1:R
        for j=1:C
            if arr(i,j).state==1
                arr_(i,j).Qall=arr_(i,j).Qall-arr_(i,j).loseQ;
                if arr_(i,j).Qall<=0
                    arr_(i,j).state=0;
                end
                
                for k=1:9%��Χ��ɨ��һ��
                    if i+around(k,1)<=0 || j+around(k,2)<=0 || ...
                            i+around(k,1)>R || j+around(k,2)>C
                        continue;
                    end
%                     if false && arr_(i+around(k,1),j+around(k,2)).state==1%������
%                         arr_(i+around(k,1),j+around(k,2)).Qall = ...
%                             arr_(i+around(k,1),j+around(k,2)).Qall- ...
%                             loseQ;
%                         if arr_(i+around(k,1),j+around(k,2)).Qall<=0
%                             arr_(i+around(k,1),j+around(k,2)).state=0;
%                         end
%                     end
                    if arr_(i+around(k,1),j+around(k,2)).state==2%��û��
                        if i==1 || j==1 || i==R || j==C
                            continue;
                        end
                        arr_(i+around(k,1),j+around(k,2)).Qpre = ...
                            arr_(i+around(k,1),j+around(k,2)).Qpre- ... 
                            arr_(i,j).loseQ * losePercent(k);
                        if arr_(i+around(k,1),j+around(k,2)).Qpre<=0
                            arr_(i+around(k,1),j+around(k,2)).state=1;
                        end
                        
                    end
                end
            end
%             cells(i,j)=arr(i,j).state+1;
            cells(i,j)=arr(i,j).Qall;
        end
    end
    arr=arr_;
    %     if arr(1,j).state<=1 || arr(R,j).state<=1 ...
    %             arr(i,1).state<=1 || arr(i,C).state<=1
    %         out = ture;
    %     end
    if out || Num>52
        break;
    end
    imagesc(cells);
    pause(0.5);Num=Num+1;
end
disp('**************  end  **************');

