function [Uetrunc,Setrunc,n]=truncate(Ue,Se,sve,limit)
n=cell(1,size(sve,2));
for i=1:size(sve,2)
    j=1;
    x=limit+1;
    all=sve{i}/sve{i}(1,1);
    while and((x > limit),(j<=size(all,1)))
        x=all(j);
        j=j+1;
    end
    n{i}=j-1;
end
for p=1:size(sve,2)
    Uetrunc{p} = Ue{p}(:,1:n{p});
end
if size(n,2)==1
    Setrunc = Se(1:n{1});
elseif size(n,2)==2
    Setrunc = Se(1:n{1}, 1:n{2});
elseif size(n,2)==3
    Setrunc = Se(1:n{1}, 1:n{2}, 1:n{3});
elseif size(n,2)==4
    Setrunc = Se(1:n{1}, 1:n{2}, 1:n{3}, 1:n{4});
elseif size(n,2)==5
    Setrunc = Se(1:n{1}, 1:n{2}, 1:n{3}, 1:n{4}, 1:n{5});
end
  