CrossPointNo=53;%%%输入图中节点的总数目
%%%%%对已知的边进行赋值，注意：有向图的Cost(i,j)=Cost(j,i)
for i=1:CrossPointNo
    for j=1:CrossPointNo
        Cost(i,j)=inf;
    end
end

Cost(50,38)=11.5;Cost(50,1)=6;Cost(50,53)=12.9;Cost(50,51)=10.1;Cost(50,48)=19.8;Cost(50,2)=9.2;
Cost(1,37)=5.9;Cost(1,36)=10.3;Cost(1 ,38 )=11.2 ;
Cost(37 ,38 )=11.0 ;Cost( 37,34 )=17.6 ;
Cost(36 ,34 )=11.5 ;Cost( 36,33 )=7.4;Cost(36,53 )=8.8 ;
Cost(35 ,34 )=8.2 ;
Cost( 31,33 )=7.3 ;
Cost(32 ,33 )=19 ;Cost(32 ,35 )= 14.9;Cost( 32,30 )=10.3 ;
Cost( 31,53 )=9.2 ;Cost( 31,32 )=8.1 ;
Cost( 38,3 )=7.9 ;
Cost(2 ,3 )=4.8 ;Cost( 2,5 )=8.3 ;
Cost( 39,3 )= 8.2;Cost( 39,5 )=11.3 ;Cost( 39,7 )=15.1 ;Cost(39,4)=12.7;
Cost(8,4)=20.4;Cost(8,40)=8;
Cost(40,7)=7.2;Cost(40,11)=11.2;Cost(40,9)=7.8;
Cost(41,9)=5.6;Cost(41,12)=12.2;Cost(41,10)=10.8;
Cost(42,11)=6.8;Cost(42,13)=8.6;Cost(42,12)=7.8;
Cost(43,12)=10.2;Cost(43,14)=9.9;
Cost(14,13)=8.6;Cost(14,15)=15;
Cost(45,13)=10;Cost(45,44)=15.8;Cost(45,19)=8.1;Cost(45,11)=13.2;
Cost(45,18)=8.2;
Cost(44,18)=8.2;Cost(44,16)=11.8;Cost(44,15)=8.8;
Cost(46,18)=9.2;Cost(46,21)=4.1;Cost(46,22)=10.1;Cost(46,17)=9.8;
Cost(17,16)=6.8;Cost(17,22)=6.7;
Cost(22,23)=10;
Cost(49,24)=13.2;Cost(49,23)=7.9;Cost(49,25)=8.8;Cost(49,48)=14.2;Cost(49,26)=10.5;
Cost(21,23)=9.1;Cost(21,20)=7.9;Cost(21,25)=7.8;
Cost(24,23)=8.9;Cost(24,27)=18.8;
Cost(19,20)=9.3;
Cost(20,25)=6.5;
Cost(47,19)=7.2;Cost(47,7)=14.5;Cost(47,6)=11.8;Cost(47,20)=5.5;
Cost(48,6)=9.5;Cost(48,5)=11.4;Cost(48,25)=12;
Cost(6,7)=7.3;Cost(6,5)=9.7;
Cost(16,17)=6.8;
Cost(51,26)=10.5;Cost(51,28)=12.1;Cost(51,29)=15.2;Cost(51,50)=10.1;
Cost(27,26)=7.8;Cost(27,28)=7.9;
Cost(52,28)=8.3;Cost(52,29)=7.2;Cost(52,30)=7.7;
Cost(53,29)=7.9;
Cost(33,35)=20.3;

for i=1:CrossPointNo
    for j=1:CrossPointNo
        if  Cost(i,j) < inf
            Cost(j,i)=Cost(i,j);
        end
    end
end


%%%%节点与节点本身的距离为零，即：Cost(i,i)=0
for i=1:CrossPointNo
    Cost(i,i)=0;
end
