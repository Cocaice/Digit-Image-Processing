function Task_1
    origin = imread('./photo/task_1.png');
    number = input('输入2.2中需要测试小题号（0为返回）：');
    while(number ~= 0)
        if (number == 1)
            output1 = Mean_filter2d(0, 3, origin);
            output2 = Mean_filter2d(0, 9, origin);
            subplot(1,3,2);
            imshow(output1);
            title('3*3算术均值');
            subplot(1,3,3);
            imshow(output2);
            title('9*9算术均值');
            subplot(1,3,1);
            imshow(origin);
            title('原图');
        elseif (number == 2)
            output1 = Mean_filter2d(-1, 3, origin);
            output2 = Mean_filter2d(-1, 9, origin);
            subplot(1,3,2);
            imshow(output1);
            title('3*3调和均值');
            subplot(1,3,3);
            imshow(output2);
            title('9*9调和均值');
            subplot(1,3,1);
            imshow(origin);
            title('原图');
        elseif (number == 3)
            output1 = Mean_filter2d(-1.5, 3, origin);
            output2 = Mean_filter2d(-1.5, 9, origin);
            subplot(1,3,2);
            imshow(output1);
            title('3*3谐波均值');
            subplot(1,3,3);
            imshow(output2);
            title('9*9谐波均值');
            subplot(1,3,1);
            imshow(origin);
            title('原图');
        else
            disp('错误输入');
        end
        number = input('输入2.2中需要测试小题号（0为返回）：');
    end
    

end

