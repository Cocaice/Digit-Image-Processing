function [hr_patchall, lr_patchall] = GetAllPatchs2(sigma, scale_rate)
    file_path =  '..\Train\';
    allpatch_num = 20e5;
    imname = dir(strcat(file_path,'*.jpg'));
    im_num = length(imname);
    lr_patchall = zeros(7*7,allpatch_num);
    hr_patchall = zeros(scale_rate^2*3^2, allpatch_num);
    idx = 1;
    for i = 1:im_num
        im_temp = imread(strcat(file_path,imname(i).name));
        [hr_patchtp, lr_patchtp] = GetLrHrPatchs(im_temp, sigma, scale_rate);
        [patchsize, patchnum] = size(lr_patchtp);
        if (idx + patchnum <= allpatch_num) 
            lr_patchall(:,idx:idx+patchnum-1) = lr_patchtp;
            hr_patchall(:,idx:idx+patchnum-1) = hr_patchtp;
        else
            remainnum = allpatch_num - idx;
            lr_patchall(:,idx:allpatch_num) = lr_patchtp(:,1:remainnum+1);
            hr_patchall(:,idx:allpatch_num) = hr_patchtp(:,1:remainnum+1);
            break;
        end
        idx = idx + patchnum;
    end
end