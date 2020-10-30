%%%%% ��һ�ʴ���   %%%%%%
Img4 = zeros(8,10);                       %����ͼ��
Img4(1,[2,9])=1;Img4(2,10)=1;Img4(3,[4,6,8])=1;
Img4(5,6)=1;Img4(6,[3,7])=1;Img4(7,[4,8])=1;
Img4(8,5)=1;
figure(1)                                 % ��ͼ���
subplot(2,2,1);                           % �ָ��
imshow(Img4,[]);                          % ��ʾԭͼ
title('ԭͼ')                             % ��ӱ���
subplot(2,2,2);                           % �ָ��
Img4 = not(Img4);
[H,Theta,Rho] = hough(Img4);              % ����任 
imshow(H,[],'XData',Theta,'YData',Rho,... % ��ʾ����任����
    'InitialMagnification','fit')
title('����任����');                     % ��ӱ���
xlabel('\theta'), ylabel('\rho');         % �����������
axis on, axis normal, hold on;            % ��������
subplot(2,2,3)                            % �ָ��    
%%%%%%  ����任��ֵ���   %%%%%%
Peaks = houghpeaks(H,3,'threshold',ceil(0.3*max(H(:))));           
plot(Theta(Peaks(:,2)),Rho(Peaks(:,1))...
    ,'*','color','r');                    %���Ʒ�ֵ��
title('��ֵ��ֲ�');                       % ��ӱ���
xlabel('\theta'), ylabel('\rho');         % �����������
%%%%%%  ����任ֱ�߼��   %%%%%%
lines = houghlines(Img4,Theta,Rho,Peaks,...
    'FillGap',5,'MinLength',7);
subplot(2,2,4)
hold on                                   % ͼ�񱣳�
axis off                                  % �ر�������
title('����任ֱ�߼����')              % ��ӱ���
for k = 1:length(lines)                   % ѭ�����Ƽ������
 xy = [lines(k).point1; lines(k).point2];
 plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','black');
end