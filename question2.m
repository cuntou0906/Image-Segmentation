Img2 = imread('ͼ2.tif');              % ��ȡͼƬ����
[Img2_Diedai,thread] = Diedai(Img2);   %���õ����㷨
[Img2_Dajin,thread] = Dajin(Img2);     %���ô��               
figure(1)                             
subplot(2,2,1)                         %�ָ��ͼ����
imshow(Img2,[])                        %��ʾԭͼ
title('ͼ2.tif��ԭͼ')                 %��ӱ���
subplot(2,2,2)                         %�ָ��ͼ����
imshow(uint8(Img2_Diedai),[])          %��ʾ�����㷨��ͼ
title('ͼ2.tif��������')                %��ӱ���
subplot(2,1,2)                         %�ָ��ͼ����
imshow(Img2_Dajin,[])                  %��ʾ��򷨵�ͼ
title('ͼ2.tif�����')                %��ӱ���