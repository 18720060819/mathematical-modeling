function y=PrintPath(Min_Distance,Path,StartPointNo,EndPointNo)
              i=EndPointNo;
              if (Path(i)==StartPointNo) & (Min_Distance(i)<Inf)
                  fprintf('��ʼ��(%d)����ֹ��(%d)��·��Ϊ:',StartPointNo,i)
                  fprintf('%d<-',i)
                  fprintf('%d',StartPointNo)
                  fprintf('\n')
              elseif  (Min_Distance(i)==Inf)
                  fprintf('��ʼ��(%d)����ֹ��(%d)��·��Ϊ:��\n',StartPointNo,i)
              else 
                   fprintf('��ʼ��(%d)����ֹ��(%d)���·��Ϊ:',StartPointNo,i)
                   fprintf('%d',i)
                  while(Path(i)~=StartPointNo)
                       fprintf('<-%d', Path(i))
                       i=Path(i);
                   end
                  fprintf('<-%d',StartPointNo)
                   fprintf('\n')
               end