Img3 = imread('图3.tif');                 % 读取图片数据
canny_Img3 = edge(Img3,'Canny',0.35);     %canny算子检测边缘
Img4 = zeros(8,10);                       %构建图像
%Img4([1,1,2,3,3,3,5,6,6,7,7,8],[2,9,10,4,6,8,6,3,7,4,8,5]) = 1;
Img4(1,[2,9])=1;
Img4(2,10)=1;
Img4(3,[4,6,8])=1;
Img4(5,6)=1;
Img4(6,[3,7])=1;
Img4(7,[4,8])=1;
Img4(8,5)=1;
figure(1);
subplot(2,2,1);
imshow(Img4,[]);                         %显示Img4原图
title('Img4原图');                       %设置标题

[H4, theta4, rho4] = hough(Img4);
subplot(2,2,2);
imshow(imadjust(mat2gray(H4)), [], 'XData', theta4, 'YData', rho4, 'InitialMagnification', 'fit')
axis on
hold on
title('霍夫变换曲线')
xlabel('\theta'), ylabel('\rho')

peaks4 = houghpeaks(H4,5); %检测1个峰值点
subplot(2,2,3);
plot(theta4(peaks4(:, 2)), rho4(peaks4(:, 1)), 'black*')
axis on
title('峰值点')
xlabel('\theta'), ylabel('\rho')

lines4 = houghlines(Img4, theta4, rho4, peaks4);
subplot(2,2,4);
for k = 1:length(lines4)
xy=[lines4(k).point1 ; lines4(k).point2];
plot(xy(:,1), xy(:,2));
hold on
end
title('霍夫变换直线检测结果')

%%%%% 第二问代码   %%%%%%
figure(2)
subplot(2,2,1); 
imshow(canny_Img3,[]);                   %显示canny算子检测边缘结果
title('Canny算子边缘检测')                %添加标题
%%%%   图4霍如变换寻求曲线   %%%
[H4, theta4, rho4] = hough(Img4,'ThetaResolution', 0.2);
peaks = houghpeaks(H,2);%检测2个峰值点