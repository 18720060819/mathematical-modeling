% ����˵����
%     ���ݲο����е�ģ�ͣ�������ֱ��
%     K1��K2��K3��K4�Ͳ�Ʊ������⣬����
%     n��m�ĸ�����Ͻ���ѭ�������ʱ������
%     ���㵱ǰn��m�ĸ�����񽱸��ʣ�Ȼ��
%     ������ɶ����ʼֵ������fmincon����
%     Ѱ��Ŀ�꺯������Сֵ��ԭĿ�꺯��Ҫ��
%     ���󣬵�fmincon��Ѱ�Ҽ�С������ԭĿ��
%     ��������(-1)��Ѱ����Ŀ�꺯���ļ�Сֵ����
%     ���Ƚϸ������Ͳ�Ʊ������������
%     ��Ӧ����ԭĿ�꺯���Ľ⡣
% �����������m�ļ�Ϊ��
%     main.m��������
%     cpiao.m��Ŀ�꺯��
%     calculate_probability.m�����������񽱸���
%     nonlcon.m��������Լ��
% ʹ��˵����
%    ִ��main.m

clc
clear

% Ϊ��������ֲ����ţ���Ҫ������ĳ�ֵ���ж�γ��ԣ�
% �ñ���Ϊ��ÿ��m/n������������ֵ����Ŀ��Խ�����ҵ�
% ȫ�����ŵĸ���Խ�󣬵��������е�ʱ��ҲԽ����
% ����ݵ��������������
nums_test_of_initial_value = 20; 

global v
v = 630589;		% ���vΪ630589������ˮƽ���
DEBUG = 0;
rand('state',sum(100*clock))	% ��ʼ�������������
format long g

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��⿪ʼ
% ����K1��
p_k1 = [2e-7;8e-7;1.8e-5;2.61e-4;3.42e-3;4.1995e-2];
% 6������6������
Aeq=[1,1,1,0,0,0];
beq=1;
a_lb=[10,4,3,4,2];
b_ub=[233,54,17,20,10];
A= [0,0,0,-1,a_lb(4),0;
    0,0,0,1,-b_ub(4),0;
    0,0,0,0,-1,a_lb(5);
    0,0,0,0,1,-b_ub(5)];
b= [0;0;0;0];
lb=[0.5;0;0;0;0;0];
ub=[0.8;1;1;inf;inf;inf];
p_test = p_k1;
rx0_tmp = zeros(6,1);
rx_meta_result = zeros(6,1);
fval_meta_result = inf;
flag_meta_result = nan; %�����ж���û�еõ������н�
if DEBUG == 1
    output_meta_result = [];
end
for j = 1:nums_test_of_initial_value
    %������ɶ����ʼֵrx0_tmp���Ա���ֲ�����
    rx0_tmp(1) = rand*(0.8-0.5) + 0.5;
    rx0_tmp(2) = rand*(1-rx0_tmp(1));
    rx0_tmp(3) = 1 - rx0_tmp(1) - rx0_tmp(2);
    rx0_tmp(4) = rand*1000;
    rx0_tmp(5) = rand*100;
    rx0_tmp(6) = rand*50;
    % Ѱ��
    [rx_tmp,fval_tmp,flag_tmp,output_tmp]= ...
            fmincon('cpiao',rx0_tmp,A,b,...
                    Aeq,beq,lb,ub,'nonlcon',[],1,p_test,a_lb,b_ub);
	% ��ʽ�������ĸ�������Ϊ�����ֲ�Ʊ������(K1/K2/K3/K4)
	% ��������Ǻ���cpiao��nonlcon�����п���Ҫ�õ�������
    if (flag_tmp == 1) && (fval_meta_result > fval_tmp)
        fval_meta_result = fval_tmp;
        rx_meta_result = rx_tmp;
        flag_meta_result = 1;
        if DEBUG == 1
            output_meta_result = output_tmp;
        end
    end
end
% ����õ���ý����������
if ~isnan(flag_meta_result)
    rx_k1 = rx_meta_result;
    fval_k1 = fval_meta_result;
    flag_k1 = flag_meta_result;
    if DEBUG == 1
        output = output_meta_result;
    end
else
    if DEBUG == 1
        rx_k1 = rx_tmp;
        fval_k1 = fval_tmp;
        flag_k1 = flag_tmp;
        output = output_tmp;
    end
end

% ����K2��K3��K4�͵����
% nѡm��(m+1)��n��ѡ��Χ��29��60��m��ѡ��ΧΪ5��7
% ���� (60-29+1)*(7-5+1)=96�� ȡ����
% �����⣬K2��K3��K4������96��ȡ����Ҳ������ά��Ϊ3
% ��������ı���������
p_all=zeros(7,96,3);
rx_all = zeros(7,96,3);
fval_all= zeros(1,96,3);
flag_all = zeros(1,96,3);
for m=5:7
    for n=29:60
        for i=1:3
            % ����i��ֵ�ж����ڣ�K2��K3��K4������һ��
            % (i=1��K2;i=2��K3;i=3��K4)��
            % ������n��m���ɸ��������
            % p_temp=eval(sprintf('comb_k%d(m,n)',i+1));
			p_temp = calculate_probability(m,n,i+1);
            p_all(:,(m-5).*32+(n-28),i) = p_temp;
            % K2��K3�ɺϲ�����������Ŀһ����
            if (i ~= 3)
                Aeq=[1,1,1,0,0,0,0];
                beq=1;
                a_lb=[10,4,3,4,2,2];
                b_ub=[233,54,17,20,10,10];
                A=[ 0,0,0,-1,a_lb(4),0,0;
                    0,0,0,1,-b_ub(4),0,0;
                    0,0,0,0,-1,a_lb(5),0;
                    0,0,0,0,1,-b_ub(5),0];
                %����x(7)����Ϊ�㣬�ʲ��������x(6)/x(7)�������������ƣ�
                % ���ڷ�����Լ��nonlcon�н���
                %    0,0,0,0,0,-1,a_lb(6);
                %    0,0,0,0,0,1,-b_ub(6)];
                %b=[0;0;0;0;0;0];
                b=[0;0;0;0];
                lb=[0.5;0;0;0;0;0;0];
                ub=[0.8;1;1;inf;inf;inf;inf];
                p_test = p_temp;
                %������ɶ����ʼֵrx0_tmp���Ա���ֲ�����
                rx0_tmp = zeros(7,1);
                rx_meta_result = zeros(7,1);
                fval_meta_result = inf;
                flag_meta_result = nan; %�����ж���û�еõ������н�
                for j = 1:nums_test_of_initial_value
                    rx0_tmp(1) = rand*(0.8-0.5) + 0.5;
                    rx0_tmp(2) = rand*(1-rx0_tmp(1));
                    rx0_tmp(3) = 1 - rx0_tmp(1) - rx0_tmp(2);
                    rx0_tmp(4) = rand*1000;
                    rx0_tmp(5) = rand*100;
                    rx0_tmp(6) = rand*50;
                    rx0_tmp(7) = rand*10;
                    [rx_tmp,fval_tmp,flag_tmp]= ...
                            fmincon('cpiao',rx0_tmp,...
                                    A,b,Aeq,beq,lb,ub,...
										'nonlcon',[],i+1,p_test,a_lb,b_ub);
					% ��ʽ�������ĸ�������Ϊ�����ֲ�Ʊ������(K1/K2/K3/K4)
					% ��������Ǻ���cpiao��nonlcon�����п���Ҫ�õ�������
                    if (flag_tmp == 1) && (fval_meta_result > fval_tmp)
                        fval_meta_result = fval_tmp;
                        rx_meta_result = rx_tmp;
                        flag_meta_result = 1;
                    end
                end
                % ����õ���ý����������
                rx_all(:,(m-5).*32+(n-28),i) = rx_meta_result;
                fval_all(1,(m-5).*32+(n-28),i) = fval_meta_result;
                flag_all(1,(m-5).*32+(n-28),i) = flag_meta_result;
            else
            % i==3����Ӧ��K4��
                % ����K4�ͣ���ֻ�赽��Ƚ����ʽ�5��������
                Aeq=[1,1,1,0,0];
                beq=1;
                a_lb=[10,4,3,4];
                b_ub=[233,54,17,20];
                A=[ 0,0,0,-1,a_lb(4);
                    0,0,0,1,-b_ub(4)];
                b=[0;0];
                lb=[0.5;0;0;0;0];
                ub=[0.8;1;1;inf;inf];
                p_test = p_temp;
                %������ɶ����ʼֵrx0_tmp���Ա���ֲ�����
                rx0_tmp = zeros(5,1);
                rx_meta_result = zeros(5,1);
                fval_meta_result = inf;
                flag_meta_result = nan; %�����ж���û�еõ������н�
                for j = 1:nums_test_of_initial_value
                    rx0_tmp(1) = rand*(0.8-0.5) + 0.5;
                    rx0_tmp(2) = rand*(1-rx0_tmp(1));
                    rx0_tmp(3) = 1 - rx0_tmp(1) - rx0_tmp(2);
                    rx0_tmp(4) = rand*1000;
                    rx0_tmp(5) = rand*100;
                    [rx_tmp,fval_tmp,flag_tmp]= ...
                            fmincon('cpiao',rx0_tmp,A,b,...
                                    Aeq,beq,lb,ub,'nonlcon',...
										[],4,p_test,a_lb,b_ub);
					% ��ʽ�������ĸ�������Ϊ�����ֲ�Ʊ������(K1/K2/K3/K4)
					% ��������Ǻ���cpiao��nonlcon�����п���Ҫ�õ�������
                    if (flag_tmp == 1) && (fval_meta_result > fval_tmp)
                        fval_meta_result = fval_tmp;
                        rx_meta_result = rx_tmp;
                        flag_meta_result = 1;
                    end
                end
                % ����õ���ý����������
                rx_all(:,(m-5).*32+(n-28),i) = [rx_meta_result;0;0];
                fval_all(1,(m-5).*32+(n-28),i) = fval_meta_result;
                flag_all(1,(m-5).*32+(n-28),i) = flag_meta_result;
                
            end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ѱ�Ž��������н������
% �����У�K1��K2��K3��K4�����������Ŀ�꺯����С��

% �жϣ�K1��K2��K3��K4������һ�ֵ�Ŀ�꺯����С
ind_tmp = (flag_all >= 0);
if sum(sum(sum(ind_tmp))) ~= 0
    % K2��K3��K4��������ҵ��˿��н⣨�����Ž⣩
    val_tmp = fval_all.*ind_tmp;
    [val_tmp2,ind_tmp2] = min(val_tmp);
    [val_min,ind_tmp3] = min(val_tmp2);
    if (flag_k1 < 0)
        % K1�������û�ҵ����н�
        signal = 1;     % ��־����
    else
        if val_min < fval_k1
            signal = 1;
        elseif val_min > fval_k1
            signal = 2;
        else
            signal = 3;
        end
    end
    ;
else
    % K2��K3��K4�������û���ҵ��˿��н�
    if (flag_k1 < 0)
        % K1�������û�ҵ����н�
        disp('(K1��K2��K3��K4)���е������')
        disp('һ�����нⶼû���ҵ�')
        disp('(��������ζ����ȫû�п��н⣬')
        disp('Ҳ���ǳ�ֵ��ѡ�Ĳ������û���ҵ���')
        break;
    else
        signal = 2;
    end
end

if (signal == 1)
    ind_tmp4 = ind_tmp2(ind_tmp3);
    rx_result = rx_all(:,ind_tmp4,ind_tmp3);
    fval_result = fval_all(:,ind_tmp4,ind_tmp3);
    fval_result =-fval_result;
    n = (ind_tmp4 - floor(ind_tmp4 / 32) * 32) + 28;
    m = floor(ind_tmp4 / 32) + 5;
    p_tmp = p_all(:,ind_tmp4,ind_tmp3);
elseif signal == 2
    rx_result = rx_k1;
    fval_result =-fval_k1;
    p_tmp = p_k1;
else    %signal == 3
    ind_tmp4 = ind_tmp2(ind_tmp3);
    rx_result = rx_all(:,ind_tmp4,ind_tmp3);
    fval_result = fval_all(:,ind_tmp4,ind_tmp3);
    fval_result =-fval_result;
    n = (ind_tmp4 - floor(ind_tmp4 / 32) * 32) + 28;
    m = floor(ind_tmp4 / 32) + 5;
end

% ���������
if signal == 1      % ���Ž���K2��K3��K4��ʱ
    if ind_tmp3 == 1
        disp(sprintf('���Ž�Ϊ��K2�ͣ�%dѡ%d',n,m));
    elseif ind_tmp3 == 2
        disp(sprintf('���Ž�Ϊ��K3�ͣ�%dѡ%d+1',n,m));
    elseif ind_tmp3 == 3
        disp(sprintf('���Ž�Ϊ��K4�ͣ�%dѡ%d���ر��',n,m));
    end
elseif signal == 2  % ���Ž���K1��ʱ
    disp(sprintf('���Ž�Ϊ��K1�ͣ�10ѡ6+1'));
else                % K1�Ľ��K2��K3��K4�Ľ��غ�ʱ
    if ind_tmp3 == 1
        disp(sprintf('10ѡ6+1��K2��%dѡ%dͬΪ���Ž�',n,m));
    elseif ind_tmp3 == 2
        disp(sprintf('10ѡ6+1��K3��%dѡ%d+1ͬΪ���Ž�',n,m));
    elseif ind_tmp3 == 3
        disp(sprintf('10ѡ6+1��K4��%dѡ%d���ر��ͬΪ���Ž�',n,m));
    end
end
disp('��Ӧ��Ŀ�꺯��ֵΪ��')
disp(fval_result)
if signal ~= 3
    disp('����������ֵΪ��')
    disp(rx_result)
    disp('������Ľ���ǣ�')
    x=zeros(3,1);
    x(1) = (1-p_tmp(4).*rx_result(4)-...
              p_tmp(5).*rx_result(5)-...
              p_tmp(6).*rx_result(6)-...
              p_tmp(7).*rx_result(7)).*rx_result(1)./p_tmp(1);
    x(2) = (1-p_tmp(4).*rx_result(4)-...
              p_tmp(5).*rx_result(5)-...
              p_tmp(6).*rx_result(6)-...
              p_tmp(7).*rx_result(7)).*rx_result(2)./p_tmp(2);
    x(3) = (1-p_tmp(4).*rx_result(4)-...
              p_tmp(5).*rx_result(5)-...
              p_tmp(6).*rx_result(6)-...
              p_tmp(7).*rx_result(7)).*rx_result(3)./p_tmp(3);
    rx_money=[x;rx_result(4:7)];
    disp(rx_money)
else
    disp('����������ֵΪ��')
    disp('10ѡ6+1ʱ')
    disp(rx_k1)
    disp('K%d��ʱ',ind_tmp3+1)
    disp(rx_result)
end


