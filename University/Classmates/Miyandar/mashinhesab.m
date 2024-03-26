function [ out ] = mashinhesab( x, y, op )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

	if (op == '+')
	    out = x+y;

	elseif (op == '*')
	    out = x*y;

	elseif (op == '/')
	    out = x/y;

	elseif (op == '-')
	    out = x-y;

	end

end

