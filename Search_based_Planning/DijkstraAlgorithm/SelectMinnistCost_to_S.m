function [T,Dist,Heap,Visited]=SelectMinnistCost_to_S(T,CurP,Dist,xTarget,yTarget,Heap,heap,Visited)
n=length(T)/2;
for k=1:n
    cost=CalculateCost(T(2*k-1), T(2*k), CurP,xTarget,yTarget);
    if cost < Dist(T(2*k-1),T(2*k))
        Dist(T(2*k-1),T(2*k)) = cost;
        V.x=T(2*k-1);
        V.y=T(2*k);
        V.father_x=CurP.x;
        V.father_y=CurP.y;
        V.Q = cost;
        if Visited(T(2*k-1),T(2*k)) == 0
            %��δ���ʹ�
            Heap = heap.pushHeap(Heap,V);
        else
            %�Ѿ����ʹ�����Ҫ���´���
            Heap = heap.updateHeap(Heap,V);
        end
    end
end
T=[];