function [ output ] = tribonacci( n )
    if (n==0 ||n==1)
        output =0;
        return;
    end
    if (n==2)
        output =1;
        return;
    end
    
    output=tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3);

end

