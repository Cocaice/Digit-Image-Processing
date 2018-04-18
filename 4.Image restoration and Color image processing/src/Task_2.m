function Task_2
    origin = imread('./photo/task_2.png');
    number = input('����2.3����Ҫ����С��ţ�0Ϊ���أ���');
    while(number ~= 0)
        if (number == 1)
            a = input('�����˹��ֵ��');
            b = input('�����˹��׼�');
            c = input('���뽷�������ʣ�');
            d = input('�������������ʣ�');
            output1 = Gaussian_generator(a, b, origin);
            output2 = Inpulse_generator(c, d, origin );
            subplot(1,3,2);
            imshow(output1);
            title('��˹����');
            subplot(1,3,3);
            imshow(output2);
            title('��������');
            subplot(1,3,1);
            imshow(origin);
            title('ԭͼ');
        elseif (number == 2)
            output1 = Gaussian_generator(0, 40, origin);
            output2 = Mean_filter2d(0, 3, output1);
            output3 = Geometric_mean(output1, 3 );
            output4 = Median_filter(output1, 3);
            subplot(2,2,2);
            imshow(output2);
            title('������ֵ');
            subplot(2,2,3);
            imshow(output3);
            title('���ξ�ֵ');
            subplot(2,2,1);
            imshow(output1);
            title('��˹����ͼ');
            subplot(2,2,4);
            imshow(output4);
            title('��ֵ');
        elseif (number == 3)
            output1 = Inpulse_generator(0, 0.2, origin );
            output2 = Mean_filter2d(1, 3, output1);
            output3 = Mean_filter2d(-1, 3, output1);
            output4 = Mean_filter2d(-2, 3, output1);
            subplot(2,2,2);
            imshow(output3);
            title('���;�ֵ');
            subplot(2,2,3);
            imshow(output2);
            title('Q>0г����ֵ');
            subplot(2,2,4);
            imshow(output4);
            title('Q<0г����ֵ')
            subplot(2,2,1);
            imshow(output1);
            title('������ͼ');
        elseif (number == 4)
            output1 = Inpulse_generator(0.2, 0.2, origin );
            output2 = Mean_filter2d(0, 3, output1);
            output3 = Max_filter(output1,3);
            output4 = Min_filter(output1,3);
            output5 = Geometric_mean(output1, 3);
            output6 = Median_filter(output1, 3);
            subplot(2,3,2);
            imshow(output2);
            title('������ֵ');
            subplot(2,3,3);
            imshow(output5);
            title('���ξ�ֵ');
            subplot(2,3,4);
            imshow(output3);
            title('���ֵ')
            subplot(2,3,5);
            imshow(output4);
            title('��Сֵ')
            subplot(2,3,6);
            imshow(output6);
            title('��ֵ')
            subplot(2,3,1);
            imshow(output1);
            title('��������ͼ');
        else
            disp('��������');
        end
        number = input('����2.3����Ҫ����С��ţ�0Ϊ���أ���');
    end


end

