function [ out ] = miyandar( varargin )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    a = cell2mat(varargin);
    m = ones(1, nargin);
    for i=1:nargin
        for j=1:a(i)
            m(i) = m(i) .* j;
        end
    out = m;
    end
    end

