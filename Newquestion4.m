%%%%% �ڶ��ʴ���   %%%%%%
Img3 = imread('ͼ3.tif');                 % ��ȡͼƬ����
canny_Img3 = edge(Img3,'Canny',0.35);     % canny���Ӽ���Ե
figure(3)                                 % ��ͼ���
subplot(2,2,1);                           % �ָ��
imshow(Img3,[]);                          % ��ʾԭͼ
title('ԭͼ')                             % ��ӱ���
subplot(2,2,2);                           % �ָ��
imshow(canny_Img3,[]);                    % ��ʾcanny���Ӽ���Ե���
title('Canny���ӱ�Ե���')                 % ��ӱ���
[H,Theta,Rho] = hough(canny_Img3);        % ����任 
subplot(2,2,3)                            % �ָ�� 
imshow(H,[],'XData',Theta,'YData',Rho,... % ��ʾ����任����
    'InitialMagnification','fit')
title('����任����');                     % ��ӱ���
xlabel('\theta'), ylabel('\rho');         % �����������
axis on, axis normal, hold on;            % ��������
%%%%%%  ����任��ֵ���   %%%%%%
Peaks  = houghpeaks(H,50,'threshold',ceil(0.3*max(H(:))));
subplot(2,2,4)             
plot(Theta(Peaks(:,2)),Rho(Peaks(:,1))...
    ,'*','color','r');                    %���Ʒ�ֵ��
title('��ֵ��ֲ�');                       % ��ӱ���
xlabel('\theta'), ylabel('\rho');         % �����������
%%%%%%  ����任ֱ�߼��   %%%%%%
lines = houghlines(canny_Img3,Theta,Rho,Peaks,...
    'FillGap',5,'MinLength',7);
figure(4)                                 % ��ͼ���
subplot(2,2,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ϊ���ô�ӡ�����ֱ��ֱ�߼��Ľ����ԭͼ�ĶԱȣ�����ʾcanny
%  ��Ե�����ʱ�������ֵͼ��ȡ��������ɫ��ΪĿ���Ե��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
notcanny_Img3 = not(uint8(canny_Img3));
imshow(notcanny_Img3),                    % ��ʾԭͼ
title('Canny���ӱ�Ե���')                 % ��ӱ���
subplot(2,2,2)
hold on                                   % ͼ�񱣳�
axis off                                  % �ر�������
title('����任ֱ�߼����')              % ��ӱ���
for k = 1:length(lines)                   % ѭ�����Ƽ������
 xy = [lines(k).point1; lines(k).point2];
 plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','black');
end