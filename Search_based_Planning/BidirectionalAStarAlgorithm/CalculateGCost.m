function cost=CalculateGCost(Neighborx,Neighbory,CurP, Dist)
%�����ڽӵ�Ĵ���G Cost
cost = Dist(CurP.x, CurP.y)+sqrt((Neighborx-CurP.x)^2+(Neighbory-CurP.y)^2);
