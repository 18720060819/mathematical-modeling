%function sp=secshortest(startp,endp,p,c)
%求解第二条最短路，p为最短路径，c为邻接矩阵
%canshu.m文件提供了一个邻接矩阵的实例
%p需先由shortest函数求出
function sp=secshortest(startp,endp,p,c)
n=length(p);
npp=0;pp=[];
j=-1;
while j~=n-3
    j=j+1;
    c(p(n-j-1),p(n-j))=inf;
    p0=shortest(startp,p(n-j),c);
    n0=length(p0);
    if j==0
        r=[];nr=0;
    else
        nr=nr+1;
        r(nr)=p(n+1-j);
    end
    if r==[]
        npp=1;pp(npp,:)=p0;
    else
        store=p0;
        for i=1:nr
             store(n0+i)=r(nr+1-i);
         end
         npp=npp+1;
         pp(npp,1:length(store))=store;
     end
 end
 
 np3=0;p3=[];
 for i=1:npp
     
     if pp(i,length(pp(i,:)))~=0
         l=length(pp(i,:));
     else
         for l=1:length(pp(i,:))
             if pp(i,l)==0
                 break;
             end
         end
         l=l-1;
     end
     
     store=pp(i,1:l);
     if roadcost(store,c)>=roadcost(p,c)
         np3=np3+1;
         p3(np3,1:length(store))=store;
     end
 end
 
 
 sp=[];nsp=0;
 for i=1:np3
     if p3(i,length(p3(i,:)))~=0
         l=length(p3(i,:));
     else
         for l=1:length(p3(i,:))
             if p3(i,l)==0
                 break;
             end
         end
         l=l-1;
     end
     store=p3(i,1:l);
     
     if i==1
         nsp=1;
         sp(1,1:l)=store;
     else
         if roadcost(store,c)<roadcost(sp(1,:),c)
             sp=[];
             nsp=1;
             sp(1,1:l)=store;
         end
         if roadcost(store,c)==roadcost(sp(1,:),c)
             nsp=nsp+1;
             sp(nsp,1:l)=store;
         end
     end
 end
 
         
     