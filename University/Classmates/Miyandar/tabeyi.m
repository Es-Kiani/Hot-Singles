function [min1, max1, out1, out2 ] = tabeyi( varargin )
    a = cell2math(varargin);

    disp(min(a));
    disp(max(a));
    min1=min(a);
    max1=max(a);


    m=0;
    for i=1:nargin
       m = m+a(i);
    end
    out1=m./nargin;
    disp(out1);

    p=zeros(1,nargin);
    q=zeros(1,nargin);
    for i=1:nargin
        p(i)=a(i)-out1;
        q(i)=p(i)*p(i);
    end
    out2 =(sum(q)/nargin)^(1/2);
    %% out2  = sqrt(sum(q)/nargin);
    disp(out2);
    
   end