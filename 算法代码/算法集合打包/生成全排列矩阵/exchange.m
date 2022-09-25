%±àĞ´exchangeÃüÁî¼¯mÎÄ¼ş
for m=1:(N-1)
   if a(m)<a(m+1)
      x=m
   end
end
if x~=0
   for m=x:N
      if a(x)<=a(m)
         g=m
         
      end
   end
   [a(x),a(g)]=swap(a(x),a(g))
   for m=(x+1):N
      if m~=N+x+1-m
         [a(m),a(N+x+1-m)]=swap(a(m),a(N+x+1-m))
      end
      if (m+1)*2>(N+x+1)
         break
      end
   end
end

