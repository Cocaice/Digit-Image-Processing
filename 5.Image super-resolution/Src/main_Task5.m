function main_Task5
    %���δ���࣬����о���
    if (exist('C.mat') == 0) 
        KCluster();
    end
    %���δѵ��ϵ������ѵ������
    if (exist('CMatrix.mat') == 0) 
        TrainMatrix();
    end
    %����ͼ��
    TestImage();

end

