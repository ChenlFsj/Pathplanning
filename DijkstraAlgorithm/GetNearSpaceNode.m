function [T,MAP]=GetNearSpaceNode(S,MAX_X,MAX_Y,MAP,T,i)
%�·�
if (S(i).x)>=1&&(S(i).x)<=(MAX_X)&&(S(i).y)-1>=1&&(S(i).y)-1<=(MAX_Y)&&MAP((S(i).x),(S(i).y)-1)==1
    T=[T,(S(i).x),(S(i).y)-1];end
%�Ϸ�
if (S(i).x)>=1&&(S(i).x)<=(MAX_X)&&(S(i).y)+1>=1&&(S(i).y)+1<=(MAX_Y)&&MAP((S(i).x),(S(i).y)+1)==1
    T=[T,(S(i).x),(S(i).y)+1];end
%��
if (S(i).x)-1>=1&&(S(i).x)-1<=(MAX_X)&&(S(i).y)>=1&&(S(i).y)<=(MAX_Y)&&MAP((S(i).x)-1,(S(i).y))==1
    T=[T,(S(i).x)-1,(S(i).y)];end
%�ҷ�
if (S(i).x)+1>=1&&(S(i).x)+1<=(MAX_X)&&(S(i).y)>=1&&(S(i).y)<=(MAX_Y)&&MAP((S(i).x)+1,(S(i).y))==1
    T=[T,(S(i).x)+1,(S(i).y)];end
%���½�
if (S(i).x)-1>=1&&(S(i).x)-1<=(MAX_X)&&(S(i).y)-1>=1&&(S(i).y)-1<=(MAX_Y)&&MAP((S(i).x)-1,(S(i).y)-1)==1
    T=[T,(S(i).x)-1,(S(i).y)-1];end
%���Ͻ�
if (S(i).x)-1>=1&&(S(i).x)-1<=(MAX_X)&&(S(i).y)+1>=1&&(S(i).y)+1<=(MAX_Y)&&MAP((S(i).x)-1,(S(i).y)+1)==1
    T=[T,(S(i).x)-1,(S(i).y)+1];end
%���Ͻ�
if (S(i).x)+1>=1&&(S(i).x)+1<=(MAX_X)&&(S(i).y)+1>=1&&(S(i).y)+1<=(MAX_Y)&&MAP((S(i).x)+1,(S(i).y)+1)==1
    T=[T,(S(i).x)+1,(S(i).y)+1];end
%���½�
if (S(i).x)+1>=1&&(S(i).x)+1<=(MAX_X)&&(S(i).y)-1>=1&&(S(i).y)-1<=(MAX_Y)&&MAP((S(i).x)+1,(S(i).y)-1)==1
    T=[T,(S(i).x)+1,(S(i).y)-1];end
