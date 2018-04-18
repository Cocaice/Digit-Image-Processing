function main_Task5
    %如果未聚类，则进行聚类
    if (exist('C.mat') == 0) 
        KCluster();
    end
    %如果未训练系数矩阵，训练矩阵
    if (exist('CMatrix.mat') == 0) 
        TrainMatrix();
    end
    %测试图像
    TestImage();

end

