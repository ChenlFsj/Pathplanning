function PathCandidate=PathSelect(cost,x_v,y_v,x_Candidate,y_Candidate)
%·��ѡ��
PathCandidate=find(cost==min(cost));
PathCandidate_l=zeros(1,length(PathCandidate));
if length(PathCandidate)>1
    for i=1:length(PathCandidate)
        %��ѡ·������յ��б�����ʼ��ͷ��ǵĲ��������·���仯�ʣ���Ȼһ��������Ǵ˲��С�ģ���·��С
        PathCandidate_l(i)=(y_Candidate(end,PathCandidate(i))-y_v)/(x_Candidate(end,PathCandidate(i))-x_v);        
    end
    j=find(abs(PathCandidate_l)-abs(tan(theta))==min(abs(PathCandidate_l)-abs(tan(theta))));
    PathCandidate=PathCandidate(j);
end
