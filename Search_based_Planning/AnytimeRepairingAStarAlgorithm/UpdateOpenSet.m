function [Dist,Heap,Visited]=UpdateOpenSet(T,CurP,Dist,xTarget,yTarget,Heap,heap,Visited,e)
n=length(T);
for k=1:n
    g_cost=CalculateGCost(T(k).x, T(k).y, CurP, Dist);
    h_cost=CalculateHCost(T(k).x, T(k).y, xTarget,yTarget);%A Star������������
    if g_cost < Dist(T(k).x, T(k).y)
        Dist(T(k).x, T(k).y) = g_cost;
        V.x=T(k).x;
        V.y=T(k).y;
        V.father_x=CurP.x;
        V.father_y=CurP.y;
        V.Q = g_cost+e*h_cost;
        if Visited(T(k).x, T(k).y) == 0
            %��δ���ʹ�
            Heap = heap.pushHeap(Heap,V);
            Visited(T(k).x, T(k).y) = 1;
        else
            %�Ѿ����ʹ�����Ҫ���´���
            Heap = heap.updateHeap(Heap,V);
        end
    end
end
T=[];