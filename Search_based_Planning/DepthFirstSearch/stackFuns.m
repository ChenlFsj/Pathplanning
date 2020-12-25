function stack = stackFuns
stack.pushStack = @pushStack;
stack.popStack = @popStack;
end

function newStack = pushStack(oldStack, newValue)
%��������ֵ���뵽����ǰ�棨��ջ����Ȼ��ȡ����ʱ����ȡǰ��ģ�����ȳ�ԭ��
    newStack = [newValue,oldStack];
end

function [newStack,popedValue] = popStack(oldStack)
%�ж϶�ջ�Ƿ�Ϊ��
    [~, c] = size(oldStack);
    if c < 1
        popedValue = [];
        newStack = oldStack;
        return;
    end
    popedValue = oldStack(1);
    newStack = oldStack(2:end);
end