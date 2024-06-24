[data,str]=xlsread('未来24周的供给.xlsx');
G={};GA={};GB={};GC={};
ia=1;ib=1;ic=1;
for i=1:50
    G{i}=[str(1,i) str(2,i)  data(:,i)];
end
for i=1:50
    if strcmp(str(2,i),'A')==1
        GA{ia}=[str(1,i) str(2,i)  data(:,i)];
        ia=ia+1;
    elseif strcmp(str(2,i),'B')==1
        GB{ib}=[str(1,i) str(2,i)  data(:,i)];
        ib=ib+1;
    elseif strcmp(str(2,i),'C')==1
        GC{ic}=[str(1,i) str(2,i)  data(:,i)];
        ic=ic+1;
    end
end











