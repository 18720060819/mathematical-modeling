syms x
dy=diff(log((x+2)/(1-x)),3);
dy=simple(dy)  %�Է��ź������л���
pretty(dy)     %Latex��ʽ��ʾ
