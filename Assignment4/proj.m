delx=input('\n enter grid size\n');
%delx=2/grid;
choice=input('\n 1.ghost node\n2.backward difference\n');
if choice==1
    num=2/delx;
    A=zeros(num,num);
    B=zeros(num,1);
    x=0;
    B(1,1)=5;
    plotx=zeros(1,num+1);
    plotx(1,1)=0;
    for i=1:1:num
        x=x+delx;
        plotx(1,1+i)=x;
        coeff0=1/delx^2 + (x+3)/(2*delx*(x+1));
        coeff1=(x+3)/((x+1)^2)-2/delx^2;
        coeff2=1/delx^2-((x+3)/(2*delx*(x+1)));
        f1=2*(x+1)+3*((x+3)/((x+1)^2));
        if(i==1)
            B(i,1)=f1-coeff0*5;
            A(i,i)=coeff1;
            A(i,i+1)=coeff2;
        elseif(i==num)
            B(i,1)=f1;
            A(i,i)=coeff1;
            A(i,i-1)=coeff0+coeff2;
        else
            B(i,1)=f1;
            A(i,i-1)=coeff0;
            A(i,i)=coeff1;
            A(i,i+1)=coeff2;
        end
    end
    R=thomas(A,B,num);
    ploty=vertcat(5,R);
    ploty=ploty.';
    plot(plotx,ploty);
elseif choice==2
    num=2/delx;
    A=zeros(num,num);
    B=zeros(num,1);
    x=0;
    B(1,1)=5;
    plotx=zeros(1,1+num);
    plotx(1,1)=0;
    last=0;
    for i=1:1:num
        x=x+delx;
        plotx(1,1+i)=x;
        coeff0=1/delx^2 + (x+3)/(2*delx*(x+1));
        coeff1=(x+3)/((x+1)^2)-2/delx^2;
        coeff2=1/delx^2-((x+3)/(2*delx*(x+1)));
        f1=2*(x+1)+3*((x+3)/((x+1)^2));
        if(i==1)
            B(i,1)=f1-coeff0*5;
            A(i,i)=coeff1;
            A(i,i+1)=coeff2;
        elseif(i==num)
            B(i,1)=B(i-1,1);
            A(i,i)=A(i-1,i)-3*A(i-1,i-2);
            A(i,i-1)=A(i-1,i-1)+4*A(i-1,i-2);
        else
            B(i,1)=f1;
            A(i,i-1)=coeff0;
            A(i,i)=coeff1;
            A(i,i+1)=coeff2;
        end
    end
    R=thomas(A,B,num);
    ploty=vertcat(5,R);
    ploty=ploty.';
    plot(plotx,ploty);
    
end