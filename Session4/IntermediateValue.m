function [answer] = IntermediateValue(interval, f)
    if f(interval(1)) <= 6 && f(interval(2)) >= 6
        answer = true;
        return
    end
    answer = false;
end
    

