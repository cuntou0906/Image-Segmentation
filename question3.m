Img3 = imread('ͼ3.tif');                 % ��ȡͼƬ����
%���ֱ�Ե���
figure(1);
subplot(2,2,1);
imshow(Img3,[]);                         %��ʾԭͼ
title('ԭͼ');                           %���ñ���

Roberts_Img3=edge(Img3,'Roberts',0.16);  %Roberts���Ӽ���Ե
subplot(2,2,2);
imshow(Roberts_Img3,[]);                 %��ʾRoberts���Ӽ���Ե���
title('Robert���ӱ�Ե���')               %��ӱ���

lapalas = [0 -1 0;-1 4 -1;0 -1 0];       %����������˹����
%%%%   ���õ�һ���Զ��庯������������˹���Ӽ���Ե   %%%%
Lapulas_Img3 = abs(twodConv(Img3,lapalas,'replicate'));
subplot(2,2,3);
imshow(Lapulas_Img3,[]);                 %��ʾ������˹���Ӽ���Ե���
title('������˹���ӱ�Ե���');            %��ӱ���

canny_Img3 = edge(Img3,'Canny',0.35);    %canny���Ӽ���Ե
subplot(2,2,4); 
imshow(canny_Img3,[]);                   %��ʾcanny���Ӽ���Ե���
title('Canny���ӱ�Ե���')                %��ӱ���
