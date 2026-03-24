clear all
clc
close all
%% amicable numbers
amicable = [];
count = 0;  
a = 2;  

while count < 5
   
    suma = 0;
    for d = 1:a-1
        if rem(a,d) == 0
            suma = suma + d;
        end
    end
    b = suma;

    if b > a  
      
        sumb = 0;
        for d = 1:b-1
            if rem(b,d) == 0
                sumb = sumb + d;
            end
        end

        if sumb == a
            amicable = [amicable; a b];
            count = count + 1;
        end
    end

    a = a + 1;
end

amicable

%% armstrong numbers
% 
% while length(arm) < 5
%     for i = 1 : 9999
%         tho = floor(i/1000);
%         hun = floor(i/100) - 10*tho;
%         ten = floor(i/10) - 10*hun;
%         one = i - 1000*tho - 100*hun - 10*ten;
% 
%             if tho^1 + hun^1 + ten^1 + one^1 == i
%                 fprintf('n = 1 %d', i)
%             end
% 
%             if tho^2 + hun^2 + ten^2 + one^2 == i
%                 fprintf('n = 2 %d', i)
%             end
%             if tho^3 + hun^3 + ten^3 + one^3 == i
%                 fprintf('n = 3 %d', i)
%             end
% 
%             if tho^4 + hun^4 + ten^4 + one^4 == i
%                 fprintf('n = 4 %d', i)
%             end
%     end
% 
% 
% 
%     end
% 
% 
        

% arm = [];
% i = 1;
% 
% while length(arm) < 5
% 
%     t = i; k = 0;
%     while t > 0
%         t = floor(t/10);
%         k = k + 1;
%     end
%     if i == 0, k = 1; end 
% 
%     if k >= 3
% 
%         t = i; acc = 0;
%         while t > 0
%             d = rem(t,10);
%             acc = acc + d^k;
%             t = floor(t/10);
%         end
% 
%         if acc == i
%             arm(end+1) = i;
%             fprintf('%d is Armstrong (%d-th power)\n', i, k);
%         end
%     end
% 
%     i = i + 1;
% end
% 
% disp(arm)

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
