function [ output ] =  twodConv(f, w , padding)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  twodConv()函数实现图像的二维卷积
%  f 是一个灰度源图像
%  w 是一个矩形卷积核
%  padding表示填充方式 有'replicate'和'zero'两种方式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 w1 = rot90(w,2);                       %对卷积核进行旋转
 [wx,wy]=size(w1);                      %求w1矩阵的大小
 [fx,fy]=size(f);                       %求f矩阵的大小
 Paddingf = zeros(fx+wx-1,fy+wy-1);     %初始化填充图像矩阵
                                        %将原图矩阵覆盖至填充图像矩阵相应位置
 Paddingf((wx+1)/2:(wx+1)/2+fx-1,(wy+1)/2:(wy+1)/2+fy-1)=f(:,:);
 if(nargin<3)||strcmp(padding,'zero')  %采用默认方式或者'zero'方式
                                       %采用if语句外的零填充 这里不执行任何语句
 elseif strcmp(padding,'replicate')    %采用'replicate'方式
     for t = 1:(wx-1)/2                %上下边界填充
         Paddingf(t,:) = Paddingf((wx+1)/2,:);
         Paddingf(fx+wx-t,:) = Paddingf(fx+wx-1-(wx-1)/2,:);
     end
     for t = 1:(wy-1)/2                %左右边界填充
         Paddingf(:,t) = Paddingf(:,(wy+1)/2);
         Paddingf(:,fy+wy-t) = Paddingf(:,fy+wy-1-(wy-1)/2);
     end
 end
 output=zeros(fx,fy);                  %初始化卷积图像矩阵
 for i = (wx+1)/2:(wx+1)/2+fx-1        %循环计算卷积
     for j = (wy+1)/2:(wy+1)/2+fy-1
                                       %逐个点计算卷积 并赋值给卷积图像矩阵
        output(i-(wx-1)/2,j-(wy-1)/2) = sum(sum(Paddingf(i-(wx-1)/2:i+(wx-1)/2,j-(wy-1)/2:j+(wy-1)/2).*w1,2),1);
     end
 end

end

