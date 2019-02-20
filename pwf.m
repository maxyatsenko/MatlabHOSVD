function f=pwf(t,r)
    if t>0
        f=t*2.5^(-t)*sin(t*10*r);
    else
        f=0;
    end
end