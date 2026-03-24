clear all
clc
close all
%% 
prime = [];
for i = 2 : 100
    div = [];
    for n = 1 : i
        if rem(i,n) == 0
            div(end+1) = n;
        end
    end
    if length(div) == 2
        prime(end+1) = i;            
    end       
end



for even = 6:2:100
    for i = 1 : length(prime)
         for n = i : length(prime)
             if prime(i) + prime(n) == even
                 fprintf('%d = %d + %d\n', even, prime(i), prime(n));
             end
         end
    end
end

    


%% 약한추측
prime =[];
for i = 2 : 100
    div = [];
    for n = 1 : i
        if rem(i,n) == 0
            div(end+1) = n;
        end
    end

    if length(div) == 2
        prime(end+1) = i;
    end
end


for odd = 5:2:49
    for i = 1 : length(prime)
        for j = i : length(prime)
            for k = j : length(prime)
                if prime(i) + prime(j) + prime(k) == odd
                    fprintf('%d = %d + %d + %d\n', odd, prime(i), prime(j), prime(k));
                end
            end
        end
    end
end

          

    

    
         
    
    


