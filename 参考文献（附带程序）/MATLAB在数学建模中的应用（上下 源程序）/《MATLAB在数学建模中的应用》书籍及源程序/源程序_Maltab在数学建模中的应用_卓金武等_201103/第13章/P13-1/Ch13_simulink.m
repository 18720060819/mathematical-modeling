%������ʵ�����ݷɴ����ٲ�صļ�������⣬�����е��򡢷ɴ�
%�͵���12�����վͬʱ�˶��������������������ķ��棬
%ʹ��ʱֻҪ��bhk_med.wav�ļ�����D����Ȼ�����иó����Okay�ˡ�
clc;clear all;close all;
disp('��������ڻ���֮�У������ĵȴ�����');
disp('��������ʱ�뽫��������Ա����ǿ�ҵ��Ӿ����');
a1=20;b1=7;a2=35;b2=37;checklength=45;
e=0;f=0;k=1;h=1;p=0;q=0;geshu1=1000;
%���������������ݸ���һ���ռ�
Music_sound_vector=[];
%��������Դ������Ҫ�����Խ���ͬ��ֵ��ͬƵ�ʵ����Һ������е��Ӳ���������
%Ҳ���Դ�����������*.wave��ʽ����Ƶ������򡣿��Դ������϶�����һЩ��Ƶ��
%Ȼ�����Ǳ��������ʸ��������ʱ���������Ч��
[sound_vector,sf]=wavread('D:\bhk_med.wav');
%С����һά�ֽ⣬��С���������ع�ԭ������ԭ�����ļ���������
%����Ĭ�ϸ�Ƶd5Ϊ����
[c,l]=wavedec(sound_vector,5,'db8');
%�ع���1~5��ƽ��źţ�Ϊ�˱�����ǰ���a1/a2/a3�Ȼ�����
%���ƽ��ź���af��ʾ
af5=wrcoef('a',c,l,'db8',5);af4=wrcoef('a',c,l,'db8',4);af3=wrcoef('a',c,l,'db8',3);
af2=wrcoef('a',c,l,'db8',2);af1=wrcoef('a',c,l,'db8',1);
%�ع���1~5��ϸ���ź�
d5=wrcoef('d',c,l,'db8',5);d4=wrcoef('d',c,l,'db8',4);d3=wrcoef('d',c,l,'db8',3);
d2=wrcoef('d',c,l,'db8',2);d1=wrcoef('d',c,l,'db8',1);
sound_vector=af5+d1+d2+d3+d4; %�������е����ʹ��˵�
%Ϊ��ֹ��������涯���ڲ�����������������������
%���ԶԲ���������ʸ�����ݽ�����չ
%���⣬Ϊ�˷����������ݣ���Wave�����ļ����������������ĳɺ���
sound_vector=sound_vector';
if geshu1./length(sound_vector)<1
    Music_sound_vector=sound_vector;
end
if geshu1./length(sound_vector)>1
    if round(geshu1./length(sound_vector))==2
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))<0
           Music_sound_vector=repmat(sound_vector,[1,2]);
       end
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))>0
           Music_sound_vector=repmat(sound_vector,[1,3]);
       end 
    end 
    if round(geshu1./length(sound_vector))==3
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))<0
           Music_sound_vector=repmat(sound_vector,[1,3]);
       end
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))>0
           Music_sound_vector=repmat(sound_vector,[1,4]);
       end 
    end   
     if round(geshu1./length(sound_vector))==4
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))<0
           Music_sound_vector=repmat(sound_vector,[1,4]);
       end
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))>0
           Music_sound_vector=repmat(sound_vector,[1,5]);
       end 
     end  
     if round(geshu1./length(sound_vector))==5
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))<0
          Music_sound_vector=repmat(sound_vector,[1,5]);
       end
       if (geshu1./length(sound_vector))-round(geshu1./length(sound_vector))>0
          Music_sound_vector=repmat(sound_vector,[1,6]);
       end 
     end     
end
Music_sound_vector=Music_sound_vector';
%�����������Ĳ�����Ҫ���ڳ���ĺ��棬���γɶ�����set����һ�����У�
%���������γ��ǽ���������������ȡ��ǰ���£�
%����һ��һ���Ķ������ݲ����γ�����
%���γ������ĺ���soundsc���ڴ˴����ͻ��γ�������
%��Ȼ������ȶ�����΢��ǰһ���ͷų�����
%�˴��γɵ��������������ԣ�һֱ����涯���Ĳ��Ŷ����ڡ�
%���Ը��ݶ������ŵ�ʱ�䳤�������������ļ��Ĵ�С�Ա㾡����ʹ������
%����ͬʱ������
%��Ҫע����ǣ�����Ҫ������ģ��Ķ���ƥ�䣬
%���Խ���ͬ��ʽ����Ƶͨ�����ת����
%��.wave��ʽ��֮����ʹ����soundsc������û��ʹ��sound������
%��Ϊsound���������%[-1 1]����֮���������ݡ�
soundsc(Music_sound_vector,sf);
%������Ϣ������ϣ����м����ģ��ʱ��һ�߲��Ŷ���һ�߷����붯����ĵ�����
%������12�����վ������
stationx1=1.508;stationy1=6.98;stationx2=8.181;stationy2=6.388;
stationx3=14.85;stationy3=4.69;stationx4=19.95;stationy4=0.4729;
stationx5=16.93;stationy5=-3.726;stationx6=9.699;stationy6=-6.122;
stationx7=1.32;stationy7=-6.985;stationx8=-5.525;stationy8=-6.728;
stationx9=-13.66;stationy9=-5.114;stationx10=-19.98;stationy10=0.2971;
stationx11=-14.93;stationy11=4.658;stationx12=-8.066;stationy12=6.406;
%����12������������ǵ���ֹλ��
stationsigalbegin1=(-87)/180*pi;stationsigalend1=(87)/180*pi;
stationsigalbegin2=(-57)/180*pi;stationsigalend2=(117)/180*pi;
stationsigalbegin3=(-27)/180*pi;stationsigalend3=(147)/180*pi;
stationsigalbegin4=(3)/180*pi;stationsigalend4=(177)/180*pi;
stationsigalbegin5=(33)/180*pi;stationsigalend5=(207)/180*pi;
stationsigalbegin6=(63)/180*pi;stationsigalend6=(237)/180*pi;
stationsigalbegin7=(93)/180*pi;stationsigalend7=(267)/180*pi;
stationsigalbegin8=(123)/180*pi;stationsigalend8=(297)/180*pi;
stationsigalbegin9=(153)/180*pi;stationsigalend9=(327)/180*pi;
stationsigalbegin10=(183)/180*pi;stationsigalend10=(357)/180*pi;
stationsigalbegin11=(213)/180*pi;stationsigalend11=(387)/180*pi;
stationsigalbegin12=(243)/180*pi;stationsigalend12=(417)/180*pi;
w1=linspace(0,2*pi,geshu1);w2=linspace(1,2*pi+1,geshu1);
tc1=a1*sin(w1);uc1=b1*cos(w1);tc2=a2*sin(w2)+tc1;uc2=b2*cos(w2)+uc1;
title('������������ۺŷɴ����ϵͳ','fontsize',20,'color',[0 0 0],'fontname','����');
%�趨�������еı߿�Χ�����򶯻������ܳ�����ͼ��֮��
line([-50 50],[-50 -50]);line([-50 -50],[-50 50]);
line([50 50],[-50 50]);line([50 -50],[50 50]);
hold on;
sun= line(tc1(1),uc1(1),'color',[e f k],'marker','.',...
    'markersize',110,'erasemode','xor');
earth=line(tc2(1),uc2(1),'color',[e f k],'marker','.',...
    'markersize',50,'erasemode','xor');
%�滮�����ϵ�12����������ص�Ŀ�귶Χ
checkstation1=line(stationx1,stationy1,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation2=line(stationx2,stationy2,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation3=line(stationx3,stationy3,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation4=line(stationx4,stationy4,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx5,stationy5,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx6,stationy6,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx7,stationy7,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx8,stationy8,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx9,stationy9,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx10,stationy10,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx11,stationy11,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');
checkstation5=line(stationx12,stationy12,'color',[1 1 1],'marker','.',...
    'markersize',1.2,'erasemode','none');                   
hold on;guiji1=plot(a1*sin(w1),b1*cos(w1));
%���õ���������ĳ�ʼֵ,checkstation1�ĽǶȵĴ���Ҫ����ע��
checkstation1=plot([stationx1,stationx1+checklength*sin(stationsigalbegin1)],...
                   [stationy1,stationy1+checklength*sin(stationsigalend1)]);
checkstation2=plot([stationx2,stationx2+checklength*sin(stationsigalbegin2)],...
                   [stationy2,stationy2+checklength*sin(stationsigalend2)]);
checkstation3=plot([stationx3,stationx3+checklength*sin(stationsigalbegin3)],...
                   [stationy3,stationy3+checklength*sin(stationsigalend3)]);
checkstation4=plot([stationx4,stationx4+checklength*sin(stationsigalbegin4)],...
                   [stationy4,stationy4+checklength*sin(stationsigalend4)]);
checkstation5=plot([stationx5,stationx5+checklength*sin(stationsigalbegin5)],...
                   [stationy5,stationy5+checklength*sin(stationsigalend5)]);
checkstation6=plot([stationx6,stationx6+checklength*sin(stationsigalbegin6)],...
                   [stationy6,stationy6+checklength*sin(stationsigalend6)]);
checkstation7=plot([stationx7,stationx7+checklength*sin(stationsigalbegin7)],...
                   [stationy7,stationy7+checklength*sin(stationsigalend7)]);
checkstation8=plot([stationx8,stationx8+checklength*sin(stationsigalbegin8)],...
                   [stationy8,stationy8+checklength*sin(stationsigalend8)]);
checkstation9=plot([stationx9,stationx9+checklength*sin(stationsigalbegin9)],...
                   [stationy9,stationy9+checklength*sin(stationsigalend9)]);
checkstation10=plot([stationx10,stationx10+checklength*sin(stationsigalbegin10)],...
                   [stationy10,stationy10+checklength*sin(stationsigalend10)]);
checkstation11=plot([stationx11,stationx11+checklength*sin(stationsigalbegin11)],...
                    [stationy11,stationy11+checklength*sin(stationsigalend11)]);
checkstation12=plot([stationx12,stationx12+checklength*sin(stationsigalbegin12)],...
                    [stationy12,stationy12+checklength*sin(stationsigalend12)]);
hold off;axis off;box off;    
set(guiji1,'color','r','linestyle','-','linewidth',2.0,'erasemode','none');
set(earth,'color','g','erasemode','xor');set(sun,'erasemode','xor');
%���õ��������������
set(checkstation1,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation2,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation3,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation4,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation5,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation6,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation7,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation8,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation9,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation10,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation11,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
set(checkstation12,'color','r','linestyle','-','linewidth',1.2,'erasemode','none');
%������ʼ��ӳ��
for i=1:4; 
for r=1:geshu1;
e1=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
f1=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
k1=[linspace(0,1,geshu1) linspace(1,0,geshu1)];
e2=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
f2=[linspace(0,1,geshu1) linspace(1,0,geshu1)];
k2=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
e3=[linspace(0,1,geshu1) linspace(1,0,geshu1)];
f3=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
k3=[linspace(1,0,geshu1) linspace(0,1,geshu1)];
%�������ĵ��������
stationseprate1=[linspace(stationsigalbegin1,stationsigalend1,geshu1)];
stationseprate2=[linspace(stationsigalbegin2,stationsigalend2,geshu1)];
stationseprate3=[linspace(stationsigalbegin3,stationsigalend3,geshu1)];
stationseprate4=[linspace(stationsigalbegin4,stationsigalend4,geshu1)];
stationseprate5=[linspace(stationsigalbegin5,stationsigalend5,geshu1)];
stationseprate6=[linspace(stationsigalbegin6,stationsigalend6,geshu1)];
stationseprate7=[linspace(stationsigalbegin7,stationsigalend7,geshu1)];
stationseprate8=[linspace(stationsigalbegin8,stationsigalend8,geshu1)];
stationseprate9=[linspace(stationsigalbegin9,stationsigalend9,geshu1)];
stationseprate10=[linspace(stationsigalbegin10,stationsigalend10,geshu1)];
stationseprate11=[linspace(stationsigalbegin11,stationsigalend11,geshu1)];
stationseprate12=[linspace(stationsigalbegin12,stationsigalend12,geshu1)];
set(guiji1,'color',[0.1,0.3,0.4],'XData',a1*sin(w1),'YData',b1*cos(w1));
%MarkerEdgeColor��ʾ���ͱ�ɫ��'MarkerFaceColor��ʾ�������ɫ��
%[0.49 1 0.48]ɫ���Ǳ�ʯ����[1 0.62 0.40]��ʾͭ��ɫ
set(sun,'marker','o','markersize',45,'linewidth',8.0,'MarkerEdgeColor',...
[0.49 1 0.48],'MarkerFaceColor',[1 0.62 0.40],'XData',tc1(r),'YData',uc1(r));
mm1=[a2*sin(w2)+tc1(r)*ones(1,geshu1)
     a2*sin(w2)+tc1(r)*ones(1,geshu1) 
     a2*sin(w2)+tc1(r)*ones(1,geshu1)];
nn1=[b2*cos(w2)+uc1(r)*ones(1,geshu1)
     b2*cos(w2)+uc1(r)*ones(1,geshu1)
     b2*cos(w2)+uc1(r)*ones(1,geshu1)];
set(earth,'color',[e2(2*r) f2(2*r) k2(2*r)],'XData',mm1(3*r),'YData',nn1(3*r));
%���վ��ʼ���м�⶯��ģ��,��ɫ��Ҫ������������
set(checkstation1,'color',[0 0.4 0.8],'XData',...
    [stationx1,stationx1+checklength*sin(stationseprate1(r))],...
    'YData',[stationy1,stationy1+checklength*cos(stationseprate1(r))]);
set(checkstation2,'color',[0.1 0.3 0.7],'XData',...
    [stationx2,stationx2+checklength*sin(stationseprate2(r))],...
    'YData',[stationy2,stationy2+checklength*cos(stationseprate2(r))]);
set(checkstation3,'color',[0.2 0.2 0.6],'XData',...
    [stationx3,stationx3+checklength*sin(stationseprate3(r))],...
    'YData',[stationy3,stationy3+checklength*cos(stationseprate3(r))]);
set(checkstation4,'color',[0.3 0.1 0.5],'XData',...
    [stationx4,stationx4+checklength*sin(stationseprate4(r))],...
    'YData',[stationy4,stationy4+checklength*cos(stationseprate4(r))]);
set(checkstation5,'color',[0.4 0.2 0.4],'XData',...
    [stationx5,stationx5+checklength*sin(stationseprate5(r))],...
    'YData',[stationy5,stationy5+checklength*cos(stationseprate5(r))]);
set(checkstation6,'color',[0.5 0.3 0.3],'XData',...
    [stationx6,stationx6+checklength*sin(stationseprate6(r))],...
    'YData',[stationy6,stationy6+checklength*cos(stationseprate6(r))]);
set(checkstation7,'color',[0.6 0.4 0.2],'XData',...
    [stationx7,stationx7+checklength*sin(stationseprate7(r))],...
    'YData',[stationy7,stationy7+checklength*cos(stationseprate7(r))]);
set(checkstation8,'color',[0.7 0.5 0.1],'XData',...
    [stationx8,stationx8+checklength*sin(stationseprate8(r))],...
    'YData',[stationy8,stationy8+checklength*cos(stationseprate8(r))]);
set(checkstation9,'color',[0.8 0.6 0.2],'XData',...
    [stationx9,stationx9+checklength*sin(stationseprate9(r))],...
    'YData',[stationy9,stationy9+checklength*cos(stationseprate9(r))]);
set(checkstation10,'color',[0.9 0.7 0.3],'XData',...
    [stationx10,stationx10+checklength*sin(stationseprate10(r))],...
    'YData',[stationy10,stationy10+checklength*cos(stationseprate10(r))]);
set(checkstation11,'color',[0.8 0.8 0.4],'XData',...
    [stationx11,stationx11+checklength*sin(stationseprate11(r))],...
    'YData',[stationy11,stationy11+checklength*cos(stationseprate11(r))]);
set(checkstation12,'color',[0.7 0.9 0.5],'XData',...
    [stationx12,stationx12+checklength*sin(stationseprate12(r))],...
    'YData',[stationy12,stationy12+checklength*cos(stationseprate12(r))]);
end
pause(0.1);drawnow;
end
