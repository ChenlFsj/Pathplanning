function [x_path,y_path,deta]=PurePursuitFun2(L,l,V,t,x_G,y_G,x_v,y_v,theta)
%��Ԥ�����LΪ��������ֱ�߶�
%�ο�·��
%�ٶ���ʼ��ͷ������x��ƽ��
x_path=[];y_path=[];x_path=[x_path,x_v];y_path=[y_path,y_v];deta=[];i=1;
while i<=50/V && x_v<=x_G(end)
    [xG,yG]=PurePursuit(L,x_v,y_v,x_G,y_G);    
    deta_x=abs((tan(theta)*xG-yG-tan(theta)*(x_v)+y_v))/sqrt(tan(theta)^2+1);
    R=L^2/(2*deta_x);beta=V*t/R;
    %xG_L=(xG-x_v)*sin(theta)-(yG-y_v)*cos(theta);%��㵽ֱ�ߵľ��빫ʽ����  
    xG_L=tan(theta)*xG-yG-tan(theta)*x_v+y_v;
    deta_f=-sign(xG_L)*atan(l/R);
    deta=[deta,deta_f];
    if ~isinf(R)
        xLpath=sign(xG_L)*(R-R*cos(beta));  
        yLpath=R*sin(beta);
        x_v=x_v+xLpath*sin(theta)+yLpath*cos(theta);y_v=y_v-xLpath*cos(theta)+yLpath*sin(theta);        
        theta=theta-sign(xG_L)*beta;
        x_path=[x_path,x_v];y_path=[y_path,y_v];
    else
        xLpath=0;
        yLpath=V*t;
        x_v=x_v+xLpath*sin(theta)+yLpath*cos(theta);y_v=y_v-xLpath*cos(theta)+yLpath*sin(theta);        
        theta=theta-sign(xG_L)*beta;
        x_path=[x_path,x_v];y_path=[y_path,y_v];
    end    
    if x_path(end)<x_path(end-1)
        error('���鳵ͷ��ʼ������Ƿ����Ҫ�����׼·����ǰ������')
    end
    i=i+1;
end
plot(x_path,y_path,'-*');