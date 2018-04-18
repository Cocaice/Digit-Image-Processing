function output = PSNR(input_img1, input_img2)
    sum = 0;
    if (ndims(input_img1) > 2) 
        img1 = rgb2ycbcr(input_img1);
        img1 = double(img1(:,:,1));
        img2 = rgb2ycbcr(input_img2);
        img2 = double(img2(:,:,1));
    else
        img1 = double(input_img1);
        img2 = double(input_img2);
    end
    [src_row, src_col] = size(img1);
    
    for x=1:src_col
        for y=1:src_row
            sum = sum + (img1(y,x)-img2(y,x))^2;
        end
    end
    MSE = double(sum/(src_row*src_col));
    output = 10*log10(255^2/MSE);
end

