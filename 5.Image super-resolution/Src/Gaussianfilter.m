function G = Gaussianfilter(size, sigma)
    center = floor(size/2)+1;
    for x = 1:size
        for y = 1:size
            G(y,x) = exp(((x-center)^2+(y-center)^2)/(-2*sigma^2))/(2*pi*sigma^2);
        end
    end
    G = G/sum(sum(G));
end

