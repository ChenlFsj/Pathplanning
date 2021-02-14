function [OpenSet, CloseSet] = WeightAStar(xStart,yStart,xTarget,yTarget,MAP,MAX_X,MAX_Y,e)
heap = heapFuns;
%�����ͼ
Dist = inf*ones(size(MAP)); Visited = zeros(size(MAP));
Dist(xStart,yStart)=0; Visited(xStart,yStart)=1;
V.x = xStart; V.y=yStart; V.father_x=xStart;V.father_y=yStart;
if MAP(xStart, yStart) == 0
    fprintf('WARN: ������ϰ�������!!!û���ҵ�·��!!! ʧ��!!!\n');
    return;
end
V.Q=CalculateGCost(V.x,V.y,V,Dist)+e*CalculateHCost(V.x, V.y, xTarget,yTarget); 
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
    [Dist,OpenSet,Visited]=UpdateOpenSet(T,CurP,Dist,xTarget,yTarget,OpenSet,heap,Visited,e);
    count = count + 1;
end