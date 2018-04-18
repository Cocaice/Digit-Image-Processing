function KCluster
    [hr_patch, lr_patch] = GetAllPatchs(1.2, 3);
    [hr_feature, lr_feature ] = GetLrHrFeatures(hr_patch, lr_patch);
    [ CMatrix] = GetLrHrClusters(hr_feature, lr_feature);
end

