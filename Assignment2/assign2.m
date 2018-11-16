filechoice=input('enter filename in single quotes \n');
% disp(filechoice);
% edit filechoice;
pointer=fopen(filechoice);
line=fgetl(pointer);
n=sscanf(line,'%f');
A =zeros(n,n);
for i=1:1:n
    line=fgetl(pointer);
    A(i,1:1:n)=sscanf(line,'%f');
end;
maxerror=input('maximun error\n');
choice1=input(' largest eigenvalue (L) or all eigenvalues (A):\n');
if choice1==1
    curerror=1234;
    z = zeros(n,1);
    y = zeros(n,1);
    z(1,1)=1;
    while(curerror>maxerror)
        y=A*z;
        mod=0;
        for i=1:1:n
            mod=mod+y(i,1)^2;
        end
        mod=sqrt(mod);
        for i=1:1:n
            y(i,1)=y(i,1)/mod;
        end
        eigenvector=A*y;
        eigenval=0;
        max=0;
        ind=0;
        for i=1:1:n
            eigenval=eigenval+eigenvector(i,1)^2;
            if y(i,1)^2>max^2;
                max=abs(z(i,1));
                ind=i;
                
            end;
        end;
        eigenval=sqrt(eigenval);
        curerror=abs((y(ind,1)-z(ind,1))/y(ind,1));
        z=y;
    end;
    %           disp(A*y);
    y=A*z;
    ymod = 0;
    for i=1:1:n
        ymod = ymod + y(i,1)^2;
    end;
    eigenvalue = sqrt(ymod);
    disp(eigenvalue);
    fname=input('enter output file in single quotes\n');
    fo=fopen(fname,'w');
    %           fdisp(fo,'');
    fprintf(fo,'\npower method output: largest eigen value is: %f\n',eigenvalue);
    %           fdisp(fo,eigenval)
else
    error = 100;
    while (error>maxerror)
        Q = zeros(n,n);
        for i=1:n
            if i==1
                ymod=0;
                for j=1:n
                    ymod = ymod + A(j,1)^2;
                end;
                ymod = sqrt(ymod);
                Q(:,1) = A(:,1)./ymod;
            else
                Q(:,i) = A(:,i);
                for k=1:i-1
                    Q(:,i) = Q(:,i) - ((A(:,i)')*Q(:,k)).*Q(:,k);
                end;
                ymod=0;
                for j=1:1:n
                    ymod = ymod + Q(j,i)^2;
                end;
                ymod = sqrt(ymod);
                Q(:,i) = Q(:,i)./ymod;
            end;
        end;
        R = Q'*A;
        B = R*Q;
        curerror=0;
        for i=1:1:n
            t=(abs((A(i,i)-B(i,i)))*100/B(i,i));
%             curerror = curerror>t ? curerror:t;
            if(curerror<t)curerror=t;
%             else curerror
            end
        end;
        A = B;
        error = curerror;
    end;
    eigenvalue=zeros(1,n);
    for i=1:n
        eigenvalue(1,i) = A(i,i);
    end;
    disp(eigenvalue);
    fname=input('enter output file in single quotes\n');
    fo=fopen(fname,'w');
    fprintf(fo,'\npower method output: eigen value is: %f\n',eigenvalue);
    
end;




