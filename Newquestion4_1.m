%%%%% 第一问代码   %%%%%%
Img4 = zeros(8,10);                       %构建图像
Img4(1,[2,9])=1;Img4(2,10)=1;Img4(3,[4,6,8])=1;
Img4(5,6)=1;Img4(6,[3,7])=1;Img4(7,[4,8])=1;
Img4(8,5)=1;
figure(1)                                 % 绘图句柄
subplot(2,2,1);                           % 分割窗口
imshow(Img4,[]);                          % 显示原图
title('原图')                             % 添加标题
subplot(2,2,2);                           % 分割窗口
Img4 = not(Img4);
[H,Theta,Rho] = hough(Img4);              % 霍夫变换 
imshow(H,[],'XData',Theta,'YData',Rho,... % 显示霍夫变换曲线
    'InitialMagnification','fit')
title('霍夫变换曲线');                     % 添加标题
xlabel('\theta'), ylabel('\rho');         % 添加坐标名称
axis on, axis normal, hold on;            % 设置坐标
subplot(2,2,3)                            % 分割窗口    
%%%%%%  霍夫变换峰值检测   %%%%%%
Peaks = houghpeaks(H,3,'threshold',ceil(0.3*max(H(:))));           
plot(Theta(Peaks(:,2)),Rho(Peaks(:,1))...
    ,'*','color','r');                    %绘制峰值点
title('峰值点分布');                       % 添加标题
xlabel('\theta'), ylabel('\rho');         % 添加坐标名称
%%%%%%  霍夫变换直线检测   %%%%%%
lines = houghlines(Img4,Theta,Rho,Peaks,...
    'FillGap',5,'MinLength',7);
subplot(2,2,4)
hold on                                   % 图像保持
axis off                                  % 关闭坐标轴
title('霍夫变换直线检测结果')              % 添加标题
for k = 1:length(lines)                   % 循环绘制检测曲线
 xy = [lines(k).point1; lines(k).point2];
 plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','black');
end