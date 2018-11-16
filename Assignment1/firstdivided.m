function y = firstdivided (n, coef,x)
  y=0;
  for k=1:n+1
    y=y+coef(1,k)*x^(k-1);
  end;