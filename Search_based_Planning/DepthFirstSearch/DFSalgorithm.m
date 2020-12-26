% @author: yaomin lu
% @file: DFS, depth first search
% input: MAP, xStart, yStart, xTarget,yTarget
% S���ѷ��ʹ��Ķ��㼯�ϣ���ʼֻ��Դ��s���������ظ�����ΪVisited��ֻ֤��һ�η���
% T: ÿһ����Է��ʵĶ��㼯��
    %(������ȡ�ڽӵ�: @GetNearSpaceNode)
% Visited������ͼ
% output: result_path(����·��)

clear;clc;
filename = 'E:\6github\path_planning\Search_based_Planning\DepthFirstSearch\result.gif';
stack = stackFuns;
%�����ͼ
[xStart,yStart,xTarget,yTarget,MAP,MAX_X,MAX_Y]=LoadMap();
S(1).x=xStart;S(1).y=yStart;
S(1).father_x=xStart;S(1).father_y=yStart;
Visited = zeros(size(MAP)); Stack = []; 
T=[];flag_find=0;i=1;n0=1;
MAP(xStart,yStart)=0; Visited(xStart,yStart)=1;Stack = [Stack, S(1)];
while flag_find==0
    [~, c] = size(Stack);
    if c < 1
        break;%ջΪ��
    end
    [Stack, CurP] = stack.popStack(Stack);
    %����ͼ����S����i���㣨��ջ�����ڵĿհ׵����T����
    T=GetNearSpaceNode(MAX_X,MAX_Y,MAP,CurP);
    %��ѡT����û�з��ʹ��ĵ����S���У���ջ��
    %DFS add the new visited node in the front of the openset
    [S,n,Visited, flag_find, Stack]=SelectNonVisited_to_S(S,T,CurP,n0,Visited, flag_find, xTarget,yTarget,Stack,stack);
    %����Ƿ����ҵ�·��
    if flag_find~=0
        break;
    end
    n0=n0+n;
end

%����·��
if flag_find
    [vertex,XY]=plotPath(xTarget,yTarget,S,filename,false);
    %����·�����
    result_path = zeros(2, length(vertex));
    for i = 1:length(vertex)
        result_path(1,i) = XY(1,vertex(length(vertex)-i+1));
        result_path(2,i) = XY(2,vertex(length(vertex)-i+1));
    end
else
    fprintf('WARN: �յ����ϰ�������!!!û���ҵ�·��!!! ʧ��!!!\n');
end