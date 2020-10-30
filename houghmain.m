Img3 = imread('图3.tif');                 % 读取图片数据
canny_Img3 = edge(Img3,'Canny',0.35);     %canny算子检测边缘
figure(1);
subplot(2,2,1);
imshow(canny_Img3,[]);                         %显示Img4原图
title('Img4原图');                       %设置标题

[H3, theta3, rho3] = hough(canny_Img3);
subplot(2,2,2);
imshow(imadjust(H3), [], 'XData', theta3, 'YData', rho3, 'InitialMagnification', 'fit')
axis on
hold on
title('霍夫变换曲线')
xlabel('\theta'), ylabel('\rho')

peaks3 = houghpeaks(H3,500); %检测1个峰值点
subplot(2,2,3);
plot(theta3(peaks3(:, 2)), rho3(peaks3(:, 1)), 'black*')
axis on
title('峰值点')
xlabel('\theta'), ylabel('\rho')

lines3 = houghlines(Img3, theta3, rho3, peaks3);
subplot(2,2,4);
for k = 1:length(lines3)
xy=[lines3(k).point1 ; lines3(k).point2];
plot(xy(:,1), xy(:,2));

hold on
end
title('霍夫变换直线检测结果')