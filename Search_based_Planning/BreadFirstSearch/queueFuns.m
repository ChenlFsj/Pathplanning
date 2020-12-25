function queue = queueFuns
queue.enQueue = @enQueue;
queue.deQueue = @deQueue;
end

function newQueue = enQueue(oldQueue, newValue)
%��������ֵ���뵽������棨���У���Ȼ��ȡ����ʱ����ȡǰ��ģ��Ƚ��ȳ�ԭ��
    newQueue = [oldQueue, newValue];
end

function [newQueue,popedValue] = deQueue(oldQueue)
%�ж϶�ջ�Ƿ�Ϊ��
    [~, c] = size(oldQueue);
    if c < 1
        popedValue = [];
        newQueue = oldQueue;
        return;
    end
    popedValue = oldQueue(1);
    newQueue = oldQueue(2:end);
end