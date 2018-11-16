choice=input('1. Solve a System of Equation \n 2.Perform a LU decomposition \n3. Perform a Matrix Inversion\n');
if choice==1
    choice1=input('1.Tri-diagonal\n2.otherwise\n');
    if choice1==1
        filechoice=input('enter filename in single quotes \n');
        % disp(filechoice);
        pointer=fopen(filechoice);
        line=fgetl(pointer);
%         line=fgetl(pointer);

        n=sscanf(line,'%f');
        %         A =zeros(n,n);
        %         for i=1:1:n
        %             line=fgetl(pointer);
        %             A(i,1:1:n)=sscanf(line,'%f');
        %         end;
        l=zeros(1,n-1);
        line=fgetl(pointer);
        l(1,2:1:n)=sscanf(line,'%f');
        d=zeros(1,n);
        line=fgetl(pointer);
        d(1,1:1:n)=sscanf(line,'%f');
        u=zeros(1,n-1);
        line=fgetl(pointer);
        u(1,1:1:n-1)=sscanf(line,'%f');
        b=zeros(1,n);
        line=fgetl(pointer);
        b(1,1:1:n)=sscanf(line,'%f');
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
        disp(y);
        fname=input('enter output file in single quotes\n');
        fo=fopen(fname,'wt');
        fprintf(fo,'\n output: solution is: %f\n',y);
    else
        filechoice=input('enter filename in single quotes \n');
        % disp(filechoice);
        pointer=fopen(filechoice);
        line=fgetl(pointer);
        n=sscanf(line,'%f');
        A =zeros(n,n);
        for i=1:1:n
            line=fgetl(pointer);
            A(i,1:1:n)=sscanf(line,'%f');
        end;
        B=zeros(1,n);
        line=fgetl(pointer);
        B(1,1:1:n)=sscanf(line,'%f');
        maxerror=input('maximun error\n');
        X=inv(A)*B';
        disp(X);
        fname=input('enter output file in single quotes\n');
        fo=fopen(fname,'wt');
        fprintf(fo,'\n output: solution is: %f\n',X);
    end
elseif choice==2
    choice2=input('1.symmetric and defionite\n2.otherwise\n');
    if choice2==1
        filechoice=input('enter filename in single quotes \n');
        % disp(filechoice);
        pointer=fopen(filechoice);
        line=fgetl(pointer);
        n=sscanf(line,'%f');
        A =zeros(n,n);
        for i=1:1:n
            line=fgetl(pointer);
            A(i,1:1:n)=sscanf(line,'%f');
        end
        b=zeros(1,n);
        line=fgetl(pointer);
        b(1,1:1:n)=sscanf(line,'%f');
        M=A;
        fname=input('enter output file in single quotes\n');
        fid=fopen(fname,'wt');
        L = zeros( n, n );
        for i=1:n
            L(i, i) = sqrt(M(i, i) - L(i, :)*L(i, :)');
            for j=(i + 1):n
                L(j, i) = (M(j, i) - L(i,:)*L(j ,:)')/L(i, i);
                fprintf(fid,'\n next step\n');
                for ii = 1:size(L,1)
                    fprintf(fid,'%g\t',L(ii,:));
                    fprintf(fid,'\n');
                end
            end
            disp(L);
            %             for ii = 1:size(A,1)
            %                 fprintf(fid,'%g\t',A(ii,:));
            %                 fprintf(fid,'\n');
            %             end
        end
        
    else
        filechoice=input('enter filename in single quotes \n');
        % disp(filechoice);
        pointer=fopen(filechoice);
        line=fgetl(pointer);
        n=sscanf(line,'%f');
        A =zeros(n,n);
        for i=1:1:n
            line=fgetl(pointer);
            A(i,1:1:n)=sscanf(line,'%f');
        end
        fname=input('enter output file in single quotes\n');
        fid=fopen(fname,'wt');
        m=n;
        U=zeros(m);
        L=zeros(m);
        for j=1:m
            L(j,j)=1;
        end
        for j=1:m
            U(1,j)=A(1,j);
        end
        for i=2:m
            for j=1:m
                for k=1:i-1
                    s1=0;
                    if k==1
                        s1=0;
                    else
                        for p=1:k-1
                            s1=s1+L(i,p)*U(p,k);
                        end
                    end
                    L(i,k)=(A(i,k)-s1)/U(k,k);
                    fprintf(fid,'\n next step for L\n');
                    for ii = 1:size(L,1)
                        fprintf(fid,'%g\t',L(ii,:));
                        fprintf(fid,'\n');
                    end
                end
                for k=i:m
                    s2=0;
                    for p=1:i-1
                        s2=s2+L(i,p)*U(p,k);
                    end
                    U(i,k)=A(i,k)-s2;
                    fprintf(fid,'\n next step for U\n');
                    for ii = 1:size(U,1)
                        fprintf(fid,'%g\t',U(ii,:));
                        fprintf(fid,'\n');
                    end
                end
            end
        end
        disp(U);
        disp(L);
        disp(L*U);
    end
elseif choice==3
    filechoice=input('enter filename in single quotes \n');
    % disp(filechoice);
    pointer=fopen(filechoice);
    line=fgetl(pointer);
    n=sscanf(line,'%f');
    A =zeros(n,n);
    for i=1:1:n
        line=fgetl(pointer);
        A(i,1:1:n)=sscanf(line,'%f');
    end
    B=inv(A);
    disp(B);
    fname=input('enter output file in single quotes\n');
    fo=fopen(fname,'wt');
    fprintf(fo,'\n inverse is: %f\n',B);
else disp('invalid');
end