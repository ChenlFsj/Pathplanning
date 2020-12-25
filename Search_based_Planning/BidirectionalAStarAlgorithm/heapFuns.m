function heap = heapFuns
heap.pushHeap = @pushHeap;
heap.popHeap = @popHeap;
heap.updateHeap = @updateHeap;
end

function newHeap = pushHeap(oldHeap, newValue)
%��������ֵ�ҵ����ʵ�λ�ò��룬Ҫ������С��ԭ��
    len = length(oldHeap);
    newHeap = [];
    for i = 1:len
        if newValue.Q <= oldHeap(i).Q
            newHeap = [newHeap, oldHeap(1:i-1)];
            newHeap = [newHeap, newValue];
            newHeap = [newHeap, oldHeap(i:end)];
            return;
        end        
    end
    newHeap = [newHeap, oldHeap];
	newHeap = [newHeap, newValue];
end

function [newHeap,popedValue] = popHeap(oldHeap)
%�ж϶�ջ�Ƿ�Ϊ��
    [~, c] = size(oldHeap);
    if c < 1
        popedValue = [];
        newHeap = oldHeap;
        return;
    end
    popedValue = oldHeap(1);
    newHeap = oldHeap(2:end);
end

function newHeap = updateHeap(oldHeap, newValue)
    %���ܴ����ظ���Ԫ�أ���Ҫ���¾ɵĴ���ֵ
    %�ܽ��뵽���������˵����Value��δ�Ӷ����г�ȥ������Ϊ��ȥ�Ŀ϶�������С���۵���
    len = length(oldHeap);
    newHeap = oldHeap;
    for i = 1:len
        if newValue.x == oldHeap(i).x && newValue.y == oldHeap(i).y
            newHeap(i) = newValue;
            return;
        end        
    end
end