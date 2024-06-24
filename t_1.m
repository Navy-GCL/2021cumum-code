
%% 数据的读取
[data1,str1]=xlsread('附件1 近5年402家供应商的相关数据.xlsx','企业的订货量（m³）');
[data2,str2]=xlsread('附件1 近5年402家供应商的相关数据.xlsx','供应商的供货量（m³）');
[data3,str3]=xlsread('附件2 近5年8家转运商的相关数据.xlsx');%损耗率
%% 
format long g
data1_a=[];data1_b=[];data1_c=[];
data2_a=[];data2_b=[];data2_c=[];
for i=1:402
    if strcmp(str1(i+1,2),'A')==1
            data1_a=[data1_a;data1(i,:)];
            data2_a=[data2_a;data2(i,:)];
    elseif strcmp(str1(i+1,2),'B')==1
            data1_b=[data1_b;data1(i,:)];
            data2_b=[data2_b;data2(i,:)];
    elseif strcmp(str1(i+1,2),'C')==1
            data1_c=[data1_c;data1(i,:)];
            data2_c=[data2_c;data2(i,:)];
    end
end
%%
format long g
%订购量占比  供应量/订购量  供应量占比
sum_1a=sum(data1_a);sum_1b=sum(data1_b);sum_1c=sum(data1_c);
sum_2a=sum(data2_a);sum_2b=sum(data2_b);sum_2c=sum(data2_c);
[ma,~]=size(data1_a);[mb,~]=size(data1_b);[mc,~]=size(data1_c);
for j=1:241  %包括all，在241列
    for i1=1:ma
        rate_1a(i1,j)=data1_a(i1,j)/sum_1a(1,j);
        rate_2a(i1,j)=data2_a(i1,j)/sum_2a(1,j);
        if data1_a(i1,j)==0
            rate_12a(i1,j)=data2_a(i1,j);
        else
            rate_12a(i1,j)=data2_a(i1,j)/data1_a(i1,j);%2/1
        end
    end
    for i2=1:mb
        rate_2b(i2,j)=data2_b(i2,j)/sum_2b(1,j);
        rate_1b(i2,j)=data1_b(i2,j)/sum_1b(1,j);
        if data1_b(i2,j)==0
            rate_12b(i2,j)=data2_b(i2,j);
        else
            rate_12b(i2,j)=data2_b(i2,j)/data1_b(i2,j);%2/1
        end
    end
    for i3=1:mc
        rate_1c(i3,j)=data1_c(i3,j)/sum_1c(1,j);
        rate_2c(i3,j)=data2_c(i3,j)/sum_2c(1,j);
        if data1_c(i3,j)==0
            rate_12c(i3,j)=data2_c(i3,j);
        else
            rate_12c(i3,j)=data2_c(i3,j)/data1_c(i3,j);%2/1
        end
    end
end %单周占比

%%  没用
% 5年总比
% rate_all=[];
%     rate_all(:,1)=data1_a(:,241)/sum_1a(241);
%     rate_all(:,4)=data1_b(:,241)/sum_1b(241);
%     rate_all(:,7)=data1_c(:,241)/sum_1c(241);
%     rate_all(:,2)=data2_a(:,241)/sum_1a(241);
%     rate_all(:,5)=data2_b(:,241)/sum_1b(241);
%     rate_all(:,8)=data2_c(:,241)/sum_1c(241);
% %     if data1_a==0||data1_b()
%     rate_all(:,3)=data2_a(:,241)/data1_a(:,241);%2/1
%     rate_all(:,6)=data2_b(:,241)/data1_b(:,241);
%     rate_all(:,9)=data2_c(:,241)/data1_c(:,241);
%     
    %%

        
























