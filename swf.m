function f=swf(t,r)
    if t>0
        f=4*t*1.85^(-t)*sin(t*12*r);
    else
        f=0;
    end
end