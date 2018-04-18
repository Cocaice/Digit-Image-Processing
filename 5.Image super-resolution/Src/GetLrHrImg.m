function [hr_img, lr_img ] = GetLrHrImg(src_img, sigma, scale_rate )
    if (ndims(src_img) > 2)
        src_img = rgb2ycbcr(src_img);
        [src_height, src_width] = size(src_img(:,:,1));
        src_img = src_img(:,:,1);
    else 
        [src_height, src_width] = size(src_img);
    end
    %获得裁剪后HR图像
    hr_height = src_height - mod(src_height, scale_rate);
    hr_width = src_width - mod(src_width, scale_rate);
    hr_img = src_img(1:hr_height, 1:hr_width);
    %获得高斯内核
    kernelsize = ceil(sigma * 3)*2+1;
    Gaussiankernel = Gaussianfilter(kernelsize,sigma);
    %经过对hr_img做高斯模糊处理
    temp_img = imfilter2d(hr_img, Gaussiankernel);
    %通过三次插值下采样得到LR图像
    lr_img = bicubic(temp_img, hr_height/scale_rate, hr_width/scale_rate);
    [h,w] = size(lr_img);
end

