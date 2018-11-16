function  [Y] = cubicspline(x,y,X)
n=length(x);
h=zeros(n-1,1);
for i=1:n-1
    h(i,1)=x(i+1,1)-x(i,1);
end

a=zeros(n,n);
a(1,1)=2*h(1,1);
a(1,2)=h(1,1);
a(1,n-1)=h(n-1,1);
a(1,n)=2*h(n-1,1);
a(n,1)=1;
a(n,n)=-1;
for i=2:n-1
    a(i,i-1)=h(i-1,1);
    a(i,i)=2*(h(i-1,1)+h(i,1));
    a(i,i+1)=h(i,1);
end
b=zeros(n,1);
g=zeros(n,1);
for i=2:n
    g(i,1) = (y(i,1)-y(i-1,1))/h(i-1,1);
end
for i=2:n-1
    b(i,1) = 6*(g(i+1,1)-g(i,1));
end
b(1)=-6*((y(n,1)-y(n-1,1))/h(n-1,1)) + (6*(y(2,1) - (y(1,1)))/h(1,1));
sigma=inv(a)*b;
A=zeros(n-1,1);
B=zeros(n-1,1);
C=zeros(n-1,1);
D=zeros(n-1,1);
for i=1:n-1
    A(i,1)=sigma(i+1,1)/(6*h(i,1));
    B(i,1)=sigma(i,1)/(6*h(i,1));
    C(i,1)=(y(i+1,1)/h(i,1))-(sigma(i+1,1)*h(i,1)/6);
    D(i,1)=(y(i,1)/h(i,1))-(sigma(i,1)*h(i,1)/6);
end
i = ones(size(X));
for j=1:n
    i(x(j,1) <= X) = j;
end
Y=A(i,1).*((X-x(i,1)).^3)-B(i,1).*((X-x(i+1,1)).^3)+C(i,1).*(X-x(i,1))-D(i,1).*(X-x(i+1,1));
fileid=fopen('output5.txt','w');
fprintf(fileid,'%s','Interpolated values of y* at given x* ');
fprintf(fileid,'\n');
fprintf(fileid,'%s','Periodic Cubic Spline: ');
fprintf(fileid,'\n');
for i=1:size(X)
    fprintf(fileid,'%.4f %.4f\n',X(i,1),Y(i,1));
end
fclose(fileid);
type('output5.txt');
plot(x,y,'ro');
hold on;
for i=1:n-1
    x1=x(i,1):0.001:x(i+1,1);
    y1=A(i,1).*((x1-x(i,1)).^3)-B(i,1).*((x1-x(i+1,1)).^3)+C(i,1).*(x1-x(i,1))-D(i,1).*(x1-x(i+1,1));
    k=plot(x1,y1,'m');
end
xlabel('x');
ylabel('y');
legend(k,'Periodic Cubic Spline');
end
