function Task_2
    origin = imread('./photo/task_2.png');
    number = input('输入2.3中需要测试小题号（0为返回）：');
    while(number ~= 0)
        if (number == 1)
            a = input('输入高斯均值：');
            b = input('输入高斯标准差：');
            c = input('输入椒噪声概率：');
            d = input('输入盐噪声概率：');
            output1 = Gaussian_generator(a, b, origin);
            output2 = Inpulse_generator(c, d, origin );
            subplot(1,3,2);
            imshow(output1);
            title('高斯噪声');
            subplot(1,3,3);
            imshow(output2);
            title('椒盐噪声');
            subplot(1,3,1);
            imshow(origin);
            title('原图');
        elseif (number == 2)
            output1 = Gaussian_generator(0, 40, origin);
            output2 = Mean_filter2d(0, 3, output1);
            output3 = Geometric_mean(output1, 3 );
            output4 = Median_filter(output1, 3);
            subplot(2,2,2);
            imshow(output2);
            title('算术均值');
            subplot(2,2,3);
            imshow(output3);
            title('几何均值');
            subplot(2,2,1);
            imshow(output1);
            title('高斯噪声图');
            subplot(2,2,4);
            imshow(output4);
            title('中值');
        elseif (number == 3)
            output1 = Inpulse_generator(0, 0.2, origin );
            output2 = Mean_filter2d(1, 3, output1);
            output3 = Mean_filter2d(-1, 3, output1);
            output4 = Mean_filter2d(-2, 3, output1);
            subplot(2,2,2);
            imshow(output3);
            title('调和均值');
            subplot(2,2,3);
            imshow(output2);
            title('Q>0谐波均值');
            subplot(2,2,4);
            imshow(output4);
            title('Q<0谐波均值')
            subplot(2,2,1);
            imshow(output1);
            title('盐噪声图');
        elseif (number == 4)
            output1 = Inpulse_generator(0.2, 0.2, origin );
            output2 = Mean_filter2d(0, 3, output1);
            output3 = Max_filter(output1,3);
            output4 = Min_filter(output1,3);
            output5 = Geometric_mean(output1, 3);
            output6 = Median_filter(output1, 3);
            subplot(2,3,2);
            imshow(output2);
            title('算术均值');
            subplot(2,3,3);
            imshow(output5);
            title('几何均值');
            subplot(2,3,4);
            imshow(output3);
            title('最大值')
            subplot(2,3,5);
            imshow(output4);
            title('最小值')
            subplot(2,3,6);
            imshow(output6);
            title('中值')
            subplot(2,3,1);
            imshow(output1);
            title('椒盐噪声图');
        else
            disp('错误输入');
        end
        number = input('输入2.3中需要测试小题号（0为返回）：');
    end


end

