function [ output ] =  twodConv(f, w , padding)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  twodConv()����ʵ��ͼ��Ķ�ά���
%  f ��һ���Ҷ�Դͼ��
%  w ��һ�����ξ����
%  padding��ʾ��䷽ʽ ��'replicate'��'zero'���ַ�ʽ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 w1 = rot90(w,2);                       %�Ծ���˽�����ת
 [wx,wy]=size(w1);                      %��w1����Ĵ�С
 [fx,fy]=size(f);                       %��f����Ĵ�С
 Paddingf = zeros(fx+wx-1,fy+wy-1);     %��ʼ�����ͼ�����
                                        %��ԭͼ���󸲸������ͼ�������Ӧλ��
 Paddingf((wx+1)/2:(wx+1)/2+fx-1,(wy+1)/2:(wy+1)/2+fy-1)=f(:,:);
 if(nargin<3)||strcmp(padding,'zero')  %����Ĭ�Ϸ�ʽ����'zero'��ʽ
                                       %����if����������� ���ﲻִ���κ����
 elseif strcmp(padding,'replicate')    %����'replicate'��ʽ
     for t = 1:(wx-1)/2                %���±߽����
         Paddingf(t,:) = Paddingf((wx+1)/2,:);
         Paddingf(fx+wx-t,:) = Paddingf(fx+wx-1-(wx-1)/2,:);
     end
     for t = 1:(wy-1)/2                %���ұ߽����
         Paddingf(:,t) = Paddingf(:,(wy+1)/2);
         Paddingf(:,fy+wy-t) = Paddingf(:,fy+wy-1-(wy-1)/2);
     end
 end
 output=zeros(fx,fy);                  %��ʼ�����ͼ�����
 for i = (wx+1)/2:(wx+1)/2+fx-1        %ѭ��������
     for j = (wy+1)/2:(wy+1)/2+fy-1
                                       %���������� ����ֵ�����ͼ�����
        output(i-(wx-1)/2,j-(wy-1)/2) = sum(sum(Paddingf(i-(wx-1)/2:i+(wx-1)/2,j-(wy-1)/2:j+(wy-1)/2).*w1,2),1);
     end
 end

end

