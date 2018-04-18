function [ CMatrix ] = GetCMartrix(hr_feature, lr_feature)
    load('C.mat');
    [Lr_patchsize, lr_patchnum] = size(lr_feature);
    idx = zeros(1,lr_patchnum);
    C = C';
    [C_height,C_width] = size(C);
    num_cluster = C_width;
    for i = 1:lr_patchnum
        Cluster = C;
        for s = 1:num_cluster
            Cluster(:,s) = Cluster(:,s)-lr_feature(:,i);
        end
        Cluster = Cluster.*Cluster;
        Sum(1:num_cluster) = sum(Cluster(:,1:num_cluster));
        [Y,I] = min(Sum);
        idx(i) = I;
    end
    for i = 1:num_cluster
        CMatrix(:,:,i) = hr_feature(:,idx == i)/lr_feature(:,idx == i);
    end
    save('CMatrix.mat','CMatrix');
end

