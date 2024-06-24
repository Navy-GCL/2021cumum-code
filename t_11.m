clc
clear
close all
warning off
%% 数据的读取
[data1,str1]=xlsread('附件1 近5年402家供应商的相关数据.xlsx','企业的订货量（m³）');
[data2,str2]=xlsread('附件1 近5年402家供应商的相关数据.xlsx','供应商的供货量（m³）');
[data3,str3]=xlsread('附件2 近5年8家转运商的相关数据.xlsx');%损耗率
%% A,B,C分类
format long g
data1_a=[];data1_b=[];data1_c=[];%订
data2_a=[];data2_b=[];data2_c=[];%供
for i1=1:402
    if strcmp(str1(i1+1,2),'A')==1
            data1_a=[data1_a;data1(i1,:)];
            data2_a=[data2_a;data2(i1,:)];
    elseif strcmp(str1(i1+1,2),'B')==1
            data1_b=[data1_b;data1(i1,:)];
            data2_b=[data2_b;data2(i1,:)];
    elseif strcmp(str1(i1+1,2),'C')==1
            data1_c=[data1_c;data1(i1,:)];
            data2_c=[data2_c;data2(i1,:)];
    end
end
%%
format long g
%订购量占比(rate_1x)  供应量/订购量(rate_12x)  供应量占比(rate2_x)
%单个供货商单周/总周（zhouzb_x）num2(供货次数)
sum_1a=sum(data1_a);sum_1b=sum(data1_b);sum_1c=sum(data1_c);
sum_2a=sum(data2_a);sum_2b=sum(data2_b);sum_2c=sum(data2_c);
[ma,~]=size(data1_a);[mb,~]=size(data1_b);[mc,~]=size(data1_c);
num2=zeros(402,1);

for j=1:240  %包括all，在241列
    for i1=1:ma
        rate_1a(i1,j)=data1_a(i1,j)/sum_1a(1,j);
        rate_2a(i1,j)=data2_a(i1,j)/sum_2a(1,j);
        if data1_a(i1,j)==0&&data2_a(i1,j)~=0
            rate_12a(i1,j)=1;
        elseif data1_a(i1,j)==0&&data2_a(i1,j)==0
            rate_12a(i1,j)=0;
        else
            rate_12a(i1,j)=data2_a(i1,j)/data1_a(i1,j);%2/1
        end
        zhouzb_a(i1,j)=data2_a(i1,j)/data2(i1,241);
    end
    for i2=1:mb
        rate_2b(i2,j)=data2_b(i2,j)/sum_2b(1,j);
        rate_1b(i2,j)=data1_b(i2,j)/sum_1b(1,j);
        if data1_b(i2,j)==0&&data2_b(i2,j)~=0
            rate_12b(i2,j)=1;
        elseif data1_b(i2,j)==0&&data2_b(i2,j)==0
            rate_12b(i2,j)=0;
        else
            rate_12b(i2,j)=data2_b(i2,j)/data1_b(i2,j);
        end
        zhouzb_b(i2,j)=data2_b(i2,j)/data2(i2,241);
    end
    for i3=1:mc
        rate_1c(i3,j)=data1_c(i3,j)/sum_1c(1,j);
        rate_2c(i3,j)=data2_c(i3,j)/sum_2c(1,j);
        if data1_c(i3,j)==0&&data2_c(i3,j)~=0
            rate_12c(i3,j)=1;
        elseif data1_c(i3,j)==0&&data2_c(i3,j)==0
            rate_12c(i3,j)=0;
        else
            rate_12c(i3,j)=data2_c(i3,j)/data1_c(i3,j);
        end
        zhouzb_c(i3,j)=data2_c(i3,j)/data2(i3,241);
    end
    for i1=1:402
        if data2(i1,j)~=0
            num2(i1)=num2(i1)+1;
        end
    end
end %单周占比
%% 整体A,B,C指标
need_a=sum(sum_1a);
need_b=sum(sum_1b);
need_c=sum(sum_1c);
finish_a=sum(sum_2a);
finish_b=sum(sum_2b);
finish_c=sum(sum_2c);
x1=[1,2,3];
y1=[need_a,need_b,need_c];
y2=[finish_a,finish_b,finish_c];
plot (x1,y1,'r',x1,y2,'b');
%% 
rate_all=zeros(402,240);
for i1=1:146
        rate_all(data1_a(i1,242),:)=rate_12a(i1,:);
end
for i2=1:mb
    if data1_b(i2,242)~=0
        rate_all(data1_b(i2,242),:)=rate_12b(i2,:);
    end
end
for i3=1:mc
    if data1_c(i3,242)~=0
        rate_all(data1_c(i3,242),:)=rate_12c(i3,:);
    end
end
%%
x2=1:240;
plot (x2,sum_1a,'r',x2,sum_2a,'b');
        
























