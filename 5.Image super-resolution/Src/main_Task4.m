function main_Task4
    file_path =  '..\Set14\';
    imname = dir(strcat(file_path,'*.bmp'));
    im_num = length(imname);
    sum_PSNR = 0;
    sum_SSIM = 0;
    disp('      name          PSNR             SSIM');
    for i = 1:im_num
        img = imread(strcat(file_path,imname(i).name));
        if (ndims(img) == 3) 
            [src_row, src_col] = size(img(:,:,1));
            output_imgR = bicubic(img(:,:,1), floor(1/3*src_row), floor(1/3*src_col));
            output_imgG = bicubic(img(:,:,2), floor(1/3*src_row), floor(1/3*src_col));
            output_imgB = bicubic(img(:,:,3), floor(1/3*src_row), floor(1/3*src_col));
            output_img = cat(3,output_imgR,output_imgG,output_imgB);
            temp_path = '..\Task4_result\temp_';
            %imwrite(output_img,strcat(temp_path,imname(i).name));
            output_imgR = bicubic(output_img(:,:,1), src_row, src_col);
            output_imgG = bicubic(output_img(:,:,2) , src_row, src_col);
            output_imgB = bicubic(output_img(:,:,3), src_row, src_col);
            output = cat(3, output_imgR,output_imgG,output_imgB);
            psnr = PSNR(img, output);
            ssim = SSIM(img, output);
            sum_PSNR = sum_PSNR + psnr;
            sum_SSIM = sum_SSIM + ssim;
            fprintf('%s          %f             %f\n',imname(i).name,psnr, ssim);
        else
            [src_row, src_col] = size(img);
            output_img = bicubic(img, floor(1/3*src_row), floor(1/3*src_col));
            temp_path = '..\Task4_result\temp_';
            %imwrite(output_img,strcat(temp_path,imname(i).name));
            output = bicubic(output_img, src_row, src_col);
            psnr = PSNR(img, output);
            ssim = SSIM(img, output);
            sum_PSNR = sum_PSNR + psnr;
            sum_SSIM = sum_SSIM + ssim;
            fprintf('%s          %f             %f\n',imname(i).name,psnr, ssim);
        end
        save_path = '..\Task4_result\result_';
        %imwrite(output,strcat(save_path,imname(i).name));
    end
    fprintf('%s              %f                 %f\n','mean',sum_PSNR/im_num, sum_SSIM/im_num);
end

