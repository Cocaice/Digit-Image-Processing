function Task_1
    origin = imread('./photo/task_1.png');
    number = input('����2.2����Ҫ����С��ţ�0Ϊ���أ���');
    while(number ~= 0)
        if (number == 1)
            output1 = Mean_filter2d(0, 3, origin);
            output2 = Mean_filter2d(0, 9, origin);
            subplot(1,3,2);
            imshow(output1);
            title('3*3������ֵ');
            subplot(1,3,3);
            imshow(output2);
            title('9*9������ֵ');
            subplot(1,3,1);
            imshow(origin);
            title('ԭͼ');
        elseif (number == 2)
            output1 = Mean_filter2d(-1, 3, origin);
            output2 = Mean_filter2d(-1, 9, origin);
            subplot(1,3,2);
            imshow(output1);
            title('3*3���;�ֵ');
            subplot(1,3,3);
            imshow(output2);
            title('9*9���;�ֵ');
            subplot(1,3,1);
            imshow(origin);
            title('ԭͼ');
        elseif (number == 3)
            output1 = Mean_filter2d(-1.5, 3, origin);
            output2 = Mean_filter2d(-1.5, 9, origin);
            subplot(1,3,2);
            imshow(output1);
            title('3*3г����ֵ');
            subplot(1,3,3);
            imshow(output2);
            title('9*9г����ֵ');
            subplot(1,3,1);
            imshow(origin);
            title('ԭͼ');
        else
            disp('��������');
        end
        number = input('����2.2����Ҫ����С��ţ�0Ϊ���أ���');
    end
    

end

