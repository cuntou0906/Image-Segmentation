Img1 = imread('图1.tif');              % 读取图片数据
%%%%%%   生成高斯核并进行滤波  %%%%%%%
[Kernel1,Kernel2,Kernel3,Kernel4] = gaussKernel(1.2,5)
Img1_GaussFilter = twodConv(Img1, Kernel4 , 'replicate');
figure(1)                             
subplot(1,2,1)                         %分割绘图区域
imshow(Img1,[])                        %显示原图
title('图一.tif—原图')                 %添加标题
subplot(1,2,2)                         %分割绘图区域
imshow(Img1_GaussFilter,[])            %显示滤波后的图
title('图一.tif—高斯滤波图像')         %添加标题