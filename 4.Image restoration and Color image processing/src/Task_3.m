function Task_3
    origin = imread('./photo/70.png');
    number = input('����2.4����Ҫ����С��ţ�0Ϊ���أ���');
    while (number ~= 0)
        if (number == 1)
            output = equalize (origin);
            subplot(1,2,2);
            imshow(output);
            title('��ͨ��ֱ��ͼ���⻯');
            subplot(1,2,1);
            imshow(origin);
            title('ԭͼ');
        elseif (number == 2)
            output = equalize2 (origin);
            subplot(1,2,2);
            imshow(output);
            title('ƽ��ֱ��ͼ���⻯');
            subplot(1,2,1);
            imshow(origin);
            title('ԭͼ');
        elseif (number == 3)
            output = equalize3 (origin);
            subplot(1,2,2);
            imshow(output);
            title('ǿ��ֱ��ͼ���⻯');
            subplot(1,2,1);
            imshow(origin);
            title('ԭͼ');
        else
            disp('��������');
            
        end
        number = input('����2.4����Ҫ����С��ţ�0Ϊ���أ���');
        
    end


end

