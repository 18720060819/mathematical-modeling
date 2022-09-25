Muti_Cost=zeros(CrossPointNo,CrossPointNo);
     for i=1:CrossPointNo
         [a b]=ShortestPath_Djk(Cost,CrossPointNo,i);
         Muti_Cost(i,:)=a
     end
