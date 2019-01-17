function ct=cut(Y,p)
s=sum(Y);
s2=0;
ct=0;
while s2<s*p
    ct=ct+1;
    s2=s2+abs(Y(ct));
end
ct