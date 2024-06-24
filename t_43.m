clear;
clc;
ALL=xlsread('附件B 转运方案数据结果.xlsx','问题4的转运方案结果','B7:CS408');
aa=zeros(36,96);
bb=zeros(7,96);
ALL=[aa;ALL;bb];
[m,n]=size(ALL);
for i=1:m
    for j=1:n
        if isnan(ALL(i,j))==1
            ALL(i,j)=0;
        end
    end
end
%%
format long g
lost=[98.10 99.08 99.91 99.33 99.00 99.51 97.92 99.15].*0.01; 
wk1=ALL(:,1:8);wk2=ALL(:,9:16);wk3=ALL(:,17:24);wk4=ALL(:,25:32);
wk5=ALL(:,33:40);wk6=ALL(:,41:48);wk7=ALL(:,49:56);wk8=ALL(:,57:64);
wk9=ALL(:,65:72);wk10=ALL(:,73:80);wk11=ALL(:,81:88);wk12=ALL(:,89:96);
[~,str1]=xlsread('附件1 近5年402家供应商的相关数据.xlsx','企业的订货量（m³）');
    for i1=1:m
    if strcmp(str1(i1+1,2),'A')==1
        pri(i1)=0.6;
    elseif strcmp(str1(i1+1,2),'B')==1
        pri(i1)=0.66;
    elseif strcmp(str1(i1+1,2),'C')==1
        pri(i1)=0.72;
    end
    end
for i=1:8
    wk1(:,i)=wk1(:,i)./lost(i);
    wk2(:,i)=wk2(:,i)./lost(i);
    wk3(:,i)=wk3(:,i)./lost(i);
    wk4(:,i)=wk4(:,i)./lost(i);
    wk5(:,i)=wk5(:,i)./lost(i);   
    wk6(:,i)=wk6(:,i)./lost(i);
    wk7(:,i)=wk7(:,i)./lost(i);
    wk8(:,i)=wk8(:,i)./lost(i);
    wk9(:,i)=wk9(:,i)./lost(i);
    wk10(:,i)=wk10(:,i)./lost(i);
    wk11(:,i)=wk11(:,i)./lost(i);
    wk12(:,i)=wk12(:,i)./lost(i);
end
sum1=sum(wk1,2);
sum2=sum(wk2,2);
sum3=sum(wk3,2);
sum4=sum(wk4,2);
sum5=sum(wk5,2);
sum6=sum(wk6,2);
sum7=sum(wk7,2);
sum8=sum(wk8,2);
sum9=sum(wk9,2);
sum10=sum(wk10,2);
sum11=sum(wk11,2);
sum12=sum(wk12,2);
ans1=0;ans2=0;ans3=0;ans4=0;ans5=0;ans6=0;
ans7=0;ans8=0;ans9=0;ans10=0;ans11=0;ans12=0;
for i=1:m
    ans1=ans1+sum1(i)/pri(i);
    ans2=ans2+sum2(i)/pri(i); 
    ans3=ans3+sum3(i)/pri(i);
    ans4=ans4+sum4(i)/pri(i);
    ans5=ans5+sum5(i)/pri(i);
    ans6=ans6+sum6(i)/pri(i); 
    ans7=ans7+sum7(i)/pri(i);
    ans8=ans8+sum8(i)/pri(i);
    ans9=ans9+sum9(i)/pri(i);
    ans10=ans10+sum10(i)/pri(i); 
    ans11=ans11+sum11(i)/pri(i);
    ans12=ans12+sum12(i)/pri(i);
end
ans1,ans2,ans3,ans4,ans5,ans6
ans7,ans8,ans9,ans10,ans11,ans12
    

            











