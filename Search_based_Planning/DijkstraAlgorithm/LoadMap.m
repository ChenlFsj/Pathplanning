function [xStart,yStart,xTarget,yTarget,MAP,MAX_X,MAX_Y]=LoadMap()
%��һ��դ��ͼ
a = ones(40,50);
a(5,5:45)=0; a(35,5:45)=0; a(5:35,5)=0; a(5:35,45)=0; %�߿�
a(5:20,20)=0; a(20,10:20)=0; a(20:35,30)=0; a(5:20,40)=0; %�ϰ���
xStart=10;yStart=10;
xTarget=30;yTarget=40;
% %�ڶ���դ��ͼ
% a = ones(20,20);
% a(4:10,3)=0; a(4,4:8)=0; a(15,11:16)=0; a(1:14,16)=0; %դ���ͼ
% xStart=1;yStart=2;
% xTarget=6;yTarget=15;

b = a;
b(end+1,end+1) = 0;
colormap([0 0 0;1 1 1])%��դ������ɫ��000Ϊ��ɫ��111Ϊ��ɫ
pcolor(0.5:size(a,2)+0.5,0.5:size(a,1)+0.5,b); % ����դ����ɫ
set(gca,'XTick',1:5:size(a,2),'YTick',1:5:size(a,1));  % ��������
axis image xy;  % ��ÿ��������ʹ����ͬ�����ݵ�λ������һ��
MAP=a;MAX_X=size(a,1);MAX_Y=size(a,2);
hold on
scatter(yStart, xStart, 120, 'gs','filled','LineWidth',0.5, 'MarkerFaceColor', 'g');
scatter(yTarget, xTarget,120, 'rs','filled','LineWidth',0.5, 'MarkerFaceColor', 'r');