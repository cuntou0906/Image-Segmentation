Img3 = imread('图3.tif');                 % 读取图片数据
%五种边缘检测
figure(1);
subplot(2,2,1);
imshow(Img3,[]);                         %显示原图
title('原图');                           %设置标题

Roberts_Img3=edge(Img3,'Roberts',0.16);  %Roberts算子检测边缘
subplot(2,2,2);
imshow(Roberts_Img3,[]);                 %显示Roberts算子检测边缘结果
title('Robert算子边缘检测')               %添加标题

lapalas = [0 -1 0;-1 4 -1;0 -1 0];       %定义拉普拉斯算子
%%%%   调用第一题自定义函数计算拉普拉斯算子检测边缘   %%%%
Lapulas_Img3 = abs(twodConv(Img3,lapalas,'replicate'));
subplot(2,2,3);
imshow(Lapulas_Img3,[]);                 %显示拉普拉斯算子检测边缘结果
title('拉普拉斯算子边缘检测');            %添加标题

canny_Img3 = edge(Img3,'Canny',0.35);    %canny算子检测边缘
subplot(2,2,4); 
imshow(canny_Img3,[]);                   %显示canny算子检测边缘结果
title('Canny算子边缘检测')                %添加标题
