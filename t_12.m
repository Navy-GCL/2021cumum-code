A=[229	361	108	140	340	374	151	282	7	275	329	131	330	308	266	268	139	150	356	306	123	314	194	218	352	80	143	244	284	114	364	247	294	55	31	367	365	40	346	98	76	291	338	86	129	348	3	307	67	213];
[~,n]=size(A);
final=[];
for i=1:n
    final=[final;data2(A(i),:)];
end
sum(final(:,241))*0.66/240
B=sum(data2);
    