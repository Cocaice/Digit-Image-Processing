function output_img = equalize_hist(input_img )
    img = input_img;
    [src_row, src_col] = size(img);
    output_img = uint8(zeros(src_row, src_col));
    data = zeros(1,256);             %data��������ͳ��ÿ������ֵ�ĵ�ĸ���
    
    %ֱ��ͼ��һ��
    for x=1:src_col
        for y=1:src_row
            data(img(y,x)+1) = data(img(y,x)+1)+1;
        end
    end
    for k = 1:256
        data(k)=data(k)/(src_row*src_col);  %���ÿ������ֵ��Ƶ��
    end
    
    %����ֱ��ͼ���⻯
    for x=1:src_col
        for y=1:src_row
            sum = 0;
            for i = 1:img(y,x)+1
                sum = sum + data(i);
            end
            output_img(y,x) = round(double(sum*255));
        end
    end 

end

