Img3 = imread('ͼ3.tif');                 % ��ȡͼƬ����
canny_Img3 = edge(Img3,'Canny',0.35);     %canny���Ӽ���Ե
figure(1);
subplot(2,2,1);
imshow(canny_Img3,[]);                         %��ʾImg4ԭͼ
title('Img4ԭͼ');                       %���ñ���

[H3, theta3, rho3] = hough(canny_Img3);
subplot(2,2,2);
imshow(imadjust(H3), [], 'XData', theta3, 'YData', rho3, 'InitialMagnification', 'fit')
axis on
hold on
title('����任����')
xlabel('\theta'), ylabel('\rho')

peaks3 = houghpeaks(H3,500); %���1����ֵ��
subplot(2,2,3);
plot(theta3(peaks3(:, 2)), rho3(peaks3(:, 1)), 'black*')
axis on
title('��ֵ��')
xlabel('\theta'), ylabel('\rho')

lines3 = houghlines(Img3, theta3, rho3, peaks3);
subplot(2,2,4);
for k = 1:length(lines3)
xy=[lines3(k).point1 ; lines3(k).point2];
plot(xy(:,1), xy(:,2));

hold on
end
title('����任ֱ�߼����')