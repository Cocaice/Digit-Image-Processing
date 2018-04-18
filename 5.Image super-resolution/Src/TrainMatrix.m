function TrainMatrix
    [hr_patch, lr_patch] = GetAllPatchs2(1.2, 3);
    [hr_feature, lr_feature ] = GetLrHrFeatures(hr_patch, lr_patch);
    [ CMatrix ] = GetCMartrix(hr_feature, lr_feature);
end

