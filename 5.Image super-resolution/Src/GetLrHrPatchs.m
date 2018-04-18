function [hr_patch, lr_patch] = GetLrHrPatchs(src_img, sigma, scale_rate)
    [hr_img, lr_img] = GetLrHrImg(src_img, sigma, scale_rate);
    [lr_height,lr_width] = size(lr_img);
    [hr_height,hr_width] = size(hr_img);
    lr_patchsize = 7;
    lr_patchnum = (lr_height-lr_patchsize+1)*(lr_width-lr_patchsize+1);
    hr_patchsize = scale_rate*3;
    lr_patchsizeh = (lr_patchsize-1)/2;
    i = 1;
    lr_patch = zeros(lr_patchsize^2, lr_patchnum);
    hr_patch = zeros(hr_patchsize^2, lr_patchnum);
    %lr_patchcenter = zeros(2, lr_patchnum);
    for r = lr_patchsizeh+1:lr_height-lr_patchsizeh
        for c = lr_patchsizeh+1:lr_width-lr_patchsizeh
            %记录lr小块的中心点位置
            %lr_patchcenter(:,i) = [r;c];
            %记录lr小块
            temp = lr_img(r-lr_patchsizeh:r+lr_patchsizeh,c-lr_patchsizeh:c+lr_patchsizeh);
            lr_patch(:,i) = temp(:);
             %获取hr小块
            hr_phbegin = (r-2)*scale_rate+1;
            hr_phend = (r+1)*scale_rate;
            hr_pwbegin = (c-2)*scale_rate+1;
            hr_pwend = (c+1)*scale_rate;
            temp1 = hr_img(hr_phbegin:hr_phend,hr_pwbegin:hr_pwend);
            hr_patch(:,i) = temp1(:);
            i = i+1;
        end
    end
    


end

