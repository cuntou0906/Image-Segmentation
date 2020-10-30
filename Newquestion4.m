%%%%% 第二问代码   %%%%%%
Img3 = imread('图3.tif');                 % 读取图片数据
canny_Img3 = edge(Img3,'Canny',0.35);     % canny算子检测边缘
figure(3)                                 % 绘图句柄
subplot(2,2,1);                           % 分割窗口
imshow(Img3,[]);                          % 显示原图
title('原图')                             % 添加标题
subplot(2,2,2);                           % 分割窗口
imshow(canny_Img3,[]);                    % 显示canny算子检测边缘结果
title('Canny算子边缘检测')                 % 添加标题
[H,Theta,Rho] = hough(canny_Img3);        % 霍夫变换 
subplot(2,2,3)                            % 分割窗口 
imshow(H,[],'XData',Theta,'YData',Rho,... % 显示霍夫变换曲线
    'InitialMagnification','fit')
title('霍夫变换曲线');                     % 添加标题
xlabel('\theta'), ylabel('\rho');         % 添加坐标名称
axis on, axis normal, hold on;            % 设置坐标
%%%%%%  霍夫变换峰值检测   %%%%%%
Peaks  = houghpeaks(H,50,'threshold',ceil(0.3*max(H(:))));
subplot(2,2,4)             
plot(Theta(Peaks(:,2)),Rho(Peaks(:,1))...
    ,'*','color','r');                    %绘制峰值点
title('峰值点分布');                       % 添加标题
xlabel('\theta'), ylabel('\rho');         % 添加坐标名称
%%%%%%  霍夫变换直线检测   %%%%%%
lines = houghlines(canny_Img3,Theta,Rho,Peaks,...
    'FillGap',5,'MinLength',7);
figure(4)                                 % 绘图句柄
subplot(2,2,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 为了让打印后更加直观直线检测的结果与原图的对比，在显示canny
%  边缘检测结果时，将其二值图像取反，即黑色的为目标边缘。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
notcanny_Img3 = not(uint8(canny_Img3));
imshow(notcanny_Img3),                    % 显示原图
title('Canny算子边缘检测')                 % 添加标题
subplot(2,2,2)
hold on                                   % 图像保持
axis off                                  % 关闭坐标轴
title('霍夫变换直线检测结果')              % 添加标题
for k = 1:length(lines)                   % 循环绘制检测曲线
 xy = [lines(k).point1; lines(k).point2];
 plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','black');
end