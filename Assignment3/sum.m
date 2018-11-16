function [s] = sum(B,k,n,p)
	s=0;
	for i=1:n
		s=s+(B(i,k).^p);
	end
end