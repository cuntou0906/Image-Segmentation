Img1 = imread('ͼ1.tif');              % ��ȡͼƬ����
%%%%%%   ���ɸ�˹�˲������˲�  %%%%%%%
[Kernel1,Kernel2,Kernel3,Kernel4] = gaussKernel(1.2,5)
Img1_GaussFilter = twodConv(Img1, Kernel4 , 'replicate');
figure(1)                             
subplot(1,2,1)                         %�ָ��ͼ����
imshow(Img1,[])                        %��ʾԭͼ
title('ͼһ.tif��ԭͼ')                 %��ӱ���
subplot(1,2,2)                         %�ָ��ͼ����
imshow(Img1_GaussFilter,[])            %��ʾ�˲����ͼ
title('ͼһ.tif����˹�˲�ͼ��')         %��ӱ���