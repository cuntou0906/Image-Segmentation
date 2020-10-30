function [ output1,output2,output3,output4 ] = gaussKernel(sig,m)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  gaussKernel():归一化二维高斯滤波核函数
%  sig 对应于高斯函数定义中的σ
%  w 的大小为 m×m 其中m必须为奇数
%output1:从高斯函数采样得到的模板
%output2:模板除以第一个元素
%output1:取整后的模板
%output1:归一化后的模板
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 if(nargin<2)                             %为给定m值则求取m
     m = ceil(3*sig)*2 + 1;               %求m值
 end
 if(rem(m,2)==0)                          %判断m值是否为偶数
    warning('m值不能为偶数，请重新输入...') 
    return                                 %m值为偶数则终止程序
 end
 output1 = zeros(m,m);                     %初始化输出矩阵
for i = 1:m
    for j = 1:m
        %%%  循环操作，依次计算卷积核每一个值   %%%
        output1(i,j) = exp(-(  (i-(m+1)/2)^2+(j-(m+1)/2)^2  )/2/sig/sig);
    end
end 
output2 =  output1 / output1(1,1);         %除以左上角第一个元素
output3 = floor(output2);                  %取整
output4 = output2/(sum(sum(output3,1),2)); %归一化
end

