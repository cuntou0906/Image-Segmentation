function [ output , thread1 ] = Diedai( f )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diedai():利用迭代法寻求图像的阈值
% f 输入图像
% output 输出图像
% thread1 阈值
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fmax = max(max(f));                            %计算最大像素点
fmin = min(min(f));                            %计算最小像素值
thread0 = double((fmax+fmin)/2);               %计算阈值初始值
%%%%%%%    分别计算像素值小于等于k和大于k的像素平均值 %%%%%%%%%
aver_0_k = sum(f(find(f<=thread0)))/(length(find(f<=thread0)));
aver_k_255 =  sum(f(find(f>thread0)))/(length(find(f>thread0)));
thread1 = 0.5*(aver_k_255+aver_0_k);           %更新阈值
while abs(double(thread1-thread0))>=0.0000001  %迭代更新
    thread0 = thread1;                         %更新前一个阈值
    %%%%%%%    分别计算像素值小于等于k和大于k的像素平均值 %%%%%%%%%
    aver_0_k = sum(f(find(f<=thread0)))/(length(find(f<=thread0)));
    aver_k_255 =  sum(f(find(f>thread0)))/(length(find(f>thread0)));
    thread1 = 0.5*(aver_k_255+aver_0_k);       %更新当前阈值
end
f(find(f>thread1)) = 255;                      %大于阈值设置为白色
f(find(f<=thread1)) = 0;                       %小于阈值设置为黑色
output = f;                                    %将f值赋值给输出变量
end

