function y=PrintPath(Min_Distance,Path,StartPointNo,EndPointNo)
              i=EndPointNo;
              if (Path(i)==StartPointNo) & (Min_Distance(i)<Inf)
                  fprintf('起始点(%d)到终止点(%d)的路径为:',StartPointNo,i)
                  fprintf('%d<-',i)
                  fprintf('%d',StartPointNo)
                  fprintf('\n')
              elseif  (Min_Distance(i)==Inf)
                  fprintf('起始点(%d)到终止点(%d)的路径为:空\n',StartPointNo,i)
              else 
                   fprintf('起始点(%d)到终止点(%d)点的路径为:',StartPointNo,i)
                   fprintf('%d',i)
                  while(Path(i)~=StartPointNo)
                       fprintf('<-%d', Path(i))
                       i=Path(i);
                   end
                  fprintf('<-%d',StartPointNo)
                   fprintf('\n')
               end