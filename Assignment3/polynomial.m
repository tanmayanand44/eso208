function [q,r]= polynomial( x,y,p )
n=size(x);
a=zeros(p+1,p+1);
    for i = 1:p+1
        for j=1:i
            k=i+j-2;
            sum=0;
            for l=1:n
                sum=sum+(x(l,1)^k);
            end
            a(i,j)=sum;
            a(j,i)=sum;
        end
        sum=0;
        for l=1:n
            sum=sum+y(l,1)*(x(l,1)^(i-1));
        end
        b(i,1)=sum;
    end            
plot(x,y,'ro');
hold on;
x1=floor(min(x)):0.001:ceil(max(x));
q=inv(a)*b;
y1=q(1);
for i= 2:length(q)
    y1=y1+q(i,1)*(x1.^(i-1));
end
l=plot(x1,y1,'k');
xlabel('x');
ylabel('y');
legend(l,'Least Square Fit');
y1= q(1,1);
for i= 2:length(q)
    y1=y1+q(i,1)*(x.^(i-1));
end
s0=0;
yavg=b(1,1)/max(n);
s1=0;
for i =1:n
    s0=s0+(y(i)-yavg)^2;
    s1=s1+(y(i)-y1(i))^2;
end
r=1-(s1/s0);
fileid=fopen('output.txt','w');
fprintf(fileid,'%s','Coefficients of Polynomial: ');
for i=1:max(size(q))
    fprintf(fileid,'% .3f ',q(i,1));
end
%fprintf(fileid,'\n%s','R-sq = ');
fprintf(fileid,'%f ',r);
fclose(fileid);
type('output.txt');
end