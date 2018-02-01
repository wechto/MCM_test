clc;clear

X = [257.00 	21913.00 	55.39
258.00 	18651.00 	51.29
265.00 	21411.00 	50.37
258.00 	22168.00 	53.26
258.00 	19125.00 	39.07
265.00 	19249.00 	44.64
270.00 	18622.00 	50.39
267.00 	19202.00 	55.37
268.00 	21137.00 	51.08
263.00 	18425.00 	41.36
263.00 	18479.00 	54.06
263.00 	19610.00 	49.89
258.00 	18788.00 	40.52
270.00 	18524.00 	43.43
260.00 	19569.00 	49.16
265.00 	19196.00 	39.6
265.00 	17619.00 	43.18
262.00 	16033.00 	51.58
268.00 	18759.00 	46.24
258.00 	18892.00 	45.44
268.00 	19307.00 	45.56
260.00 	18050.00 	52.06
268.00 	20559.00 	44.16
264.00 	17595.00 	45
270.00 	18704.00 	52.58
258.00 	18658.00 	48.15
258.00 	18195.00 	53.01
275.00 	17834.00 	38.21
266.00 	19432.00 	42.76
258.00 	21391.00 	48.39
257.00 	20054.00 	51.16
268.00 	19129.00 	51.09
253.00 	19751.00 	50.98
245.00 	19211.00 	47.76
268.00 	19267.00 	50.36
260.00 	19535.00 	41.16
265.00 	18958.00 	37.76
265.00 	19132.00 	42.7
267.00 	17805.00 	39.87
268.00 	18187.00 	39.42
		
266.00 	19472.00 	38.88
264.00 	19682.00 	34.19
265.00 	20220.00 	49.02
268.00 	19084.00 	47.08
262.00 	18704.00 	50.21
270.00 	18699.00 	42.12
265.00 	20000.00 	52.65
266.00 	19303.00 	34.17
];
% plot3(X(:,1),X(:,2),X(:,3),'.');
for i=1:3
    XX(:,i)=X(:,i)/(max(X(:,i))-min(X(:,i)));
end
X=XX;
[cidx3,cmeans3,sumd3,D3] = kmeans(X,3,'dist','sqEuclidean')
cluster1 = (cidx3 == 1);
cluster3 = (cidx3 == 3);
cluster2 = (cidx3 == 2);

% �ȸ���
options = statset('Display','off');
gm = gmdistribution.fit(X,3,'Options',options);
P = posterior(gm,X);
P8 = figure;clf
plot3(X(cluster1,1),X(cluster1,2),P(cluster1,1),'r.')
grid on;hold on
plot3(X(cluster2,1),X(cluster2,2),P(cluster2,2),'bo')
plot3(X(cluster3,1),X(cluster3,2),P(cluster3,3),'g*')
legend('�� 1 ��','�� 2 ��','�� 3 ��','Location','NW')
clrmap = jet(80); colormap(clrmap(9:72,:))
ylabel(colorbar,'Component 1 Posterior Probability')
view(-45,20);


AIC = zeros(1,4);
NlogL = AIC;
GM = cell(1,4);
for k = 1:4
    GM{k} = gmdistribution.fit(X,k);
    AIC(k)= GM{k}.AIC;
    NlogL(k) = GM{k}.NlogL;
end
[minAIC,numComponents] = min(AIC)

%% reference
% http://blog.sina.com.cn/s/blog_627334650101bkfd.html#1