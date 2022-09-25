function y=GCPacc1(df,t)
y=df>0|((df/t>-88)&(exp(df/t)>rand(1,1)));
