% @author: yaomin lu
% @file: Dijkstra Algorithm
% input: MAP, xStart, yStart, xTarget,yTarget
% CloseSet��Close Set�ռ�. �ѷ��ʹ�������ΪCurP�����ж��㼯�ϣ���ʼֻ��Դ��s��
    %(�ܹ���ΪCurP�����ȼ���������ȡ����˵���ö����Ѿ��Ǵ�����С�ĵ��ˣ�����ǰҲû�б����С��·����)��
    %(����ıռ���ƽ�����Ĳ�һ�����ǣ�û�ж�����Ķ�����д��۸��£�����ֱ�Ӷ�����������棬
    % ֻ����plotPath�н����˴�����������ͬ����ʱ���������ҵ���С���۵Ķ�����ȡ������Ϊ·��)
% OpenSet��Open Set����. ��δ��ΪCurP���Ѿ������ʹ���(��Ϊ�ڽӵ�)�����ж��㼯�ϡ�
    %(��Heap��С��/���ȼ����н��б�ʾ���洢����ؽ������ȡ�Ķ���: @UpdateOpenSet
    % �������ж�����۸���)
% T: ÿһ����Է��ʵĶ��㼯��
    %(������ȡ�ڽӵ�: @GetNearSpaceNode)
% Dist��������󣬳�ʼ��Ϊinf�����
    %(����㵽��(x,y)�ĵ�ǰ��С���룬�����G_cost�ļ���)
% output: result_path(����·��)

clear;clc;
filename = 'E:\6github\path_planning\Search_based_Planning\DijkstraAlgorithm\result.gif';
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
V.Q=CalculateGCost(V.x,V.y,V,Dist); 
OpenSet(1) = V;
T=[];
count=1; flag_find=0;
while flag_find==0
    [~, c] = size(OpenSet);
    if c < 1
        break;%����Ϊ�գ�����ʧ��
    end
    %��ѡOpenSet����(Heap)��·����̵ĵ����CloseSet�ռ�(����)��
    [OpenSet, CurP] = heap.popHeap(OpenSet);
    CloseSet(count) = CurP;
    %����Ƿ����ҵ�·��
    if CurP.x==xTarget&&CurP.y==yTarget
        flag_find=1; %�ҵ�Ŀ��㣻�����ɹ�
        break;
    end
    %����ͼ����CurP���ڵ�����ײ���ڽӵ����T����
    T=GetNearSpaceNode(MAX_X,MAX_Y,MAP,CurP);
    %��CurP���ڽӵ����OpenSet����(Heap)��
    %Dijkstra set the cost as the priority 
    [Dist,OpenSet,Visited]=UpdateOpenSet(T,CurP,Dist,xTarget,yTarget,OpenSet,heap,Visited);
    count = count + 1;
end
%����·��
if flag_find
    [vertex,XY]=plotPath(xTarget,yTarget,CloseSet,filename,false);
    %����·�����
    result_path = zeros(2, length(vertex));
    for i = 1:length(vertex)
        result_path(1,i) = XY(1,vertex(length(vertex)-i+1));
        result_path(2,i) = XY(2,vertex(length(vertex)-i+1));
    end
else
    fprintf('WARN: �յ����ϰ�������!!!û���ҵ�·��!!! ʧ��!!!\n');
end