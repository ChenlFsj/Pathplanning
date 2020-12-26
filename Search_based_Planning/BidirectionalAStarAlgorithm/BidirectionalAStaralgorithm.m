% @author: yaomin lu
% @file: Bidirectional A Star Algorithm
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
filename = 'E:\6github\path_planning\Search_based_Planning\BidirectionalAStarAlgorithm\result.gif';
heap = heapFuns;
%�����ͼ
[xStart,yStart,xTarget,yTarget,MAP,MAX_X,MAX_Y]=LoadMap();

%����һ�������Start����
Dist_fore = inf*ones(size(MAP)); Visited_fore = zeros(size(MAP));
Dist_fore(xStart,yStart)=0; Visited_fore(xStart,yStart)=1;
V_fore.x = xStart; V_fore.y=yStart; V_fore.father_x=xStart;V_fore.father_y=yStart;
if MAP(xStart, yStart) == 0
    fprintf('WARN: ������ϰ�������!!!û���ҵ�·��!!! ʧ��!!!\n');
    return;
end
V_fore.Q=CalculateGCost(V_fore.x,V_fore.y,V_fore,Dist_fore)+CalculateHCost(V_fore.x, V_fore.y, xTarget,yTarget); 
OpenSet_fore(1) = V_fore;

%����������յ�Goal����
Dist_back = inf*ones(size(MAP)); Visited_back = zeros(size(MAP));
Dist_back(xTarget,yTarget)=0; Visited_back(xTarget,yTarget)=1;
V_back.x = xTarget; V_back.y=yTarget; V_back.father_x=xTarget;V_back.father_y=yTarget;
if MAP(xTarget, yTarget) == 0
    fprintf('WARN: �յ����ϰ�������!!!û���ҵ�·��!!! ʧ��!!!\n');
    return;
end
V_back.Q=CalculateGCost(V_back.x,V_back.y,V_back,Dist_back)+CalculateHCost(V_back.x, V_back.y, xStart,yStart); 
OpenSet_back(1) = V_back;

T_fore=[]; T_back=[];
count=1; flag_find=0;
V_meet = V_fore;
while flag_find==0
    [~, c_fore] = size(OpenSet_fore); [~, c_back] = size(OpenSet_back);
    if c_fore < 1 || c_back < 1
        break;%����Ϊ�գ�����ʧ��
    end
    if c_fore >= 1 
        %��ѡOpenSet����(Heap)��·����̵ĵ����CloseSet�ռ�(����)��
        [OpenSet_fore, CurP_fore] = heap.popHeap(OpenSet_fore);
        CloseSet_fore(count) = CurP_fore;
        %����Ƿ����ҵ�·��
        if count > 1 && inSet(CurP_fore,CloseSet_back)%���ⱨCloseSet_backδ����Ĵ���
            V_meet = CurP_fore;
            flag_find=1; %�ҵ�Ŀ��㣻�����ɹ�
            break;
        end
        %����ͼ����CurP���ڵ�����ײ���ڽӵ����T����
        T_fore=GetNearSpaceNode(MAX_X,MAX_Y,MAP,CurP_fore);
        %��CurP���ڽӵ����OpenSet����(Heap)��
        %Dijkstra set the cost as the priority 
        [Dist_fore,OpenSet_fore,Visited_fore]=UpdateOpenSet(T_fore,CurP_fore,Dist_fore,xTarget,yTarget,OpenSet_fore,heap,Visited_fore); 
    end
    if c_back >= 1
        %��ѡOpenSet����(Heap)��·����̵ĵ����CloseSet�ռ�(����)��
        [OpenSet_back, CurP_back] = heap.popHeap(OpenSet_back);
        CloseSet_back(count) = CurP_back;
        %����Ƿ����ҵ�·��
        if inSet(CurP_back,CloseSet_fore) 
            V_meet = CurP_back;
            flag_find=1; %�ҵ�Ŀ��㣻�����ɹ�
            break;
        end
        %����ͼ����CurP���ڵ�����ײ���ڽӵ����T����[back motions,�ڵ�ǰͼ���淴���������һ���ģ������õ�ͬһ������]
        T_back=GetNearSpaceNode(MAX_X,MAX_Y,MAP,CurP_back);
        %��CurP���ڽӵ����OpenSet����(Heap)��
        %Dijkstra set the cost as the priority 
        [Dist_back,OpenSet_back,Visited_back]=UpdateOpenSet(T_back,CurP_back,Dist_back,xStart,yStart,OpenSet_back,heap,Visited_back); 
    end
    count = count + 1;
end
%����·��
if flag_find
    %����·�����
    result_path=plotPath(V_meet,CloseSet_fore,CloseSet_back,filename,false);    
else
    fprintf('WARN: �յ����ϰ�������!!!û���ҵ�·��!!! ʧ��!!!\n');
end