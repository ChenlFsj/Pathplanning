% @author: yaomin lu
% @file: Anytime Repairing A Star Algorithm
% input: MAP, xStart, yStart, xTarget,yTarget
% CloseSet��Close Set�ռ�. �ѷ��ʹ�������ΪCurP�����ж��㼯�ϣ���ʼֻ��Դ��s��
    %(�ܹ���ΪCurP�����ȼ���������ȡ����˵���ö����Ѿ��Ǵ�����С�ĵ��ˣ�����ǰҲû�б����С��·����)��
    %(����ıռ���ƽ�����Ĳ�һ�����ǣ�û�ж�����Ķ�����д��۸��£�����ֱ�Ӷ�����������棬
    % ֻ����plotPath�н����˴�����������ͬ����ʱ���������ҵ���С���۵Ķ�����ȡ������Ϊ·��)
    % ����Ѿ���չ����״̬���б����б���vֵ����gֵ��Ϊһ�£�consistent��״̬��
% OpenSet��Open Set����. ��δ��ΪCurP���Ѿ������ʹ���(��Ϊ�ڽӵ�)�����ж��㼯�ϡ�
    %(��Heap��С��/���ȼ����н��б�ʾ���洢����ؽ������ȡ�Ķ���: @UpdateOpenSet
    % �������ж�����۸���)
    % ��Ų�һ���ԣ�inconsistent��״̬���б�������CLOSED�б��״̬�����㽵��gֵʱ������open���С�
    % ���и���״̬��key()ֵ����������С���������档
% INCONS��inconsistent����. ������CLOSED��״̬�ֱ�����gֵʱ������˱��У�����ڴ˱��״̬��ȻΪinconsistent״̬��
    %��һ��״̬s��v(s)������g(s), ���Ϊinconsistent ��
    %����open�б��״̬����inconsistent״̬������inconsisitent״̬��һ����open�б��С�
    
% T: ÿһ����Է��ʵĶ��㼯��
    %(������ȡ�ڽӵ�: @GetNearSpaceNode)
% Dist��������󣬳�ʼ��Ϊinf�����
    %(����㵽��(x,y)�ĵ�ǰ��С���룬�����G_cost�ļ���)
% output: result_path(����·��)

clear;clc;
filename = 'E:\6github\path_planning\Search_based_Planning\AStarAlgorithm\result.gif';
heap = heapFuns;
%�����ͼ
[xStart,yStart,xTarget,yTarget,MAP,MAX_X,MAX_Y]=LoadMap();
Dist = inf*ones(size(MAP)); Visited = zeros(size(MAP));
Dist(xStart,yStart)=0; Visited(xStart,yStart)=1;
V.x = xStart; V.y=yStart; V.father_x=xStart;V.father_y=yStart;
if MAP(xStart, yStart) == 0
    fprintf('WARN: ������ϰ�������!!!û���ҵ�·��!!! ʧ��!!!\n');
    return;
end
V.Q=CalculateGCost(V.x,V.y,V,Dist)+CalculateHCost(V.x, V.y, xTarget,yTarget); 
OpenSet(1) = V; InconsSet(1) = V;
count=1; flag_find=0;
e = 2.5;

while update_e(OpenSet, InconsSet)
    e = e-0.4;
    
end