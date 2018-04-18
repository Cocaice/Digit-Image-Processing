function output = SSIM( input_imgx, input_imgy)
    if (ndims(input_imgx) > 2) 
        imgx = rgb2ycbcr(input_imgx);
        imgx = double(imgx(:,:,1));
        imgy = rgb2ycbcr(input_imgy);
        imgy = double(imgy(:,:,1));
    else
        imgx = double(input_imgx);
        imgy = double(input_imgy);
    end
    %º∆À„C1∫ÕC2
    k1 = 0.01;
    k2 = 0.03;
    L = 255;
    C1 = (k1*L)^2;
    C2 = (k2*L)^2;
    G = Gaussianfilter(11,1.5);

    Ux = filter2d(G, imgx);
    Uy = filter2d(G, imgy);
    
    Sigmax = filter2d(G, imgx.*imgx) - (Ux.*Ux);
    Sigmay = filter2d(G, imgy.*imgy) - Uy.*Uy;
    Sigmaxy = filter2d(G, imgx.*imgy)-Ux.*Uy;
    
    
    ssim_m = ((2*Ux.*Uy+C1).*(2*Sigmaxy+C2))./((Ux.*Ux+Uy.*Uy+C1).*(Sigmax+Sigmay+C2));
    output = mean2(ssim_m);
end

