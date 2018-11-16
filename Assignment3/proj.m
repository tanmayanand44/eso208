fname=input('enter filename in single quotes');
fid=fopen(fname);
line=fgetl(fid);
n=sscanf(line,'%f');
%line=fgetl(fid);
x=zeros(1,n);
y=zeros(1,n);
for i=1:1:n
    line=fgetl(fid);
    t=sscanf(line,'%f');
    x(i)=t(1);
    y(i)=t(2);
    %y(i)=sscanf(line,'%f');
end
choice=input('1. Fit a least square polynomial \n2.Fit a Lagrange Interpolation Polynomial a\n3.Fit Cubic splines\n');
if choice==1
    ex=input('\nIntercept y or n\n');
    xx = linspace(-1,1);
    order=input('\n enter order\n');
    poly=polynomial(x',y',order);
    p=poly2sym1(poly);
    fname=input('enter output file in single quotes\n');
    fo=fopen(fname,'wt');
    fprintf(fo,'\n output: solution is: %f\n',p);
    %    plot(x,y,'o')
    %   hold on
    %  plot(xx,y1);
elseif choice==2
    lagrangepoly(x,y,n);
    %p=poly2sym(poly);
    %fplot(p);
    %fname=input('enter output file in single quotes\n');
    %fo=fopen(fname,'wt');
    %fprintf(fo,'\n output: solution is: %f\n',p);
elseif choice==3
    way=input('1.Natural Spline \n2.Not-a-knot\n3.Periodic\n4.Clamped Spline');
    B=[x',y'];
    x=x';
    y=y';
    if way==1
        X=x;
        natural(x,y,X);
        
    end
    
    if way==2
        h=zeros(n-1,1);
        for i=1:n-1
            h(i,1)=B(i+1,1)-B(i,1);
        end
        
        a=zeros(n,n);
        a(1,1)=h(2,1);
        a(1,2)=-(h(1,1)+h(2,1));
        a(1,3)=h(1,1);
        a(n,n-2)=h(n-1,1);
        a(n,n-1)=-(h(n-1,1)+h(n-2,1));
        a(n,n)=h(n-2,1);
        for i=2:n-1
            a(i,i-1)=h(i-1,1);
            a(i,i)=2*(h(i-1,1)+h(i-1,1));
            a(i,i+1)=h(i-1,1);
        end
        b=zeros(n,1);
        g=zeros(n,1);
        for i=2:n
            g(i,1) = (B(i,2)-B(i-1,2))/h(i-1,1);
        end
        for i=2:n-1
            b(i,1) = 6*(g(i+1,1)-g(i,1));
        end
        sigma=inv(a)*b;
        A=zeros(n-1,1);
        B1=zeros(n-1,1);
        C=zeros(n-1,1);
        D=zeros(n-1,1);
        for i=1:n-1
            A(i,1)=sigma(i+1,1)/(6*h(i,1));
            B1(i,1)=sigma(i,1)/(6*h(i,1));
            C(i,1)=(B(i+1,2)/h(i,1))-(sigma(i+1,1)*h(i,1)/6);
            D(i,1)=(B(i,2)/h(i,1))-(sigma(i,1)*h(i,1)/6);
        end
        for i=1:n-1
            coeff=0;
            syms f(x)
            f(x)=A(i,1).*((x-B(i,1)).^3)-B1(i,1).*((x-B(i+1,1)).^3)+C(i,1).*(x-B(i,1))-D(i,1).*(x-B(i+1,1));
            fplot(f,[min(B(i,1),B(i+1,1)+0.01),max(B(i,1),B(i+1,1)+0.01)],'color','b'); hold on;
        end
        plot(B(:,1),B(:,2),'x','color','r');
        hold off;
    end
    if way==3
        B=[x',y'];
        h=zeros(n-1,1);
        for i=1:n-1
            h(i,1)=B(i+1,1)-B(i,1);
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
            g(i,1) = (B(i,2)-B(i-1,2))/h(i-1,1);
        end
        for i=2:n-1
            b(i,1) = 6*(g(i+1,1)-g(i,1));
        end
        b(1)=-6*((B(n,2)-B(n-1,2))/h(n-1,1)) + (6*(B(2,2) - (B(1,2)))/h(1,1));
        sigma=inv(a)*b;
        A=zeros(n-1,1);
        B1=zeros(n-1,1);
        C=zeros(n-1,1);
        D=zeros(n-1,1);
        for i=1:n-1
            A(i,1)=sigma(i+1,1)/(6*h(i,1));
            B1(i,1)=sigma(i,1)/(6*h(i,1));
            C(i,1)=(B(i+1,2)/h(i,1))-(sigma(i+1,1)*h(i,1)/6);
            D(i,1)=(B(i,2)/h(i,1))-(sigma(i,1)*h(i,1)/6);
        end
        for i=1:n-1
            coeff=0;
            syms f(x)
            f(x)=A(i,1).*((x-B(i,1)).^3)-B1(i,1).*((x-B(i+1,1)).^3)+C(i,1).*(x-B(i,1))-D(i,1).*(x-B(i+1,1));
            fplot(f,[min(B(i,1),B(i+1,1)+0.01),max(B(i,1),B(i+1,1)+0.01)],'color','b'); hold on;
        end
        plot(B(:,1),B(:,2),'x','color','r');
        hold off;
    end
    if way==4
        fprintf('enter first derivative value \n')
        s1=input('');
        fprintf('enter second derivative value \n')
        s2=input('');
        h=zeros(n-1,1);
        for i=1:n-1
            h(i,1)=B(i+1,1)-B(i,1);
        end
        a=zeros(n,n);
        a(1,1)=2*h(1,1);
        a(1,2)=h(1,1);
        a(n,n)=2*h(n-1,1);
        a(n,n-1)=h(n-1,1);
        for i=2:n-1
            a(i,i-1)=h(i-1,1);
            a(i,i)=2*(h(i-1,1)+h(i,1));
            a(i,i+1)=h(i,1);
        end
        b=zeros(n,1);
        g=zeros(n,1);
        for i=2:n
            g(i,1) = (B(i,2)-B(i-1,2))/h(i-1,1);
        end
        for i=2:n-1
            b(i,1) = 6*(g(i+1,1)-g(i,1));
        end
        b(1,1)=6*(((B(2,2)-B(1,2))/h(1,1))-s1);
        b(n,1)=6*(((B(n-1,2)-B(n,2))/h(n-1,1)) + s2);
        sigma=inv(a)*b;
        A=zeros(n-1,1);
        B1=zeros(n-1,1);
        C=zeros(n-1,1);
        D=zeros(n-1,1);
        for i=1:n-1
            A(i,1)=sigma(i+1,1)/(6*h(i,1));
            B1(i,1)=sigma(i,1)/(6*h(i,1));
            C(i,1)=(B(i+1,2)/h(i,1))-(sigma(i+1,1)*h(i,1)/6);
            D(i,1)=(B(i,2)/h(i,1))-(sigma(i,1)*h(i,1)/6);
        end
        fileId = fopen('output2.txt','w');
        fprintf(fileId,'Coefficient are :\r\n');
        for i=1:n-1
            coeff=0;
            syms f(x)
            f(x)=A(i,1).*((x-B(i,1)).^3)-B1(i,1).*((x-B(i+1,1)).^3)+C(i,1).*(x-B(i,1))-D(i,1).*(x-B(i+1,1));
            %
            coeff=collect(f(x));
            disp(coeff);
            fprintf(fileId,'%s\r\n',char(coeff));
            fprintf(fileId,'\r\n');
            
            fplot(f,[min(B(i,1),B(i+1,1)+0.01),max(B(i,1),B(i+1,1)+0.01)],'color','b');hold on; 
        end
        fclose(fileId);
        plot(B(:,1),B(:,2),'x','color','r');
        hold off;
    end
    
    
    
end

