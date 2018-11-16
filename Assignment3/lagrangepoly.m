function lagrangepoly(x,y,n)
delden = ones(1,n);
r = zeros(1,n-1);
polf = zeros(1,n);

for i = 1:n
    c = 1;
    for j = 1:n
        if j~= i
            r(c) = x(j);
            delden(i) = delden(i)/(x(i)-x(j));
            c = c + 1;
        end
    end
    polf = polf + (y(i) * delden(i) * poly(r));
end

% Writing to output file
fileID = fopen('output.txt', 'w');
fprintf(fileID, 'The interpolated polynomial is:\n\n');
for i = 1:(n-2)
    fprintf(fileID,'%fx^{%i} +  ',polf(i),n-i);
end
fprintf(fileID,'%fx +  %f',polf(n-1),polf(n));

scatter(x,y)
title('Lagrange Interpolation Polynomial');
xlabel('x');
ylabel('f(x)');
hold on
newx = linspace(x(1),x(n),10*n);
plot(newx,polyval(polf,newx))
hold off
fclose(fileID);
end