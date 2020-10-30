function [ output1,output2,output3,output4 ] = gaussKernel(sig,m)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  gaussKernel():��һ����ά��˹�˲��˺���
%  sig ��Ӧ�ڸ�˹���������еĦ�
%  w �Ĵ�СΪ m��m ����m����Ϊ����
%output1:�Ӹ�˹���������õ���ģ��
%output2:ģ����Ե�һ��Ԫ��
%output1:ȡ�����ģ��
%output1:��һ�����ģ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 if(nargin<2)                             %Ϊ����mֵ����ȡm
     m = ceil(3*sig)*2 + 1;               %��mֵ
 end
 if(rem(m,2)==0)                          %�ж�mֵ�Ƿ�Ϊż��
    warning('mֵ����Ϊż��������������...') 
    return                                 %mֵΪż������ֹ����
 end
 output1 = zeros(m,m);                     %��ʼ���������
for i = 1:m
    for j = 1:m
        %%%  ѭ�����������μ�������ÿһ��ֵ   %%%
        output1(i,j) = exp(-(  (i-(m+1)/2)^2+(j-(m+1)/2)^2  )/2/sig/sig);
    end
end 
output2 =  output1 / output1(1,1);         %�������Ͻǵ�һ��Ԫ��
output3 = floor(output2);                  %ȡ��
output4 = output2/(sum(sum(output3,1),2)); %��һ��
end

