clear all
clc
close all


%% armstrong numbers
arm = [];
i = 1;  

while length(arm) < 7 && i <= 9999
   
    tho = floor(i/1000);                     
    hun = floor(i/100) - 10*tho;            
    ten = floor(i/10)  - 10*floor(i/100); 
    one = i - 10*floor(i/10);            

    
    if tho^3 + hun^3 + ten^3 + one^3 == i
        fprintf('n = 3   %d\n', i);
        arm(end+1) = i;
    
    elseif tho^4 + hun^4 + ten^4 + one^4 == i
        fprintf('n = 4   %d\n', i);
        arm(end+1) = i;
    end

    i = i + 1;  
end

disp(arm)
