function p=getpath(Min_Distance,Path,StartPointNo,EndPointNo)
              i=EndPointNo;np=0;p=[];
              if (Path(i)==StartPointNo) & (Min_Distance(i)<Inf)
                  np=1;p(1)=i;
                  np=2;p(2)=StartPointNo;
                  fprintf('\n')
              elseif  (Min_Distance(i)==Inf)
                  fprintf('起始点(%d)到终止点(%d)的路径为:空\n',StartPointNo,i)
              else 
                  np=1;p(1)=i;
                  while(Path(i)~=StartPointNo)
                       np=np+1;p(np)=Path(i);
                       i=Path(i);
                   end
                  np=np+1;p(np)=StartPointNo;
                   fprintf('\n')
               end
               
               
               n=length(p);
               if n~=0
                   q=zeros(1,n);
                   for k=1:n
                        q(k)=p(n+1-k);
                   end
                   p=q;
               end
                   
              