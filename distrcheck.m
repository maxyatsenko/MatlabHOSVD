function distrcheck(tensor, TT)
tensor2=reshape(tensor,1,[]);
if TT==0
    [f,xi] = ksdensity(abs(tensor2)); 
    figure()
    plot(xi,f);
else 
    tensor2=abs(tensor2);
    cens = (tensor2>TT);
    [f,xi] = ksdensity(tensor2,'Censoring',cens); 
    figure()
    plot(xi,f);
end
