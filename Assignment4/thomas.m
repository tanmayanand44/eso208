function [R]=thomas(A,B,n)
        l=zeros(1,n-1);
        %line=fgetl(pointer);
        %l(1,2:1:n)=sscanf(line,'%f');
        for i=2:1:n
            l(1,i)=A(i,i-1);
        end
        d=zeros(1,n);
        %line=fgetl(pointer);
        %d(1,1:1:n)=sscanf(line,'%f');
        for i=1:1:n
            d(1,i)=A(i,i);
        end
        u=zeros(1,n-1);
        %line=fgetl(pointer);
        %u(1,1:1:n-1)=sscanf(line,'%f');
        for i=1:1:n-1
            u(1,i)=A(i,i+1);
        end
        b=zeros(1,n);
        b=B';
        v = zeros(n,1);
        y = v;
        w = d(1);
        y(1) = b(1)/w;
        for i=2:n
            v(i-1) = u(i-1)/w;
            w = d(i) - l(i)*v(i-1);
            y(i) = ( b(i) - l(i)*y(i-1) )/w;
        end
        for j=n-1:-1:1
            y(j) = y(j) - v(j)*y(j+1);
        end
        R=y;
        disp(y);
        fname=input('enter output file in single quotes\n');
        fo=fopen(fname,'wt');
        fprintf(fo,'\n temperature is: %f\n',y);
end