function [C] = GetLrHrClusters(hr_featureselect, lr_featureselect)
    num_cluster = 512;
    %lr_featureselect = lr_featureselect';
    [lr_featuresize, lr_featurenum] = size(lr_featureselect);
    [hr_featuresize, hr_featurenum] = size(hr_featureselect);
    %Cluster
    %hr_featureselect = hr_featureselect';
    disp(lr_featuresize);
    disp(lr_featurenum);
    options = statset('UseParallel',1,'MaxIter',400);
    [idx, C] = kmeans(lr_featureselect', num_cluster, 'Display','Iter', 'Options', options);
    
    save('C.mat','C');
    %lrpatchnum_incluster = zeros(1,num_cluster);
    %hr_cluster = zeros(num_cluster,hr_featuresize, num_cluster);
    %plus = zeros(1, hr_featuresize);
    %plus(1:hr_featuresize) = 1;
    %统计每个类的数目
    %patchnum_incluster = zeros(1,num_cluster);
    %for i = 1:hr_featurenum
        %cluster_id = idx(i);
        %patchnum_incluster(cluster_id) = patchnum_incluster(cluster_id)+1;
    %end
    for i = 1:num_cluster
        %lr_cluster(:,:,i) = zeros(lr_featuresize,patchnum_incluster(i));
        %hr_cluster(:,:,i) = zeros(hr_featuresize,patchnum_incluster(i));
        %CMatrix(:,:,i) = hr_featureselect(:,idx == i)/lr_featureselect(:,idx == i);
    end
    
    
    %hrpatchnum_incluster = zeros(1,num_cluster);
    %for i = 1:hr_featurenum
        %cluster_id = idx(i);
        %hrpatchnum_incluster(cluster_id) = hrpatchnum_incluster(cluster_id)+1;
        %lr_cluster(:,hrpatchnum_incluster(cluster_id),cluster_id) = lr_featureselect(:,i);
        %hr_cluster(:,hrpatchnum_incluster(cluster_id),cluster_id) = hr_featureselect(:,i);
    %end
end

