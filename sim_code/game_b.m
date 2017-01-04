clear
epsilon=-.005;
total_Nth_turn = zeros(1,100);  %vector which will store the average
                                %winnings each of the 100 coin flips
                                %in each experiment
                                
for loop=1:10000                %repeat experiment 10000 times
    m = 0; 
    runningtotal = zeros(1,100);            %vector to store M, the amount of money in your pocket at each of 100 coin flips
    for flips = 1:100                       %flip a coin 100 times
        if rem(m,3)==0                      %decide if M is divisible by 3
            outcome = rand;                 
            if outcome < 0.9 + epsilon     
                 m = m +1 ;                 %you win----M divisible by 3
            else 
                 m = m- 1;                  %you lose---M divisible by 3
            end 
        else 
            outcome = rand; 
            if outcome < 0.25 + epsilon    
                m = m + 1;                  %you win--M not divisible by 3
            else 
                m = m- 1;                   %you lose--M not divisible by 3
            end 
        end 
        runningtotal(flips) = m;            %remember how much M a this coin flip
    end
    total_Nth_turn = total_Nth_turn + runningtotal;   %compare what happened on this turn with all the other experiments
end 
total_Nth_turn=total_Nth_turn/10000;  
plot(total_Nth_turn)                        %plot what M is on the Nth turn (averaged over 10000 experiments)