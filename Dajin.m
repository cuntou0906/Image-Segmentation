function [ output , thread1 ] = Dajin( f )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dajin():利用迭代法寻求图像的阈值
% f 输入图像
% output 输出图像
% thread1 阈值
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sizeh = size(f,1);                            %计算最大像素点
sizew = size(f,2);                            %计算最小像素值
m1 = zeros(1,256);                            %初始化m1
m2 = zeros(1,256);                            %初始书m2
p1 = zeros(1,256);                            %初始化p1
for k = 1:256                                 %依次计算k=[0,255]的p1
    p1(k) = double(length(find(f<=(k-1))))/(sizeh*sizew);
end
p2 = 1-p1;                                    %计算p2
for k=1:256                                   %计算m1和m2
  for j = 1:k
    m1(k) = m1(k) + double((j-1)*(sum(sum(f == (j-1)))))/(length(find(f<=k)));
  end
  for j = k+1:256              
    m2(k) = m2(k) + double((j-1)*(sum(sum(f == (j-1)))))/(length(find(f>k)));
  end
end
mg = 0;
for j = 1:256                                 %计算mg
    mg = mg + double((j-1)*(sum(sum(f == (j-1)))))/(sizeh*sizew);
end
sigmag = 0;                                   %计算sigmag
for j = 1:256
    sigmag = sigmag + double((((j-1)*mg)^2)*(sum(sum(f == (j-1)))))/(sizeh*sizew);
end
sigmab = p1./(1-p1).*(m1-mg).*(m1-mg);        %计算sigmab
n = sigmab/sigmag;                            %求参数指标n
[max1,index] = max(n);                        %求取n最大对应的阈值
thread1 =index-1; 
f(find(f>thread1)) = 255;                     %大于阈值设置为白色
f(find(f<=thread1)) = 0;                      %小于阈值设置为黑色
output = f;                                   %将f值赋值给输出变量
end