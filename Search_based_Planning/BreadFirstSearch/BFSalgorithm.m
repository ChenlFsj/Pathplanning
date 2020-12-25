% @author: yaomin lu
% @file: BFS, bread first search
% input: MAP, xStart, yStart, xTarget,yTarget
% S���ѷ��ʹ��Ķ��㼯�ϣ���ʼֻ��Դ��s���������ظ�����ΪVisited��ֻ֤��һ�η���
% T: ÿһ����Է��ʵĶ��㼯��
    %(������ȡ�ڽӵ�: @GetNearSpaceNode)
% Visited������ͼ
% output: result_path(����·��)

clear;clc;
filename = 'E:\6github\path_planning\Search_based_Planning\BreadFirstSearch\result.gif';
queue = queueFuns;
%�����ͼ
[xStart,yStart,xTarget,yTarget,MAP,MAX_X,MAX_Y]=LoadMap();
S(1).x=xStart;S(1).y=yStart;
S(1).father_x=xStart;S(1).father_y=yStart;
Visited = zeros(size(MAP)); Queue = [];
T=[];flag_find=0;n0=1;
MAP(xStart,yStart)=0; Visited(xStart,yStart)=1; Queue = [Queue, S(1)];
while flag_find==0
    [~, c] = size(Queue);
    if c < 1
        break;%����Ϊ��
    end
    [Queue, CurP] = queue.deQueue(Queue);
    %����ͼ����S����i���㣨�����У����ڵĿհ׵����T����
    T=GetNearSpaceNode(MAX_X,MAX_Y,MAP,CurP);
    %��ѡT����û�з��ʹ��ĵ����S���У�����У�
    %BFS add the new visited node in the end of the openset
    [S,n, Visited, flag_find,Queue]=SelectNonVisited_to_S(S,T,CurP,n0,Visited, flag_find, xTarget,yTarget,Queue,queue);
    %����Ƿ����ҵ�·��
    if flag_find~=0
        break;
    end
    n0=n0+n;
end
%����·��
if flag_find
    [vertex,XY]=plotPath(xTarget,yTarget,S,filename,true);
    %����·�����
    result_path = zeros(2, length(vertex));
    for i = 1:length(vertex)
        result_path(1,i) = XY(1,vertex(length(vertex)-i+1));
        result_path(2,i) = XY(2,vertex(length(vertex)-i+1));
    end
else
    fprintf('WARN: �յ����ϰ�������!!!û���ҵ�·��!!! ʧ��!!!\n');
end