function [ out1, out2, text ] = matris(a)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

	k = size(a);
	k = k(1);
	out1 = 0;

	for i=1:k
	    out1 = out1 + a(i,2);
	end
	
	

	m = 0;
	for i=1:k
	    m = m + a(i,1);
	end
	out2 = m./out1;
	
	

	if ((out2(1) > 0) && (out2(1) < 10))
	    text = 'Gav';

	elseif (out2(1) == 20)
	    text = 'Gol';

	end
    

end

