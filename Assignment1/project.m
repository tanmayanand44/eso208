p=input('polynomial?\n','s');
if p=='N' | p=='n'
    disp('Choices available:  1 Bisection  2 False-position 3 Fixed-Point 4 Newton-Raphson  5 Secant ');
    choice = input('choose from above\n');
    if choice == 1,
        x1=input('lower x coordinate\n');
        x2=input('higher x coordinate\n');
        f='@(x)';
        funct = input('equation in x:\n','s');
        fun=strcat(f,funct);
        func=str2func(fun);
        y1=func(x1);
        y2=func(x2);
        fplot(func);
        %       t=func(4);
        %       disp(t);
        iter=input('number of iterations\n');
        maxerror=input('maximum error\n');
        curerror=100000.0;
        flag=0;
        prevxm=x1;
        xmid=(x1+x2)/2;
        disp(maxerror);
        i=1;
        error(1)=1213;
        while(curerror>maxerror)
            xmid=(x1+x2)/2;
            ymid=func(xmid);
            if(ymid*y1<0)
                y2=ymid;
                x2=xmid;
                curerror=abs(prevxm-xmid)/prevxm;
                prevxm=xmid;
            else
                y1=ymid;
                x1=xmid;
                curerror=abs(prevxm-xmid)/prevxm;
                prevxm=xmid;
                error(i)=curerror;
            end
            i=i+1;    
        end
        plot(error);
        display('solution is x=');
        disp(xmid);
    end;
    
    if choice==2,
        x1=input('lower x coordinate\n');
        x2=input('higher x coordinate\n');
        f='@(x)';
        funct = input('equation in x:\n','s');
        fun=strcat(f,funct);
        func=str2func(fun);
        y1=func(x1);
        y2=func(x2);
        fplot(func);
        %       t=func(4);
        %       disp(t);
        iter=input('number of iterations\n');
        maxerror=input('maximum error\n');
        curerror=100000.0;
        flag=0;
        prevxm=x1;
        xmid=(x1+x2)/2;
        disp(maxerror);
        i=1;
        error(1)=1213;
        while(curerror>maxerror)
%             disp('h');
%             disp(curerror);
            xmid = x2 - y2*((x2-x1)/(y2-y1));
            ymid=func(xmid);
            if(ymid*y1<0)
                y2=ymid;
                x2=xmid;
                curerror=abs(prevxm-xmid)/prevxm;
                prevxm=xmid;
            else
                y1=ymid;
                x1=xmid;
                curerror=abs(prevxm-xmid)/prevxm;
                prevxm=xmid;
                error(i)=curerror;
            end
        end
        plot(error);
        display('solution is x=');
        disp(xmid);
        
    end;
    if choice==3,
        x1=input('starting coordinate\n');
        %       x2=input('higher x coordinate\n');
        f='@(x)';
        funct = input('equation in x=:\n','s');
        fun=strcat(f,funct);
        func=str2func(fun);
        y1=func(x1);
        fplot(func);
        %       y2=func(x2);
        %       t=func(4);
        %       disp(t);
        iter=input('number of iterations\n');
        maxerror=input('maximum error\n');
        curerror=100000.0;
        flag=0;
        prevxm=100;
        xs=func(x1);
        disp(maxerror);
        i=1;
        error(1)=1213;
        while(curerror>maxerror)
            disp('h');
            disp(curerror);
            xs=func(xs);
            %           ymid=func(xmid);
            %           if(ymid*y1<0)
            %               y2=ymid;
            %               x2=xmid;
            curerror=abs(prevxm-xs)/prevxm;
            prevxm=xs;
            error(i)=curerror;
            i=i+1;
            %           else
            %               y1=ymid;
            %               x1=xmid;
            %               curerror=abs(prevxm-xmid)/prevxm;
            %               prevxm=xmid;
            %           end
        end
        plot(error);
        display('solution is x=');
        disp(xs);
        
    end;
    if choice==4,
        x1=input('starting coordinate\n');
        %       x2=input('higher x coordinate\n');
        f='@(x)';
        funct = input('equation in x:\n','s');
        fun=strcat(f,funct);
        func=str2func(fun);
        f='@(x)';
        fun = input('derivative equation in x:\n','s');
        deri=strcat(f,fun);
        der=str2func(deri);
        y1=func(x1);
        %       y2=func(x2);
        %       t=func(4);
        %       disp(t);
        iter=input('number of iterations\n');
        maxerror=input('maximum error\n');
        curerror=100000.0;
        flag=0;
        prevxm=10;
        xs=x1;
        disp(maxerror);
        i=1;
        error(1)=1213;
        while(curerror>maxerror)
            disp('h');
            disp(curerror);
            xs=xs-(func(xs)/der(xs));
            %           ymid=func(xmid);
            %           if(ymid*y1<0)
            %               y2=ymid;
            %               x2=xmid;
            curerror=abs(prevxm-xs)/prevxm;
            prevxm=xs;
            error(i)=curerror;
            i=i+1;
            %           else
            %               y1=ymid;
            %               x1=xmid;
            %               curerror=abs(prevxm-xmid)/prevxm;
            %               prevxm=xmid;
            %           end
        end
        plot(error);
        display('solution is x=');
        disp(xs);
        
    end;
    if choice==5,
        x1=input('lower x coordinate\n');
        x2=input('higher x coordinate\n');
        f='@(x)';
        funct = input('equation in x:\n','s');
        fun=strcat(f,funct);
        func=str2func(fun);
        fplot(func);
        y1=func(x1);
        y2=func(x2);
        fplot(func);
        %       t=func(4);
        %       disp(t);
        iter=input('number of iterations\n');
        maxerror=input('maximum error\n');
        curerror=100000.0;
        flag=0;
        prevxm=x1;
        %       xmid=(x1+x2)/2;
        disp(maxerror);
        i=1;
        error(1)=1213;
        while(curerror>maxerror)
            disp('h');
            disp(curerror);
            xmid=x2 - y2*((y2-y1)/(x2-x1));
            ymid=func(xmid);
            if(ymid*y1<0)
                y2=ymid;
                x2=xmid;
                curerror=abs(prevxm-xmid)/prevxm;
                prevxm=xmid;
            else
                y1=ymid;
                x1=xmid;
                curerror=abs(prevxm-xmid)/prevxm;
                prevxm=xmid;
            end
            error(i)=curerror;
            i=i+1;
        end
        plot(error);
        display('solution is x=');
        disp(xmid);
        
    end;
    
    
end;
if p=='y' |p=='Y'
    choice=input('Choices available:\n1Muller \n2Bairstow \n');
    if choice==1
        n=input('degree of polynomial\n');
        coef=zeros(1,n+1);
        for i=0:n
           fprintf('x^%d coefficient: ',i);
           coef(1,i+1)=input('');
        end;
        x3 = input('Enter the smaller point\n');
        x2 = input('Enter the middle point\n');
        x1 = input('Enter the larger point\n');
        maxiter=input('Maximum iterations\n');
        maxerror = input('maximun error');
        xlabel('x');
        ylabel('f(x)');
        y1=firstdivided(n,coef,x1);
        y2=firstdivided(n,coef,x2);
        y3=firstdivided(n,coef,x3);
        a=(((y1-y2)/(x1-x2))-((y2-y3)/(x2-x3)))/(x1-x3);
        b=((y1-y2)/(x1-x2))+a*(x1-x2);
        c=y1;
        curerror=98989;
        error(1)=98989;
        iter=0;
        previosx1=111;
        flag=0;
        del=0;
        disp(maxerror);
        while (curerror>maxerror)
            del1 = -2*c/(b+sqrt(b^2-4*a*c));
            del2 = -2*c/(b-sqrt(b^2-4*a*c));
            if abs(del1)<abs(del2)
                del = del1;
            else
                del = del2;
            end;
            x3=x2;
            x2=x1;
            x1= x1+del;
            if flag==1
                curerror=abs((previosx1-x1)*100/x1);
            end;
            flag=1;
            previosx1=x1;
            y1=firstdivided(n,coef,x1);
            y2=firstdivided(n,coef,x2);
            y3=firstdivided(n,coef,x3);
            c=y1;
            a=(((y1-y2)/(x1-x2))-((y2-y3)/(x2-x3)))/(x1-x3);
            b=((y1-y2)/(x1-x2))+a*(x1-x2);
            iter=iter+1;
            error(iter)=curerror;
        end;
        plot(error);
        display('solution is x=');
        disp(x1);
    end;
    if choice == 2
        n=input('degree of polynomial\n');
        coef=zeros(1,n+1);
        for i=0:n
           fprintf('x^%d coefficient: ',i);
           coef(1,i+1)=input('');
        end;
        r = input('Enter r\n');
        s = input('Enter s\n');
        maxiter=input('Max iterations\n');
        maxerror = input('Max error \n');
        error=100;
        ploterror(1)=98989;
        iter=0;
        c=zeros(1,n+1);
        del=zeros(1,n);
        while (error>maxerror) && (iter<maxiter)
            c(1,n+1)=coef(1,n+1);
            c(1,n)=coef(1,n)+s*c(1,n+1);
            for i=n-1:-1:1
                c(1,i) = coef(1,i)+s*c(1,i+1)+r*c(1,i+2);
            end;
            del(1,n) = c(1,n+1);
            del(1,n-1) = c(1,n)+s*del(1,n);
            for j=n-2:-1:1
                del(1,j) = c(1,j+1)+s*del(1,j+1)+r*del(1,j+2);
            end;
            del_r = (del(1,1)*c(1,2)-del(1,2)*c(1,1))/(del(1,2)*del(1,2)-del(1,1)*del(1,3));
            del_s = (del(1,3)*c(1,1)-del(1,2)*c(1,2))/(del(1,2)*del(1,2)-del(1,1)*del(1,3));
            r=r+del_r;
            s=s+del_s;
            if abs(del_r) > abs(del_s)
                error = del_s/s;
            else
                error = del_r/r;
            end;
            error = abs(error)*100;
            ploterror(iter+1)=error;
            iter= iter + 1;
            flag=1;
        end;
        root1 = 0.5*(s+sqrt(s*s+4*r));
        root2 = 0.5*(s-sqrt(s*s+4*r));
        display('root x=');
        disp(root1);
        display('root x=');
        disp(root2);
        plot(ploterror);
    end;
end;
