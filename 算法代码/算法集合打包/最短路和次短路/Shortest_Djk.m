%function [Min_Dist,Muti_Path]=ShortestPath_Djk(Cost,CrossPointNo,StartPoint)
%%%Creat Graph
%%%Cost is lingjie matrix,defaut value is inf
%%%The total Number is CrossPointNo
%%%StartPoint is the inicial Point
function [Min_Distance,Path]=Shortest_Djk(Cost,CrossPointNo,StartPoint)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:CrossPointNo
    for j=1:CrossPointNo
        Min_Dist(i,j)=Cost(i,j);
        Muti_Path(i,j)=StartPoint;
        IsFinal(i,j)=0;
    end
end
IsFinal(StartPoint,StartPoint)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%main loop

   for j=1:(CrossPointNo-1)    %%%%%%%pure CrossPointNo-1
        
       MinPathDist=inf;        % MinPathDist暂时存最小量
     %%每次循环之前找出未加入S集的节点中与StartPoint 之间最小的点开始用来更新路径
        for temp_w=1:CrossPointNo
		
		       if (IsFinal(StartPoint,temp_w)==0) & (Min_Dist(StartPoint,temp_w)< MinPathDist)
                           temp_v=temp_w;%temp_v为未加入s集的与起始点sp距离最短的点
                           MinPathDist=Min_Dist(StartPoint,temp_v);
               end
              
         end
         IsFinal(StartPoint,temp_v)=1;
         %%更新路径
             for temp_z=1:CrossPointNo
                  if (IsFinal(StartPoint,temp_z)==0) &( (MinPathDist+Cost(temp_v,temp_z))<(Cost(StartPoint,temp_z)))
                           Cost(StartPoint,temp_z)=(MinPathDist+Cost(temp_v,temp_z));
                           Min_Dist(StartPoint,temp_z)=Cost(StartPoint,temp_z);
                           Muti_Path(StartPoint,temp_z)=temp_v;        %记下谁更改了temp_z
                  end
             end
     end
     Min_Distance= Min_Dist(StartPoint,:);
     Path=Muti_Path(StartPoint,:);
     
     
     
     
         
                   
    
    
   











