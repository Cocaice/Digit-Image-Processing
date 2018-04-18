function [hr_feature, lr_feature ] = GetLrHrFeatures(hr_patch, lr_patch)
    [lr_patchsize, lr_patchnum] = size(lr_patch);
    lr_feature = zeros(45,lr_patchnum);
    hr_feature = zeros(9*9, lr_patchnum);
    for i = 1:lr_patchnum
        temp = lr_patch(:,i);
        lr_patchmean = mean(temp([2:6 8:42 44:48]));
        lr_feature(:,i) = temp([2:6 8:42 44:48])-lr_patchmean;
        hr_feature(:,i) = hr_patch(:,i) - lr_patchmean;
    end
    lr_feature = lr_feature(:,1:i);
    hr_feature = hr_feature(:,1:i);
end

