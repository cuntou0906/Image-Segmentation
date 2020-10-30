function [ output , thread1 ] = Dajin( f )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dajin():���õ�����Ѱ��ͼ�����ֵ
% f ����ͼ��
% output ���ͼ��
% thread1 ��ֵ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sizeh = size(f,1);                            %����������ص�
sizew = size(f,2);                            %������С����ֵ
m1 = zeros(1,256);                            %��ʼ��m1
m2 = zeros(1,256);                            %��ʼ��m2
p1 = zeros(1,256);                            %��ʼ��p1
for k = 1:256                                 %���μ���k=[0,255]��p1
    p1(k) = double(length(find(f<=(k-1))))/(sizeh*sizew);
end
p2 = 1-p1;                                    %����p2
for k=1:256                                   %����m1��m2
  for j = 1:k
    m1(k) = m1(k) + double((j-1)*(sum(sum(f == (j-1)))))/(length(find(f<=k)));
  end
  for j = k+1:256              
    m2(k) = m2(k) + double((j-1)*(sum(sum(f == (j-1)))))/(length(find(f>k)));
  end
end
mg = 0;
for j = 1:256                                 %����mg
    mg = mg + double((j-1)*(sum(sum(f == (j-1)))))/(sizeh*sizew);
end
sigmag = 0;                                   %����sigmag
for j = 1:256
    sigmag = sigmag + double((((j-1)*mg)^2)*(sum(sum(f == (j-1)))))/(sizeh*sizew);
end
sigmab = p1./(1-p1).*(m1-mg).*(m1-mg);        %����sigmab
n = sigmab/sigmag;                            %�����ָ��n
[max1,index] = max(n);                        %��ȡn����Ӧ����ֵ
thread1 =index-1; 
f(find(f>thread1)) = 255;                     %������ֵ����Ϊ��ɫ
f(find(f<=thread1)) = 0;                      %С����ֵ����Ϊ��ɫ
output = f;                                   %��fֵ��ֵ���������
end