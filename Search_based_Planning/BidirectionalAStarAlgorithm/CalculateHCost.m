function cost=CalculateHCost(Neighborx,Neighbory,xTarget,yTarget)
%����������Heuristic�Ĵ���
cost = sqrt((Neighborx-xTarget)^2+(Neighbory-yTarget)^2);