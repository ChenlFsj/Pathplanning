function offset=OffsetCheck()
%����ƫ�Ƴɱ�����
offset=-5:1:5;
for i=1:length(offset)
    offset(i)=2^(abs(offset(i)))-1;
end
offset=offset/10;