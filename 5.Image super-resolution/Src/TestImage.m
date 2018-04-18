function TestImage
    load('CMatrix.mat');
    load('C.mat');
    C = C';
    scale_rate = 3;
    file_path =  '..\Set14\';
    imname = dir(strcat(file_path,'*.bmp'));
    im_num = length(imname);
    sum_PSNR = 0;
    sum_SSIM = 0;
    disp('      name          PSNR             SSIM');
    for idex = 1:im_num 
        tic;
        src_img = imread(strcat(file_path,imname(idex).name));
    %src_img = imread('..\.\Set14\bridge.bmp');
        [img, lr_img1] = GetLrHrImg2(src_img, 1.2, 3);
        [lr_height1,lr_width1] = size(lr_img1);
        %lr图像边界扩展
        lr_img = padarray(lr_img1,[2 2],'replicate');
        [lr_height,lr_width] = size(lr_img);
        [cluster_dim,cluster_num] = size(C);
        lr_patchsize = 7;
        lr_patchnum = (lr_height-lr_patchsize+1)*(lr_width-lr_patchsize+1);
        lr_patchsizeh = (lr_patchsize-1)/2;
        i = 1;
        lr_patch = zeros(lr_patchsize^2, lr_patchnum);
        lr_patchcenter = zeros(2, lr_patchnum);
        for r = lr_patchsizeh+1:lr_height-lr_patchsizeh
            for c = lr_patchsizeh+1:lr_width-lr_patchsizeh
                %记录lr小块的中心点位置
                lr_patchcenter(:,i) = [r;c];
                %记录lr小块
                temp = lr_img(r-lr_patchsizeh:r+lr_patchsizeh,c-lr_patchsizeh:c+lr_patchsizeh);
                lr_patch(:,i) = temp(:);
                i = i+1;
            end
        end

        [lr_patchsize, lr_patchnum] = size(lr_patch);
        lr_feature = zeros(45,lr_patchnum);
        hr_feature = zeros(9*9, lr_patchnum);
        if (ndims(src_img) > 2) 
            test = rgb2ycbcr(src_img);
        else
            test = src_img;
        end
        
        [height,width] = size(test(:,:,1));
        
        patchnum_inimg = zeros(lr_height1*3,lr_width1*3);
        hr_img = zeros(lr_height1*3,lr_width1*3);
        for i = 1:lr_patchnum
            temp = lr_patch(:,i);
            lr_patchmean = mean(temp([2:6 8:42 44:48]));
            lr_feature(:,i) = temp([2:6 8:42 44:48])-lr_patchmean;
            Cluster = C;
            for s = 1:cluster_num
                Cluster(:,s) = Cluster(:,s)-lr_feature(:,i);
            end
            Cluster = Cluster.*Cluster;
            Sum(1:cluster_num) = sum(Cluster(:,1:cluster_num));
            [Y,I] = min(Sum);
            %通过变换矩阵得出hr块
            hr_feature(:,i) = CMatrix(:,:,I)*lr_feature(:,i);
            hr_patch(:,i) = hr_feature(:,i)+lr_patchmean;
            %将hr块覆盖到目的图像中
            r = lr_patchcenter(1,i)-2;
            c = lr_patchcenter(2,i)-2;
            hr_phbegin = (r-2)*scale_rate+1;
            hr_phend = (r+1)*scale_rate;
            hr_pwbegin = (c-2)*scale_rate+1;
            hr_pwend = (c+1)*scale_rate;
            hr_img(hr_phbegin:hr_phend,hr_pwbegin:hr_pwend) = reshape(hr_patch(:,i),[9,9])+hr_img(hr_phbegin:hr_phend,hr_pwbegin:hr_pwend);
            %记录每个像素点被hr块覆盖的次数
            patchnum_inimg(hr_phbegin:hr_phend,hr_pwbegin:hr_pwend)= patchnum_inimg(hr_phbegin:hr_phend,hr_pwbegin:hr_pwend)+1;
        end
        hr_img = uint8(hr_img ./patchnum_inimg);
        if (ndims(src_img) > 2) 
            U = bicubic(test(:,:,2),floor(height/3),floor(width/3));
            V = bicubic(test(:,:,3),floor(height/3),floor(width/3));
            U = bicubic(U,height,width);
            V = bicubic(V,height,width);
            hr_img = bicubic(hr_img,height,width);
            output = cat(3,hr_img,U,V);
            output = ycbcr2rgb(output);
        else
            hr_img = bicubic(hr_img,height,width);
            output = hr_img;
        end
        
        save_path = '..\Task5_result\result_';
        imwrite(output,strcat(save_path,imname(idex).name));
        psnr = PSNR(src_img, output);
        ssim = SSIM(src_img, output);
        
        sum_PSNR = sum_PSNR + psnr;
        sum_SSIM = sum_SSIM + ssim;
        fprintf('%s          %f             %f\n',imname(idex).name,psnr, ssim);
        toc;
    end
    fprintf('%s              %f                 %f\n','mean',sum_PSNR/idex, sum_SSIM/idex);
end

