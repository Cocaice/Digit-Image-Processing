function Task_3
    origin = imread('./photo/70.png');
    number = input('输入2.4中需要测试小题号（0为返回）：');
    while (number ~= 0)
        if (number == 1)
            output = equalize (origin);
            subplot(1,2,2);
            imshow(output);
            title('三通道直方图均衡化');
            subplot(1,2,1);
            imshow(origin);
            title('原图');
        elseif (number == 2)
            output = equalize2 (origin);
            subplot(1,2,2);
            imshow(output);
            title('平均直方图均衡化');
            subplot(1,2,1);
            imshow(origin);
            title('原图');
        elseif (number == 3)
            output = equalize3 (origin);
            subplot(1,2,2);
            imshow(output);
            title('强度直方图均衡化');
            subplot(1,2,1);
            imshow(origin);
            title('原图');
        else
            disp('错误输入');
            
        end
        number = input('输入2.4中需要测试小题号（0为返回）：');
        
    end


end

