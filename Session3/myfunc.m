    function [ z_phase ] = myphase( z )
    % This function returns the phase of the complex number z

    z_phase = angle(z);

    end
%{
    function [ out ] = SortVec( m )
    % This function returns the phase of the complex number z
    n=m.size()
    for i=1:n
        for j=i:n
            if(m(j)<m(i))
                temp=m(j);
                m(j)=m(i);
                m(i)=temp;
            end
        end
    end
    out =m
    end

%}