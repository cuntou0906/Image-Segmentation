Img2 = imread('图2.tif');              % 读取图片数据
[Img2_Diedai,thread] = Diedai(Img2);   %代用迭代算法
[Img2_Dajin,thread] = Dajin(Img2);     %调用大津法               
figure(1)                             
subplot(2,2,1)                         %分割绘图区域
imshow(Img2,[])                        %显示原图
title('图2.tif—原图')                 %添加标题
subplot(2,2,2)                         %分割绘图区域
imshow(uint8(Img2_Diedai),[])          %显示迭代算法的图
title('图2.tif—迭代法')                %添加标题
subplot(2,1,2)                         %分割绘图区域
imshow(Img2_Dajin,[])                  %显示大津法的图
title('图2.tif—大津法')                %添加标题